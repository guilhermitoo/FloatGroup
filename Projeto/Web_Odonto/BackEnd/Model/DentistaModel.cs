using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class DentistaModel
    {        
        public DentistaModel() {}

        public bool InserirAtualizar(dentista d)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                if (d.pessoa.id == 0)
                {
                    db.cadDentista(d.pessoa.nome, d.pessoa.cpf, d.pessoa.rg, d.pessoa.nascimento, d.pessoa.telefone1, d.pessoa.telefone2,
                                   d.pessoa.sexo, d.pessoa.endereco, d.pessoa.usuario, d.pessoa.senha, d.pessoa.status, d.pessoa.obs,
                                   d.pessoa.tipoUsuario, d.pessoa.cidade_id, d.cro, d.salario);
                    tabelaDentista.Context.SubmitChanges();
                }
                else
                {
                    db.alteraDentista(d.pessoa.id,d.pessoa.nome, d.pessoa.cpf, d.pessoa.rg, d.pessoa.nascimento, d.pessoa.telefone1, d.pessoa.telefone2,
                                      d.pessoa.sexo, d.pessoa.endereco, d.pessoa.usuario, d.pessoa.senha, d.pessoa.status, d.pessoa.obs,
                                      d.pessoa.tipoUsuario, d.pessoa.cidade_id, d.cro, d.salario);
                    tabelaDentista.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Excluir(dentista dentista)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                try
                {
                    Table<dentista> tabelaDentista = db.GetTable<dentista>();
                    tabelaDentista.DeleteOnSubmit(tabelaDentista.First(p => p.pessoa.id == dentista.pessoa.id));
                    db.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public dentista Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                return tabelaDentista.First(p => p.pessoa.id == id);
            }
        }

        public List<dentista> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<dentista> tabelaDentista = db.GetTable<dentista>();
                return tabelaDentista.ToList();
            }

        }

        public bool Verifica(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from dentistas where pessoa_id = " + id;
                var query = db.ExecuteQuery<dentista>(sSql);
                return (query.ToList().Count > 0);                                 
            }
           
        }
    }//final
}