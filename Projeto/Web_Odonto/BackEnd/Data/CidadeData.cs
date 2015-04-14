using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using BackEnd.Entity;

namespace BackEnd.Data
{
    class CidadeData : Conexao
    {
        public CidadeData(string sConexao) : base(sConexao) { }
        
        // Função inserir cidade
        public bool Inserir(Cidade cidade)
        {
            bool ok = false;
            try
            {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"exec cadCidade @nome,@uf;";

                Cmd.Parameters.AddWithValue("@nome", cidade.Nome);
                Cmd.Parameters.AddWithValue("@uf", cidade.UF);                

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch { }
            return ok;
        }

        // função editar cidade
        public bool Editar(Cidade cidade)
        {
            bool ok = false;
            try
            {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"exec alteraCidade @id,@nome,@uf;";

                Cmd.Parameters.AddWithValue("@id", cidade.Id);
                Cmd.Parameters.AddWithValue("@nome", cidade.Nome);
                Cmd.Parameters.AddWithValue("@uf", cidade.UF);                
                

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch
            { }
            return ok;
        }

        public bool Excluir(Cidade cidade)
        {
            bool ok = true;
            try {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"delete * from cidades where id = @id";

                Cmd.Parameters.AddWithValue("@id", cidade.Id);

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch { }
            return ok;
        }

    }
}
