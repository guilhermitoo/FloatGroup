using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Medicamento
    {
        public int Id { get; set; } // CHAVE PRIMÁRIA
        public string Nome { get; set; }
        public string Tarja { get; set; }
        public string ClasseTerapeutica { get; set; }
        public string Posologia { get; set; }
        public string Unidade { get; set; }

        public Medicamento() { }

        public Medicamento(int id, string nome, string tarja, string classeTerapeutica, 
                                string posologia, string unidade)
        {
            this.Id = id;
            this.Nome = nome;
            this.Tarja = tarja;
            this.ClasseTerapeutica = classeTerapeutica;
            this.Posologia = posologia;
            this.Unidade = unidade;
        }
    }
}
