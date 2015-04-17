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
    public class PessoaModel
    {
        private string sConexao;
        public PessoaModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Pessoa pessoa)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaPessoa.InsertOnSubmit(pessoa);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Pessoa pessoa)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from p in bd.TabelaPessoa
                                where p.Id == pessoa.Id
                                select p;
                    foreach (Pessoa p in query)
                    {

                        p.Nome = pessoa.Nome;
                        p.Cpf = pessoa.Cpf;
                        p.Rg = pessoa.Rg;
                        p.Nascimento = pessoa.Nascimento;
                        p.Telefone1 = pessoa.Telefone1;
                        p.Telefone2 = pessoa.Telefone2;
                        p.Sexo = pessoa.Sexo;
                        p.Endereco = pessoa.Endereco;
                        p.Usuario = pessoa.Usuario;
                        p.Senha = pessoa.Senha;
                        p.Status = pessoa.Status;
                        p.Obs = pessoa.Obs;
                        p.TipoUsuario = pessoa.TipoUsuario;
                        p.Cidade = pessoa.Cidade;
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

        public bool Excluir(Pessoa pessoa)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaPessoa.DeleteOnSubmit(bd.TabelaPessoa.First(p => p.Id == pessoa.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Pessoa Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaPessoa.First(p => p.Id == id);
            }
        }

        public List<Pessoa> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaPessoa.ToList();
            }

        }
    }
}