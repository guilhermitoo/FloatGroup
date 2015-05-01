using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class PacienteModel
    {
        public PacienteModel() { }

        public bool InserirAtualizar(paciente d)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<paciente> tabelaPaciente = db.GetTable<paciente>();
                if (Verifica(d.pessoa.id))
                {// SE EXISTIR ATUALIZA
                    db.alteraPaciente(d.pessoa.id, d.convenio_id);
                    tabelaPaciente.Context.SubmitChanges();
                }
                else
                {// SE NÃO CADASTRA
                    db.cadPaciente(d.pessoa.id, d.convenio_id);
                    tabelaPaciente.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(paciente paciente)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<paciente> tabelaPaciente = db.GetTable<paciente>();
                    tabelaPaciente.DeleteOnSubmit(tabelaPaciente.First(p => p.pessoa.id == paciente.pessoa.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public paciente Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<paciente> tabelaPaciente = db.GetTable<paciente>();
                return tabelaPaciente.First(p => p.pessoa.id == id);
            }
        }

        public List<paciente> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<paciente> tabelaPaciente = db.GetTable<paciente>();
                return tabelaPaciente.ToList();
            }

        }

        public bool Verifica(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from pacientes where pessoa_id = " + id;
                var query = db.ExecuteQuery<paciente>(sSql);
                return (query.ToList().Count > 0);
            }

        }

    }// final
}