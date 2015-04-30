using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class PessoaModel
    {
        public PessoaModel() { }             

        public pessoa Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<pessoa> tabelaPessoa = db.GetTable<pessoa>();
                return tabelaPessoa.First(p => p.id == id);
            }
        }

        public List<pessoa> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<pessoa> tabelaPessoa = db.GetTable<pessoa>();
                return tabelaPessoa.ToList();
            }
        }

        public bool ValidaCPF(string cpf) 
        {            
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                
                String sSql = "select id from pessoas P where P.cpf like '%"+cpf+"%' ";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return (query.Count() < 1);
            }           
        }
        
        public pessoa ObterCPF(string cpf)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<pessoa> tabelaPessoa = db.GetTable<pessoa>();
                return tabelaPessoa.First(p => p.cpf == cpf);
            }
        }
    }
}