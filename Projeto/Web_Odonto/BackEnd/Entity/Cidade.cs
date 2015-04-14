using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "cidades")]
    public class Cidade
    {
        [Column(Name = "id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public int      Id   { get; set; } // CHAVE PRIMÁRIA
        [Column(Name = "nome", CanBeNull = false)]
        public string   Nome { get; set; }
        [Column(Name = "uf")]
        public string   UF   { get; set; }

        public Cidade() { }

        public Cidade(int id, string nome, string UF)
        {
            this.Id = id;
            this.Nome = nome;
            this.UF = UF;
        }
    }
}
