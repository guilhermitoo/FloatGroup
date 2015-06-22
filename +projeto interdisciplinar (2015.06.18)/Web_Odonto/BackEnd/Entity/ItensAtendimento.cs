using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class ItensAtendimento
    {
        public Atendimento Atendimento { get; set; } // CHAVE PRIMÁRIA
        public Procedimento Procedimento { get; set; } // CHAVE PRIMÁRIA
        public int Qtd { get; set; }

        public ItensAtendimento() { }

        public ItensAtendimento(Atendimento atendimento, Procedimento procedimento, int qtd)
        {
            this.Atendimento = atendimento;
            this.Procedimento = procedimento;
            this.Qtd = qtd;
        }
    }
}
