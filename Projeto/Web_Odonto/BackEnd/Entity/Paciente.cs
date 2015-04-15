using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "Paciente")]
    public class Paciente : Pessoa
    {
        [Column(Name = "pessoa_id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public Pessoa Pessoa { get; set; }

        public Paciente() { }

        public Paciente(Pessoa pessoa)
        {
            this.Pessoa = pessoa;
        }
    }
}
