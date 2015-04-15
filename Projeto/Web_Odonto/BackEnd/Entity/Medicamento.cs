using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "medicamentos")]
    public class Medicamento
    {
        [Column(Name = "id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public int Id { get; set; } // CHAVE PRIMÁRIA
        [Column(Name = "nome", CanBeNull = false)]
        public string Nome { get; set; }
        [Column(Name = "tarja")]
        public string Tarja { get; set; }
        [Column(Name = "classe_terapeutica")]
        public string ClasseTerapeutica { get; set; }
        [Column(Name = "posologia")]
        public string Posologia { get; set; }
        [Column(Name = "unidade")]
        public string Unidade { get; set; }

        public Medicamento() { }

        public Medicamento(int id, string nome, string tarja, string classeTerapeutica, 
                                string posologia, string unidade)
        {
            this.Id = id;
            this.Nome = nome;
            this.Tarja = tarja;
            this.ClasseTerapeutica = classeTerapeutica;
            this.Posologia = posologia;
            this.Unidade = unidade;
        }
    }
}
