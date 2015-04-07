using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Funcionario : Pessoa
    {
        public Pessoa Pessoa { get; set; } // CHAVE PRIMÁRIA
        public float Salario { get; set; }
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
