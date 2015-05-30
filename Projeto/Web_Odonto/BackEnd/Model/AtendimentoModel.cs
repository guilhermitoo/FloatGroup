using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;
using System.Data.Linq.Mapping;


namespace BackEnd.Model
{
    public class AtendimentoModel
    {
        public AtendimentoModel() { }

        public bool Inserir(atendimento a)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<atendimento> tabelaAtendimento = db.GetTable<atendimento>();
                tabelaAtendimento.InsertOnSubmit(a);
                tabelaAtendimento.Context.SubmitChanges();

                return true;
            }
            catch
            {
                return false;
            }
        }


        public atendimento Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<atendimento> tabelaAtendimento = db.GetTable<atendimento>();
                return tabelaAtendimento.First(p => p.id == id);
            }
        }

        public List<atendimento> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<atendimento> tabelaAtendimento = db.GetTable<atendimento>();
                return tabelaAtendimento.ToList();
            }
        }

        public bool InserirItem(itemAtendimento a)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<itemAtendimento> tbItemAtendimento = db.GetTable<itemAtendimento>();
                if (a != null)
                {
                    db.cadItemAtendimento(a.atendimento_id, a.procedimento_id, a.qtd);
                    tbItemAtendimento.Context.SubmitChanges();
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool MudarStatus(int id, int status)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                //                Table<atendimento> tabelaAtendimento = db.GetTable<atendimento>();
                String sSql = " update atendimentos set status = " + status.ToString() +
                                " where id = " + id.ToString();
                var query = db.ExecuteCommand(sSql);

                return true;
            }
            catch
            {
                return false;
            }
        }

        public v_agenda AgendamentoObter(int id, String tipo)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql =   "select * from v_agenda where id = " + id.ToString() +
                                " and tipo = '"+ tipo +"' ";

                var query = db.ExecuteQuery<v_agenda>(sSql);

                return query.ToList().First();
            }

        }
    }
}
