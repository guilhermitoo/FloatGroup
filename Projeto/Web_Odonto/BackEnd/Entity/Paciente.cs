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
        [Column(Name = "pessoa_id", IsPrimaryKey = true, CanBeNull = false)]
        public Pessoa Pessoa { get; set; }
        [Column(Name = "convenio_id", IsPrimaryKey = true)]
        public Convenio Convenio { get; set; }

        public Paciente() { }

        public Paciente(Pessoa pessoa,Convenio convenio)
        {
            this.Pessoa = pessoa;
            this.Convenio = convenio;
        }
    }
}
