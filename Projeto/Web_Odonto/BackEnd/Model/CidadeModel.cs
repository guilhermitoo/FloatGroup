using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.Data;
using BackEnd.Entity;

namespace BackEnd.Model
{
    public class CidadeModel
    {
        private string sConexao;
        public CidadeModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Cidade cidade)
        {
            using (CidadeData data = new CidadeData(sConexao))
            {
                return data.Inserir(cidade);
            }
        }

        public bool Editar(Cidade cidade)
        {
            using (CidadeData data = new CidadeData(sConexao))
            {
                return data.Editar(cidade);
            }
        }

        public bool Excluir(Cidade cidade)
        {
            using (CidadeData data = new CidadeData(sConexao))
            {
                return data.Excluir(cidade);
            }
        }
    

    }
}
