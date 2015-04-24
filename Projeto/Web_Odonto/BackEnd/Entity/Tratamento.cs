using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "tratamentos")]
    public class Tratamento
    {
        [Column(Name="id_avaliacao", CanBeNull=false, IsPrimaryKey=true)]
        public Avaliacao Avaliacao { get; set; }
        [Column(Name="total")]
        public float Total { get; set; }
        [Column(Name = "dataInicial")]
        public DateTime DataInicial { get; set; }
        [Column(Name = "dataFinal")]
        public DateTime DataFinal { get; set; }
        [Column(Name = "status",CanBeNull=false)]
        public int Status { get; set; }

        public Tratamento() { }

        public Tratamento(Avaliacao avaliacao, float total, DateTime dataInicial, DateTime dataFinal, int status)
        {
            this.Avaliacao = avaliacao;
            this.Total = total;
            this.DataInicial = dataInicial;
            this.DataFinal = dataFinal;
            this.Status = status;
        }

    }
}
