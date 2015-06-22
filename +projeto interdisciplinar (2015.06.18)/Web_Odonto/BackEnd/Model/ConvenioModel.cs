using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class ConvenioModel
    {
        public ConvenioModel() {}

        public bool InserirAtualizar(convenio con)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<convenio> tabelaConvenio = db.GetTable<convenio>();
                if (con.id == 0)
                {
                    db.cadConvenio(con.cnpj,con.ie,con.razao_social,con.nome_fantasia);
                    tabelaConvenio.Context.SubmitChanges();
                }
                else
                {
                    db.alteraConvenio(con.id ,con.cnpj, con.ie, con.razao_social, con.nome_fantasia);
                    tabelaConvenio.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }       

        public convenio Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<convenio> tabelaConvenio = db.GetTable<convenio>();
                return tabelaConvenio.First(p => p.id == id);
            }
        }

        public List<convenio> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<convenio> tabelaConvenio = db.GetTable<convenio>();
                return tabelaConvenio.ToList();
            }

        }

        public List<convenio> ListarPorNome(string Nome)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select C.* from convenios C where ( C.nome_fantasia like '%" + Nome + "%' ) or "+
                                                                "( C.razao_social like '%" + Nome + "%' ) ";                                                               
                var query = db.ExecuteQuery<convenio>(sSql);
                return query.ToList();
            }
        }

        public bool ValidaCNPJ(string cnpj)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {

                String sSql = "select C.id from convenios C where C.cnpj = '" + cnpj + "' ";
                var query = db.ExecuteQuery<convenio>(sSql);
                return (query.Count() < 1);
            }
        }

        public int ObterCNPJ(string cnpj)
        {
            // pelo CPF retorna o ID
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select C.id from convenios C where C.cnpj = '" + cnpj + "' ";
                var query = db.ExecuteQuery<convenio>(sSql);
                return (query.First()).id;
            }
        }
    }
}
