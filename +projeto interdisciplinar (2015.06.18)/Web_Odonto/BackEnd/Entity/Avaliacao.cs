using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name="avaliacoes")]
    public class Avaliacao
    {
        [Column(Name="id",CanBeNull=false,IsDbGenerated=true,IsPrimaryKey=true)]
        public int Id { get; set; } // CHAVE PRIMÁRIA
        [Column(Name="dentista_id", CanBeNull=false)]
        public Dentista Dentista { get; set; }
        [Column(Name = "paciente_id", CanBeNull = false)]
        public Paciente Paciente { get; set; }
        [Column(Name = "data", CanBeNull = false)]
        public DateTime Data { get; set; }

        public Avaliacao() { }

        public Avaliacao(int id,Dentista dentista, Paciente paciente, DateTime data)
        {
            this.Id = id;
            this.Dentista = dentista;
            this.Paciente = paciente;
            this.Data = data;
        }
    }
}
