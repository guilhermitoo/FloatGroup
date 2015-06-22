using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class ItensReceita
    {
        public Receita Receita { get; set; } // CHAVE PRIMÁRIA
        public Medicamento Medicamento { get; set; } // CHAVE PRIMÁRIA
        public string Dose { get; set; }
        public string Observacao { get; set; }
        public string Periodo { get; set; }

        public ItensReceita() { }

        public ItensReceita(Receita receita, Medicamento medicamento, string dose, string observacao, string periodo)
        {
            this.Receita = receita;
            this.Medicamento = medicamento;
            this.Dose = dose;
            this.Observacao = observacao;
            this.Periodo = periodo;
        }

    }
}
