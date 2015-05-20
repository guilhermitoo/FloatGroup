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
    public class AvaliacaoModel
    {
        public AvaliacaoModel() { }

        public bool Inserir(avaliacao a)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<avaliacao> tabelaAvaliacao = db.GetTable<avaliacao>();                                
                db.cadAvaliacao(a.data, a.dentista_id, a.paciente_id);
                tabelaAvaliacao.Context.SubmitChanges();
                
                return true;
            }
            catch
            {
                return false;
            }
        }


        public avaliacao Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<avaliacao> tabelaAvaliacao = db.GetTable<avaliacao>();
                return tabelaAvaliacao.First(p => p.id == id);
            }
        }

        public List<avaliacao> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<avaliacao> tabelaAvaliacao = db.GetTable<avaliacao>();
                return tabelaAvaliacao.ToList();
            }
        }

        public List<avaliacao> ListarPorDentista(int pId)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select A.* " +
                              " from avaliacoes A " +
                              " join pacientes P on ( A.id = P.pessoa_id ) " +
                              " where A.paciente_id = " + pId;
                var query = db.ExecuteQuery<avaliacao>(sSql);
                return query.ToList();
            }
        }
    }
}
