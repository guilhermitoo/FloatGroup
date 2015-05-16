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
    public class TratamentoModel
    {
        public TratamentoModel() { }

        public bool InserirAtualizar(tratamento t)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();
                if (t.avaliacao_id == 0)
                {
                    db.cadTratamento(t.avaliacao_id, t.status, t.dataInicial, t.dataFinal, t.total);
                    tabelaTratamento.Context.SubmitChanges();
                }
                else
                {
                    db.alteraTratamento(t.avaliacao_id, t.status, t.dataInicial, t.dataFinal, t.total);
                    tabelaTratamento.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }


        public tratamento Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();
                return tabelaTratamento.First(p => p.avaliacao_id == id);
            }
        }

        public List<tratamento> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();
                return tabelaTratamento.ToList();
            }
        }

        public List<tratamento> ListarPorPaciente(int pId)
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
        }

        public String GetStatus(int iStatus)
        {
            String sStatus;
            // 1 = Em Orçameto, 2 = Em Andamento, 3 = Concluído
            switch (iStatus)
            {
                case 1:
                    sStatus = "Em Orçamento";
                    break;
                case 2:
                    sStatus = "Em Andamento";
                    break;
                case 3:
                    sStatus = "Concluído";
                    break;
                default:
                    sStatus = "Nenhum";
                    break;
            }
            return sStatus;
        }
    }
}
