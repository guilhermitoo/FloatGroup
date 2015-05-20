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
    }
}
