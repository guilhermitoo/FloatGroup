using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Receita
    {
        public int Id { get; set; }
        public Atendimento Atendimento { get; set; }
        public string Descricao { get; set; }

        public Receita() { }

        public Receita(int id, Atendimento atendimento, string descricao)
        {
            this.Id = id;
            this.Atendimento = atendimento;
            this.Descricao = descricao;
        }
    }
}
