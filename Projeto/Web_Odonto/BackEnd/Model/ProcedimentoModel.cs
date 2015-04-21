using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.Data;
using BackEnd.Entity;
using System.Data.Linq;


namespace BackEnd.Model
{
    public class ProcedimentoModel
    {
        private string sConexao;
        public ProcedimentoModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Procedimento procedimento)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaProcedimento.InsertOnSubmit(procedimento);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Procedimento procedimento)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from proc in bd.TabelaProcedimento
                                where proc.Id == procedimento.Id
                                select proc;
                    foreach (Procedimento proc in query)
                    {
                        proc.Descricao = procedimento.Descricao;
                        proc.Id= procedimento.Id;                        
                    }

                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Excluir(Procedimento procedimento)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaProcedimento.DeleteOnSubmit(bd.TabelaProcedimento.First(p => p.Id == procedimento.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Procedimento Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaProcedimento.First(p => p.Id == id);
            }
        }

        public List<Procedimento> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaProcedimento.ToList();
            }
        }

        public List<Procedimento> ListarPorDescricao(string Descricao)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                
                String sSql = "select * from procedimentos P where P.descricao like '%"+Descricao+"%' ";
                var query = bd.ExecuteQuery<Procedimento>(sSql);
                return query.ToList();                
            }
        }
    }
}
