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
        [Column(Name = "id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public int Id { get; set; }
        [Column(Name = "Nome", CanBeNull = false)]
        public string Nome { get; set; }
        [Column(Name = "CPF", CanBeNull = false)]
        public string Cpf { get; set; }
        [Column(Name = "RG")]
        public string Rg { get; set; }
        [Column(Name = "Nascimento")]
        public DateTime Nascimento { get; set; }
        [Column(Name = "Telefone 1")]
        public string Telefone1 { get; set; }
        [Column(Name = "Telefone 2")]
        public string Telefone2 { get; set; }
        [Column(Name = "Sexo")]
        public char Sexo { get; set; }
        [Column(Name = "Logradouro")]
        public string Logradouro { get; set; }
        [Column(Name = "Login:")]
        public string Login { get; set; }
        [Column(Name = "Senha:")]
        public string Senha { get; set; }
        [Column(Name = "Status", CanBeNull = false)]
        public int Status { get; set; }
        [Column(Name = "Obs")]
        public string Obs { get; set; }
        [Column(Name = "Tipo de usuário", CanBeNull = false)]
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
