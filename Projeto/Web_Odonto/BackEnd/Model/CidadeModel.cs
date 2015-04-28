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
    public class CidadeModel
    {        
        public CidadeModel() { }

        public bool InserirAtualizar(cidade cid)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            
            try
            {
                Table<cidade> tabelaCidade = db.GetTable<cidade>();
                if (cid.id == 0)
                {                    
                    db.cadCidade(cid.nome, cid.uf);
                    tabelaCidade.Context.SubmitChanges();
                }
                else
                {
                    db.alteraCidade(cid.id, cid.nome, cid.uf);
                    tabelaCidade.Context.SubmitChanges();                    
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(cidade cidade)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<cidade> tabelaCidade = db.GetTable<cidade>();
                    tabelaCidade.DeleteOnSubmit(tabelaCidade.First(p => p.id == cidade.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public cidade Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<cidade> tabelaCidade = db.GetTable<cidade>();
                return tabelaCidade.First(p => p.id == id);
            }
        }

        public List<cidade> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<cidade> tabelaCidade = db.GetTable<cidade>();
                return tabelaCidade.ToList();
            }
        }

        public List<cidade> ListarPorNome(string Nome)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                
                String sSql = "select * from cidades C where C.nome like '%"+Nome+"%' ";
                var query = db.ExecuteQuery<cidade>(sSql);
                return query.ToList();
                //return bd.TabelaCidade.ToList(); 
            }
        }

    }
}
