using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name="pessoas")]
    public class Pessoa
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Rg { get; set; }
        public DateTime Nascimento { get; set; }
        public string Telefone1 { get; set; }
        public string Telefone2 { get; set; }
        public char Sexo { get; set; }     
        public string Logradouro { get; set; }
        public string Login { get; set; }
        public string Senha { get; set; }
        public int Status { get; set; }
        public string Obs { get; set; }
        public int TipoUsuario { get; set; }
        [Column(Name="cidade_id", CanBeNull=false)] // verificar chave estrangeira com igor 
        public Cidade Cidade { get; set; }

        public Pessoa() { }

        public Pessoa(int id, string nome, string cpf, string rg, DateTime nascimento, string telefone1, string telefone2,char sexo, 
            string logradouro, string login, string senha, int status, string obs, int tipoUsuario, Cidade cidade)
        {
            this.Id = id;
            this.Nome = nome;
            this.Cpf = cpf;
            this.Rg = rg;
            this.Nascimento = nascimento;
            this.Telefone1 = telefone1;
            this.Telefone2 = telefone2;
            this.Sexo = sexo;                     
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
