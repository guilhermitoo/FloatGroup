using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "Funcionario")]
    public class Funcionario : Pessoa
    {
        [Column(Name = "pessoa_id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public Pessoa Pessoa { get; set; } // CHAVE PRIMÁRIA
        [Column(Name = "Salario")]
        public float Salario { get; set; }
        [Column(Name = "Cargo")]
        public string Cargo { get; set; }

        public Funcionario() { }

        public Funcionario(Pessoa pessoa, float salario, string cargo)
        {
            this.Pessoa = pessoa;
            this.Salario = salario;
            this.Cargo = cargo;
        }
    }
}
