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
    public class PacienteModel
    {
        private string sConexao;
        public PacienteModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Paciente paciente)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaPaciente.InsertOnSubmit(paciente);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Paciente paciente)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from pac in bd.TabelaPaciente
                                where pac.Id == paciente.Id
                                select pac;
                    foreach (Paciente pac in query)
                    {

                        pac.Nome = paciente.Nome;
                        pac.Cpf = paciente.Cpf;
                        pac.Rg = paciente.Rg;
                        pac.Nascimento = paciente.Nascimento;
                        pac.Telefone1 = paciente.Telefone1;
                        pac.Telefone2 = paciente.Telefone2;
                        pac.Sexo = paciente.Sexo;
                        pac.Endereco = paciente.Endereco;
                        pac.Usuario = paciente.Usuario;
                        pac.Senha = paciente.Senha;
                        pac.Status = paciente.Status;
                        pac.Obs = paciente.Obs;
                        pac.TipoUsuario = paciente.TipoUsuario;
                        pac.Cidade = paciente.Cidade;
                        pac.Convenio = paciente.Convenio;

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

        public bool Excluir(Paciente paciente)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaPaciente.DeleteOnSubmit(bd.TabelaPaciente.First(p => p.Id == paciente.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Paciente Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaPaciente.First(p => p.Id == id);
            }
        }

        public List<Paciente> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaPaciente.ToList();
            }

        }
    }
}