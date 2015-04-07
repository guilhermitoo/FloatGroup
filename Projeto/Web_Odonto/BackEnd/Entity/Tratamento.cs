using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Tratamento
    {
        public Avaliacao Avaliacao { get; set; }
        public float Total { get; set; }
        public int Status { get; set; }

        public Tratamento() { }

        public Tratamento(Avaliacao avaliacao, float total, int status)
        {
            this.Avaliacao = avaliacao;
            this.Total = total;
            this.Status = status;
        }

    }
}
