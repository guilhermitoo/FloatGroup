using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Paciente : Pessoa
    {
        public Pessoa Pessoa { get; set; }

        public Paciente() { }

        public Paciente(Pessoa pessoa)
        {
            this.Pessoa = pessoa;
        }
    }
}
