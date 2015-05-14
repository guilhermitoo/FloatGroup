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

        public bool InserirAtualizar(avaliacao a)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<avaliacao> tabelaAvaliacao = db.GetTable<avaliacao>();
                if (a.id == 0)
                {
                    db.cadAvaliacao(a.data, a.dentista_id, a.paciente_id);
                    tabelaAvaliacao.Context.SubmitChanges();
                }
                else
                {
                    db.alteraAvaliacao(a.id,a.data, a.dentista_id, a.paciente_id);
                    tabelaAvaliacao.Context.SubmitChanges();
                }
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

        /*public List<avaliacao> ListarPorPaciente(int pId)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select T.*"+
                              " from tratamentos T"+
                              " join avaliacoes A on ( T.avaliacao_id = A.id )"+
                              " join pacientes P on ( A.paciente_id = P.pessoa_id )"+
                              " where P.pessoa_id = " + pId.ToString() +
                              " and T.status = 2 ";
                var query = db.ExecuteQuery<tratamento>(sSql);
                return query.ToList();
            }
        }*/
    }
}
