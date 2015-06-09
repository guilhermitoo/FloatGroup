using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;


namespace BackEnd.Model
{
    public class ProcedimentoModel
    {
        public ProcedimentoModel() { }

        public bool InserirAtualizar(procedimento p)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<procedimento> tabelaProcedimento = db.GetTable<procedimento>();
                if (p.id == 0)
                {
                    db.cadProcedimento(p.descricao);
                    tabelaProcedimento.Context.SubmitChanges();
                }
                else
                {
                    db.alteraProcedimento(p.id, p.descricao);
                    tabelaProcedimento.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public procedimento Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<procedimento> tabelaProcedimento = db.GetTable<procedimento>();
                return tabelaProcedimento.First(p => p.id == id);
            }
        }

        public List<procedimento> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<procedimento> tabelaProcedimento = db.GetTable<procedimento>();
                return tabelaProcedimento.ToList();
            }
        }

        public List<procedimento> ListarPorDescricao(string Descricao)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select * from procedimentos P where P.descricao like '%" + Descricao + "%' ";
                var query = db.ExecuteQuery<procedimento>(sSql);
                return query.ToList();
            }
        }

        public List<procedimento> ListarPorTratamento(int idTratamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select P.*,IT.* from procedimentos P " +
                              " join itensTratamento IT on (P.id = IT.procedimento_id ) " +
                              " join tratamentos T on ( IT.tratamento_id = T.avaliacao_id ) " +
                              " where T.avaliacao_id =" + idTratamento.ToString();
                var query = db.ExecuteQuery<procedimento>(sSql);
                return query.ToList();
            }
        }

        // função que retorna da view v_datatlheProcedimento, filtrando a data pelo período.
        // é utilizada no relatório de Procedimentos Realizados Por Período
        public List<v_detalheProcedimento> ListarPorPeriodo(DateTime dDatIni, DateTime dDatFin)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())            
            {
                String sSql =   "select I.id,I.[Descrição do Procedimento],count(I.qtd) QTD from v_detalheProcedimento I " +
                                " where I.data between '" + dDatIni.ToShortDateString() + "' "+
                                " and '" + dDatFin.ToShortDateString() + "' " +
                                " group by I.ID, I.[Descrição do Procedimento]";
                var query = db.ExecuteQuery<v_detalheProcedimento>(sSql);

                return query.ToList();
            }            
        }

    }
}
