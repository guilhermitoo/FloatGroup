using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using BackEnd.Entity;

namespace BackEnd.Data
{
    public class PessoaData : Conexao
    {
        public PessoaData(string sConexao) : base(sConexao) { }
    }
}
