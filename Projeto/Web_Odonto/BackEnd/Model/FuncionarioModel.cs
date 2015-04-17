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
    public class FuncionarioModel
    {
        private string sConexao;
        public FuncionarioModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Funcionario funcionario)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaFuncionario.InsertOnSubmit(funcionario);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Funcionario funcionario)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from f in bd.TabelaFuncionario
                                where f.Id == funcionario.Id
                                select f;
                    foreach (Funcionario f in query)
                    {

                        f.Nome = funcionario.Nome;
                        f.Cpf = funcionario.Cpf;
                        f.Rg = funcionario.Rg;
                        f.Nascimento = funcionario.Nascimento;
                        f.Telefone1 = funcionario.Telefone1;
                        f.Telefone2 = funcionario.Telefone2;
                        f.Sexo = funcionario.Sexo;
                        f.Endereco = funcionario.Endereco;
                        f.Usuario = funcionario.Usuario;
                        f.Senha = funcionario.Senha;
                        f.Status = funcionario.Status;
                        f.Obs = funcionario.Obs;
                        f.TipoUsuario = funcionario.TipoUsuario;
                        f.Cidade = funcionario.Cidade;
                        f.Salario = funcionario.Salario;
                        f.Cargo = funcionario.Cargo;
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

        public bool Excluir(Funcionario funcionario)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaFuncionario.DeleteOnSubmit(bd.TabelaFuncionario.First(p => p.Id == funcionario.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Funcionario Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaFuncionario.First(p => p.Id == id);
            }
        }

        public List<Funcionario> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaFuncionario.ToList();
            }

        }
    }
}
