using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Convenio
    {
        public int Id { get; set; } // CHAVE PRIMÁRIA
        public string RazaoSocial { get; set; }
        public string NomeFantasia { get; set; }
        public string Cnpj { get; set; }
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
