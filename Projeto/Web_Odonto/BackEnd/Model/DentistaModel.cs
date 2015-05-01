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
    }//final
}