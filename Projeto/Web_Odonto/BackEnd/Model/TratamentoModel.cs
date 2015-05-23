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

        public bool Inserir(tratamento t)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<tratamento> tabelaTratamento = db.GetTable<tratamento>();               
                tabelaTratamento.InsertOnSubmit(t);
                tabelaTratamento.Context.SubmitChanges();
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
                String sSql = " update tratamentos set status = 2 where id = " + idTrat.ToString();
                var query = db.ExecuteCommand(sSql);
                //após iniciar o tratamento, o status da avaliação deve ser modificado para concluído
                AvaliacaoModel avalModel = new AvaliacaoModel();
                avalModel.MudarStatus(idTrat, 2);
                return true;
            }
            catch { return false; }
        }
       
    }
}
