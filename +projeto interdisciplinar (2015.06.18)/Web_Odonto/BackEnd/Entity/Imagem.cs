using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BackEnd.Entity
{
    public class Imagem
    {
        public int Id { get; set; } // CHAVE PRIMÁRIA
        public Paciente Paciente { get; set; } // CHAVE PRIMÁRIA
        public string Descricao { get; set; }
        public Byte Arquivo { get; set; }

        public Imagem() { }

        public Imagem(int Id,Paciente paciente, string descricao, byte arquivo)
        {
            this.Id = Id;
            this.Paciente = paciente;
            this.Descricao = descricao;
            this.Arquivo = arquivo;
        }

        
    }
}
