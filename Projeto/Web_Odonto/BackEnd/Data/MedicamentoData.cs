using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using BackEnd.Entity;

namespace BackEnd.Data
{
    public class MedicamentoData : Conexao
    {
        public MedicamentoData(string sConexao) : base(sConexao) { }

        public bool Inserir(Medicamento medicamento)
        {
            bool ok = false;
            try
            {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"exec cadMedicamento @nome,@classe_terapeutica,@tarja,@posologia,@unidade;";

                Cmd.Parameters.AddWithValue("@nome", medicamento.Nome);
                Cmd.Parameters.AddWithValue("@classe_terapeutica", medicamento.ClasseTerapeutica);
                Cmd.Parameters.AddWithValue("@tarja", medicamento.Tarja);
                Cmd.Parameters.AddWithValue("@posologia", medicamento.Posologia);
                Cmd.Parameters.AddWithValue("@unidade", medicamento.Unidade);

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch { }
            return ok;
        }

        public bool Editar(Medicamento medicamento)
        {
            bool ok = false;
            try
            {
                Cmd = new SqlCommand();
                Cmd.Connection = Cnn;
                Cmd.CommandText = @"exec alteraMedicamento @id,@nome,@classe_terapeutica,@tarja,@posologia,@unidade;";

                Cmd.Parameters.AddWithValue("@id", medicamento.Id);
                Cmd.Parameters.AddWithValue("@nome", medicamento.Nome);
                Cmd.Parameters.AddWithValue("@classe_terapeutica", medicamento.ClasseTerapeutica);
                Cmd.Parameters.AddWithValue("@tarja", medicamento.Tarja);
                Cmd.Parameters.AddWithValue("@posologia", medicamento.Posologia);
                Cmd.Parameters.AddWithValue("@unidade", medicamento.Unidade);

                Cmd.ExecuteNonQuery();

                ok = true;
            }
            catch { }
            return ok;
            
        }

    }
}
