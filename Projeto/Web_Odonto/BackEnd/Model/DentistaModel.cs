using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class DentistaModel
    {        
        public DentistaModel() {}

        public bool InserirAtualizar(dentista d)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                // verifica se tem dentista com essa ID
                // se sim, atualiza
                // se não, cadastra
                if (Verifica(d.pessoa.id))
                {// ATUALIZA
                    db.alteraDentista(d.pessoa.id, d.cro, d.salario);
                    tabelaDentista.Context.SubmitChanges();
                }
                else
                {// CADASTRA
                    db.cadDentista(d.pessoa.id, d.cro, d.salario);
                    tabelaDentista.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(dentista dentista)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<dentista> tabelaDentista = db.GetTable<dentista>();
                    tabelaDentista.DeleteOnSubmit(tabelaDentista.First(p => p.pessoa.id == dentista.pessoa.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public dentista Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                return tabelaDentista.First(p => p.pessoa.id == id);
            }
        }

        public List<dentista> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                return tabelaDentista.ToList();
            }

        }

        public bool Verifica(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from dentistas where pessoa_id = " + id;
                var query = db.ExecuteQuery<dentista>(sSql);
                // retorna true se achou algum dentista com esse id
                return (query.ToList().Count > 0);                                 
            }           
        }

        public bool VerificaHorario(DateTime horario,int idDentista)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql;
                sSql = " select A.* from avaliacoes A" +
                " where A.dentista_id = " + idDentista.ToString() +
                " and A.data = '" + horario.ToString() + "' ";
                var queryAval = db.ExecuteQuery<avaliacao>(sSql);

                sSql = " select AT.* from atendimentos AT " +
                " where AT.dentista_id = " + idDentista.ToString() +
                " and AT.data = '" + horario.ToString() + "' ";

                var queryAtend = db.ExecuteQuery<avaliacao>(sSql);
                // retorna true se não encontrar avaliacoes/atendimentos nesse horario para esse dentista,
                // ou seja, o horário dele está livre
                return ( (queryAval.ToList().Count < 1) && (queryAtend.ToList().Count < 1) );
            }
        }

        //public List<v_agenda> Agenda(
        
    }//final
}