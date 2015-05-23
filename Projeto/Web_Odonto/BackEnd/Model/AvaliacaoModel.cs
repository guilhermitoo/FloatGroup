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

        public bool MudarStatus(int id,int status)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<avaliacao> tabelaAvaliacao = db.GetTable<avaliacao>();
                String sSql = " update avaliacoes set status = " + status.ToString() +
                                " where id = " + id.ToString();
                var query = db.ExecuteCommand(sSql);

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

        public List<avaliacao> ListarPorPaciente(int pIdPaciente)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select A.* " +
                              " from avaliacoes A " +
                              " left join pacientes P on ( A.id = P.pessoa_id ) " +
                              " where A.paciente_id = " + pIdPaciente.ToString() +
                              " and A.status = 1 " +
                              " order by A.data desc ";
                var query = db.ExecuteQuery<avaliacao>(sSql);
                
                return query.ToList();
            }
        }
    }
}
