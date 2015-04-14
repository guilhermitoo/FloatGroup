using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using System.Data.SqlClient;

namespace BackEnd.Data
{
    public class Conexao : IDisposable
    {
        public SqlConnection    Cnn { get; set; }
        public SqlCommand       Cmd { get; set; }
        public SqlDataReader    Dr { get; set; }

        public Conexao(string sConexao)
        {
            try
            {
                Cnn = new SqlConnection();
                Cnn.ConnectionString = sConexao;
                Cnn.Open();
            }
            catch { 
            }
        }



        public void Dispose()
        {
            try
            {
                Cnn.Close();
            }
            catch { }
        }
    }
}
