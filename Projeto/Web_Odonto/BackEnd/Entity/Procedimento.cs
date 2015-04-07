using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Procedimento
    {
        public int Id { get; set; }
        public string Descricao { get; set; }

        public Procedimento() { }

        public Procedimento(int id, string descricao)
        { 
            this.Id = id;
            this.Descricao = descricao;
        }
    }
}
