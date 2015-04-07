using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Pessoa
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public DateTime Nascimento { get; set; }
        public char Sexo { get; set; }
        public string Rg { get; set; }
        public string Cpf { get; set; }
        public string Logradouro { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public int Status { get; set; }
        public string Obs { get; set; }
        public int TipoUsuario { get; set; }
        public Cidade Cidade { get; set; }

        public Pessoa() { }

        public Pessoa(int id, string nome, DateTime nascimento, char sexo, string rg, string cpf, string logradouro,
               string login, string senha, int status, string obs, int tipoUsuario, Cidade cidade)
        {
            this.Id = id;
            this.Nome = nome;
            this.Nascimento = nascimento;
            this.Sexo = sexo;
            this.Rg = rg;
            this.Cpf = cpf;
            this.Logradouro = logradouro;
            this.Login = login;
            this.Senha = senha;
            this.Status = status;
            this.Obs = obs;
            this.TipoUsuario = tipoUsuario;
            this.Cidade = cidade;
        }
    }
}
