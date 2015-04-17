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
    public class DentistaModel
    {
        private string sConexao;
        public DentistaModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Dentista dentista)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaDentista.InsertOnSubmit(dentista); //avisar sobre adicionar TabelaDentista na classe WebOdontoContext
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Dentista dentista)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from d in bd.TabelaDentista
                                where d.Id == dentista.Id
                                select d;
                    foreach (Dentista d in query)
                    {

                        d.Nome = dentista.Nome;
                        d.Cpf = dentista.Cpf;
                        d.Rg = dentista.Rg;
                        d.Nascimento = dentista.Nascimento;
                        d.Telefone1 = dentista.Telefone1;
                        d.Telefone2 = dentista.Telefone2;
                        d.Sexo = dentista.Sexo;
                        d.Endereco = dentista.Endereco;
                        d.Usuario = dentista.Usuario;
                        d.Senha = dentista.Senha;
                        d.Status = dentista.Status;
                        d.Obs = dentista.Obs;
                        d.TipoUsuario = dentista.TipoUsuario;
                        d.Cidade = dentista.Cidade;
                        d.Cro = dentista.Cro;
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

        public bool Excluir(Dentista dentista)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaDentista.DeleteOnSubmit(bd.TabelaDentista.First(p => p.Id == dentista.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Dentista Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaDentista.First(p => p.Id == id);
            }
        }

        public List<Dentista> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaDentista.ToList();
            }

        }
    }//final
}