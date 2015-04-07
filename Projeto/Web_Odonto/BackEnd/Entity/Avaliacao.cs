using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Avaliacao
    {
        public int Id { get; set; } // CHAVE PRIMÁRIA
        public Dentista Dentista { get; set; }
        public Paciente Paciente { get; set; }
        public DateTime Data { get; set; }

        public Avaliacao() { }

        public Avaliacao(int id,Dentista dentista, Paciente paciente, DateTime data)
        {
            this.Id = id;
            this.Dentista = dentista;
            this.Paciente = paciente;
            this.Data = data;
        }
    }
}
