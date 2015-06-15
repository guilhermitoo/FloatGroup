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
                tratamento trat = Obter(t.avaliacao_id) as tratamento;
                Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();               
                if (trat == null)
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
                try
                {
                    return tabelaTratamento.First(p => p.avaliacao_id == id);
                }
                catch
                {
                    return null;
                }
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

        public List<tratamento> ListarPorPaciente(int pId, int status = 2)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select T.* " +
                              " from tratamentos T" +
                              " join avaliacoes A on ( T.avaliacao_id = A.id )" +
                              " join pacientes P on ( A.paciente_id = P.pessoa_id )" +
                              " where P.pessoa_id = " + pId.ToString();
                if (status != 0)
                    sSql = sSql + " and T.status = " + status.ToString();
                var query = db.ExecuteQuery<tratamento>(sSql);
                return query.ToList();
            }
        }

        public List<v_detalhesTratamento> ListarPorPacienteDetalhado(int pId)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql =   "select * from v_detalhesTratamento T "+
                                " where T.[Código Paciente] = " + pId.ToString();
                
                var query = db.ExecuteQuery<v_detalhesTratamento>(sSql);
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

        public bool InserirItem(itemTratamento p)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<itemTratamento> tbItemTratamento = db.GetTable<itemTratamento>();
                if (p != null)
                {
                    db.cadItemTratamento(p.tratamento_id, p.procedimento_id, p.qtd, p.valor, p.status);
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

        public bool RemoverItem(itemTratamento p)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<itemTratamento> tbItemTratamento = db.GetTable<itemTratamento>();
                if (p != null)
                {
                    db.removeItemTratamento(p.tratamento_id, p.procedimento_id);
                    tbItemTratamento.Context.SubmitChanges();
                    return true;
                }
                else 
                {
                    return false;
                }
                
            }
            catch { return false; }
        }

        public bool RemoverTodosItens(int idTrat)
        {

            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {                
                String sSql = " delete from itensTratamento where tratamento_id = " + idTrat.ToString();

                db.ExecuteCommand(sSql);

                return true;
            }
            catch { return false; }
        }

        public List<v_itensTratamento> ListarItens(int idTratamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select I.* " +
                              " from v_itensTratamento I " +
                              " where I.[Código Tratamento] = " + idTratamento.ToString();
                var query = db.ExecuteQuery<v_itensTratamento>(sSql);
                return query.ToList();
            }
        }

        public List<v_itensTratamento> ListarItensPendentes(int idTratamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql =
                            " select IT.[Código Tratamento],it.[Código Procedimento],IT.Descrição,IT.Quantidade - ( " +
                                " select coalesce(sum(I.qtd),0) " +
                                " from itensAtendimento I " +
                                " join atendimentos A on (a.id = i.atendimento_id ) " +
                                " where a.tratamento_id = " + idTratamento.ToString() +
                                " and a.status = 2 " +
                                " and i.procedimento_id = IT.[Código Procedimento] " +
                            ") Quantidade " +
                            " , IT.Status ,IT.Valor "+ 
                            " from v_itensTratamento IT "+
                            " join tratamentos T on ( T.avaliacao_id = IT.[Código Tratamento] ) "+
                            " where T.avaliacao_id = " + idTratamento.ToString() +
                            " and IT.Status = 1 ";
                var query = db.ExecuteQuery<v_itensTratamento>(sSql);
                return query.ToList();
            }
        }

        public List<v_itensTratamento> ListarItensConcluidos(int idTratamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = " select IT.[Código Procedimento],IT.[Descrição Procedimento] Descrição, SUM(IT.qtd) Quantidade " +
                                " from v_itensAtendimento IT " +
                                " join atendimentos A on (IT.[Código Atendimento] = A.id) " +
                                " where A.status = 2 " +
                                " and A.tratamento_id = " + idTratamento.ToString() +
                                " group by IT.[Código Procedimento],IT.[Descrição Procedimento], IT.qtd ";
                    
                var query = db.ExecuteQuery<v_itensTratamento>(sSql);
                return query.ToList();
            }
        }


        public String GetItemStatus(int iStatus)
        {
            String sStatus;
            // 1 = Pendente, 2 = Concluído,
            switch (iStatus)
            {
                case 1:
                    sStatus = "Pendente";
                    break;
                case 2:
                    sStatus = "Concluído";
                    break;                
                default:
                    sStatus = "Nenhum";
                    break;
            }
            return sStatus;
        }

        public bool Iniciar(int idTrat)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try 
            {
                Table<tratamento> tbTratamento = db.GetTable<tratamento>();
                // INICIA O TRATAMENTO
                String sSql = " update tratamentos set status = 2, dataInicial = GETDATE() where avaliacao_id = " + idTrat.ToString();
                var query = db.ExecuteCommand(sSql);
                //após iniciar o tratamento, o status da avaliação deve ser modificado para concluído
                AvaliacaoModel avalModel = new AvaliacaoModel();
                avalModel.MudarStatus(idTrat, 2);
                return true;
            }
            catch { return false; }
        }

        public Int32 PorcentagemConcluida(int idTrat)
        { // FUNÇÃO QUE RECEBE O ID DO TRATAMENTO E RETORNA 
          // A PORCENTAGEM CONCLUÍDA DO TRATAMENTO
            Int32 perc;
            
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                Table<itemTratamento> tbItemTrat = db.GetTable<itemTratamento>();
                String sSql = " select coalesce((( " +
                " select SUM(I.qtd) from itensAtendimento I " +
                " join atendimentos A on ( A.id = I.atendimento_id ) " +                                        
                " where A.status = 2" +
                " and A.tratamento_id = " + idTrat.ToString() +
                " ) * 100) / ("+
                " select SUM(I.qtd) from itensTratamento I"+
                " where I.tratamento_id = " + idTrat.ToString() +
                " ),0) as perc";

                perc = db.ExecuteQuery<Int32>(sSql).First();
                //perc = int.Parse(txt);                
            }
            catch {
                perc = 0;
            }
            return perc;
        }

        public itemTratamento ObterItem(itemTratamento p)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            try
            {
                itemTratamento it = new itemTratamento();
                String sSql = " select * from itensTratamento " +
                              " where tratamento_id = " + p.tratamento_id.ToString() +
                              " and procedimento_id = " + p.procedimento_id.ToString();

                var query = db.ExecuteQuery<itemTratamento>(sSql);

                it = query.ToList().First();

                return it;
            }
            catch { return null; }
        }

        public bool VerificaFinalTratamento(tratamento t)
        {
            using ( WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try 
                {
                    Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();
                    db.verificaFinalTratamento(t.avaliacao_id);
                    tabelaTratamento.Context.SubmitChanges();
                    return true;
                }
                catch 
                {
                    return false;
                }
            }
        }       

        
        public List<v_detalhesTratamento> ListarPorPeriodo(DateTime dDatIni, DateTime dDatFin)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from v_detalhesTratamento " +
                                " where [Data Inicial] between '" + dDatIni.ToShortDateString() + "' " +
                                " and '" + dDatFin.ToShortDateString() + "' " +
                                " and [Data Final] between '" + dDatIni.ToShortDateString() + "' " +
                                " and '" + dDatFin.ToShortDateString() + "' ";                                
                var query = db.ExecuteQuery<v_detalhesTratamento>(sSql);

                return query.ToList();
            }
        }
    }
}
