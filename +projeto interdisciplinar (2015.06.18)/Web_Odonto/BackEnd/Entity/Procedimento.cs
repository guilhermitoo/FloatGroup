using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;

namespace BackEnd.Entity
{
    [Table(Name = "procedimentos")]
    public class Procedimento
    {
        [Column(Name = "id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public int Id { get; set; }
        [Column(Name = "descricao", CanBeNull = false)]
        public string Descricao { get; set; }

        public Procedimento() { }

        public Procedimento(int id, string descricao)
        { 
            this.Id = id;
            this.Descricao = descricao;
        }
    }
}
