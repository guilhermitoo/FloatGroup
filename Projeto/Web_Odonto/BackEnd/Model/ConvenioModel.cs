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
    public class ConvenioModel
    {
        private string sConexao;
        public ConvenioModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Convenio convenio)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaConvenio.InsertOnSubmit(convenio);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Convenio convenio)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from con in bd.TabelaConvenio
                                where con.Id == convenio.Id
                                select con;
                    foreach (Convenio con in query)
                    {
                        con.Cnpj = convenio.Cnpj;
                        con.Ie = convenio.Ie;
                        con.RazaoSocial = convenio.RazaoSocial;
                        con.NomeFantasia = convenio.NomeFantasia;
                        con.Id = convenio.Id;
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

        public bool Excluir(Convenio convenio)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaConvenio.DeleteOnSubmit(bd.TabelaConvenio.First(p => p.Id == convenio.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Convenio Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaConvenio.First(p => p.Id == id);
            }
        }

        public List<Convenio> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaConvenio.ToList();
            }

        }    
    }
}
