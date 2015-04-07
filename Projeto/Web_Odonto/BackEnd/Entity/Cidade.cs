using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Cidade
    {
        public int      Id   { get; set; } // CHAVE PRIMÁRIA
        public string   Nome { get; set; }
        public string   UF   { get; set; }

        public Cidade() { }

        public Cidade(int id, string nome, string UF)
        {
            this.Id = id;
            this.Nome = nome;
            this.UF = UF;
        }
    }
}
