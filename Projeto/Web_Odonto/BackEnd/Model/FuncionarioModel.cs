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
                if (d.pessoa.id == 0)
                {
                    db.cadFuncionario(d.pessoa.nome, d.pessoa.cpf, d.pessoa.rg, d.pessoa.nascimento, d.pessoa.telefone1, d.pessoa.telefone2,
                                   d.pessoa.sexo, d.pessoa.endereco, d.pessoa.usuario, d.pessoa.senha, d.pessoa.status, d.pessoa.obs,
                                   d.pessoa.tipoUsuario, d.pessoa.cidade_id, d.salario, d.cargo);
                    tabelaFuncionario.Context.SubmitChanges();
                }
                else
                {
                    db.alteraFuncionario(d.pessoa.id, d.pessoa.nome, d.pessoa.cpf, d.pessoa.rg, d.pessoa.nascimento, d.pessoa.telefone1, d.pessoa.telefone2,
                                      d.pessoa.sexo, d.pessoa.endereco, d.pessoa.usuario, d.pessoa.senha, d.pessoa.status, d.pessoa.obs,
                                      d.pessoa.tipoUsuario, d.pessoa.cidade_id, d.salario, d.cargo);
                    tabelaFuncionario.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(funcionario funcionario)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<funcionario> tabelaFuncionario = db.GetTable<funcionario>();
                    tabelaFuncionario.DeleteOnSubmit(tabelaFuncionario.First(p => p.pessoa.id == funcionario.pessoa.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
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
