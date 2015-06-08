using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class FuncionarioModel
    {
        public FuncionarioModel() { }

        public bool InserirAtualizar(funcionario d)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<funcionario> tabelaFuncionario = db.GetTable<funcionario>();
                if (Verifica(d.pessoa.id))
                {// ATUALIZA SE EXISTIR
                    db.alteraFuncionario(d.pessoa.id, d.salario, d.cargo);
                    tabelaFuncionario.Context.SubmitChanges();
                }
                else
                {// SE NÃO EXISTIR, CADASTRA
                    db.cadFuncionario(d.pessoa.id, d.salario, d.cargo);
                    tabelaFuncionario.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public funcionario Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<funcionario> tabelaFuncionario = db.GetTable<funcionario>();
                return tabelaFuncionario.First(p => p.pessoa.id == id);
            }
        }

        public List<funcionario> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<funcionario> tabelaFuncionario = db.GetTable<funcionario>();
                return tabelaFuncionario.ToList();
            }
        }

        public bool Verifica(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from funcionarios where pessoa_id = " + id;
                var query = db.ExecuteQuery<funcionario>(sSql);
                return (query.ToList().Count > 0);
            }

        }
    }
}
