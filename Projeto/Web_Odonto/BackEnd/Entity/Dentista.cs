using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Dentista : Pessoa
    {
        public Pessoa Pessoa { get; set; } // CHAVE PRIMÁRIA
        public int Cro { get; set; }

        public Dentista() { }

        public Dentista(Pessoa pessoa, int cro)
        {
            this.Pessoa = pessoa;
            this.Cro = cro;
        }
    }
}
