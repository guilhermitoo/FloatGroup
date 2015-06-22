using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class ItensTratamento
    {
        public Tratamento Tratamento { get; set; } // CHAVE PRIMÁRIA
        public Procedimento Procedimento { get; set; } // CHAVE PRIMÁRIA
        public int Status { get; set; }
        public int Qtd { get; set; }
        public float Valor { get; set; }

        public ItensTratamento() { }

        public ItensTratamento(Tratamento tratamento, Procedimento procedimento, int status, int qtd, float valor)
        {
            this.Tratamento = tratamento;
            this.Procedimento = procedimento;
            this.Status = status;
            this.Qtd = qtd;
            this.Valor = valor;
        }
    }
}
