using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class MedicamentoModel
    {        
        public MedicamentoModel() { }

        public bool InserirAtualizar(medicamento m)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<medicamento> tabelaMedicamento = db.GetTable<medicamento>();
                if (m.id == 0)
                {
                    db.cadMedicamento(m.nome, m.classe_terapeutica, m.tarja, m.posologia, m.unidade);
                    tabelaMedicamento.Context.SubmitChanges();
                }
                else
                {
                    db.alteraMedicamento(m.id, m.nome, m.classe_terapeutica, m.tarja, m.posologia, m.unidade);
                    tabelaMedicamento.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(medicamento medicamento)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<medicamento> tabelaMedicamento = db.GetTable<medicamento>();
                    tabelaMedicamento.DeleteOnSubmit(tabelaMedicamento.First(p => p.id == medicamento.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public medicamento Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<medicamento> tabelaMedicamento = db.GetTable<medicamento>();
                return tabelaMedicamento.First(p => p.id == id);
            }
        }

        public List<medicamento> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<medicamento> tabelaMedicamento = db.GetTable<medicamento>();
                return tabelaMedicamento.ToList();
            }
        }

        public List<medicamento> ListarPorNome(string Nome)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                
                String sSql = "select * from medicamentos m where m.nome like '%" + Nome + "%' ";
                var query = db.ExecuteQuery<medicamento>(sSql);
                return query.ToList();                
            }
        }
    }
}
