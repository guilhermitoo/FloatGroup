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

        public bool InserirAtualizar(atendimento a)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<atendimento> tabelaAtendimento = db.GetTable<atendimento>();
                if (a.id == 0)
                {
                    db.cadAtendimento(a.data, a.status, a.dentista_id, a.tratamento_id);
                    tabelaAtendimento.Context.SubmitChanges();
                }
                else
                {
                    db.alteraAtendimento(a.id,a.data, a.status, a.dentista_id, a.tratamento_id);
                    tabelaAtendimento.Context.SubmitChanges();                   
                }
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
    }
}
