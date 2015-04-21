using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "Dentista")]
    public class Dentista : Pessoa
    {
        [Column(Name = "pessoa_id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public Pessoa Pessoa { get; set; } // CHAVE PRIMÁRIA
        [Column(Name = "CRO", CanBeNull = false)]
        public int Cro { get; set; }
        [Column(Name = "salario")]
        public decimal Salario { get; set; }

        public Dentista() { }

        public Dentista(Pessoa pessoa, int cro, decimal salario)
        {
            this.Pessoa = pessoa;
            this.Cro = cro;
            this.Salario = salario;
        }
    }
}
