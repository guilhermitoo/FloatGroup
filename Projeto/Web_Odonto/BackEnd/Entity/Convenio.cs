using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Linq.Mapping;
namespace BackEnd.Entity
{
     [Table(Name = "convenios")]
    public class Convenio
    {
        [Column(Name = "id", IsDbGenerated = true, IsPrimaryKey = true, CanBeNull = false)]
        public int Id { get; set; } // CHAVE PRIMÁRIA
        [Column(Name = "razao_social")]
        public string RazaoSocial { get; set; }
        [Column(Name="nome_fantasia")]
        public string NomeFantasia { get; set; }
        [Column(Name = "cnpj")]
        public string Cnpj { get; set; }
        [Column(Name = "ie")]
        public string Ie { get; set; }        

        public Convenio() { }

        public Convenio(int id, string razaoSocial, string nomeFantasia, string cnpj, string ie)
        {
            this.Id = id;
            this.RazaoSocial = razaoSocial;
            this.NomeFantasia = nomeFantasia;
            this.Cnpj = cnpj;
            this.Ie = ie;            
        }

    }
}
