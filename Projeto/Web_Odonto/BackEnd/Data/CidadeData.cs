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
        public CidadeData(string stringConexao) : base(stringConexao) { }
        
        // Função inserir cidade
        public bool Inserir(Cidade cidade)
        {
            bool ok = false;
            try
            {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"insert into cidades values (@nome,@uf);";

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
                Cmd.CommandText = @"update cidades set nome = @nome, uf = @uf where id = @id ";

                Cmd.Parameters.AddWithValue("@nome", cidade.Nome);
                Cmd.Parameters.AddWithValue("@uf", cidade.UF);                
                Cmd.Parameters.AddWithValue("@id", cidade.Id);

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch
            { }
            return ok;
        }
    }
}
