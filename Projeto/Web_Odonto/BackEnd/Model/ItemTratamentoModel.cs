using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class ItemTratamentoModel
    {
        public ItemTratamentoModel() { }

        public bool InserirAtualizar(itemTratamento p)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<itemTratamento> tbItemTratamento = db.GetTable<itemTratamento>();
                if ((p.tratamento_id == 0) && (p.procedimento_id == 0))
                {
                    db.cadItemTratamento(p.tratamento_id, p.procedimento_id, p.qtd, p.valor, p.status);
                    tbItemTratamento.Context.SubmitChanges();
                    return true;
                }
                else if ((p.tratamento_id != 0) && (p.procedimento_id != 0))
                {
                    db.alteraItemTratamento(p.tratamento_id, p.procedimento_id, p.qtd, p.valor, p.status);
                    tbItemTratamento.Context.SubmitChanges();
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

        public List<v_itensTratamento> ListarPorTratamento(int idTratamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select I.* " +
                              " from v_itensTratamento I " +
                              " where I.[Código Tratamento] = "+ idTratamento.ToString();
                var query = db.ExecuteQuery<v_itensTratamento>(sSql);
                return query.ToList();
            }
        }
    }
}
