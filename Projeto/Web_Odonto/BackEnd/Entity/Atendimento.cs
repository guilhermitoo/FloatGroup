using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Atendimento
    {
        public int Id { get; set; } // CHAVE PRIMÁRIA
        public Tratamento Tratamento { get; set; }
        public DateTime Data { get; set; }
        public int Status { get; set; }

        public Atendimento() { }

        public Atendimento(int id,Tratamento tratamento,DateTime data,int status) {
            this.Id = id;
            this.Tratamento = tratamento;
            this.Data = data;
            this.Status = status;
        }
    }
}
