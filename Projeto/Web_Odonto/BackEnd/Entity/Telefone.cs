using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Telefone
    {
        public Pessoa Pessoa { get; set; }
        public string Numero { get; set; }
        public int Tipo { get; set; }

        public Telefone() { }

        public Telefone(string numero, int tipo) {
            this.Numero = numero;
            this.Tipo = tipo;
        }
    }
}
