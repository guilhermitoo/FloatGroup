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

        // verifica se tem tratamento em aberto para o paciente
        public bool TemTratamentoPendente(paciente p)
        {
            using(WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    String sSql = "select T.avaliacao_id "+
                                    "from tratamentos T "+
                                    "join avaliacoes A on (A.id = T.avaliacao_id) "+
                                    "where T.status < 3 "+
                                    "and A.paciente_id = " + p.pessoa_id.ToString();
                    var query = db.ExecuteQuery<tratamento>(sSql);
                
                    return (query.Count() > 0);
                }
                catch { return false; }
            }            
        }

    }// final
}