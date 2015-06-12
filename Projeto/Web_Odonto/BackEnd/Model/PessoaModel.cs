using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.EntityData;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class PessoaModel
    {
        public PessoaModel() { }

        public bool InserirAtualizar(pessoa d)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();

            try
            {
                Table<pessoa> tbPessoa = db.GetTable<pessoa>();
                // verifica se tem pessoa com essa ID
                // se sim, atualiza
                // se não, cadastra
                if (Verifica(d.id))
                {// ATUALIZA
                    db.alteraPessoa(d.id ,d.nome, d.cpf, d.rg, d.nascimento, d.telefone1, d.telefone2,
                                   d.sexo, d.endereco, d.usuario, d.senha, d.status, d.obs,
                                   d.tipoUsuario, d.cidade_id);
                    tbPessoa.Context.SubmitChanges();
                }
                else
                {// CADASTRA
                    db.cadPessoa(d.nome, d.cpf, d.rg, d.nascimento, d.telefone1, d.telefone2,
                                   d.sexo, d.endereco, d.usuario, d.senha, d.status, d.obs,
                                   d.tipoUsuario, d.cidade_id);
                    tbPessoa.Context.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        public pessoa Obter(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<pessoa> tabelaPessoa = db.GetTable<pessoa>();
                return tabelaPessoa.First(p => p.id == id);
            }
        }

        public List<pessoa> Listar()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                Table<pessoa> tabelaPessoa = db.GetTable<pessoa>();
                return tabelaPessoa.ToList();
            }
        }

        public bool ValidaCPF(string cpf) 
        {            
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                
                String sSql = "select P.id from pessoas P where P.cpf = '"+cpf+"' ";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return (query.Count() < 1);
            }           
        }
        
        public int ObterCPF(string cpf)
        {
            // pelo CPF retorna o ID
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select P.id from pessoas P where P.cpf = '" + cpf + "' ";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return (query.First()).id;
            }
        }

        public bool Verifica(int id)
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select * from pessoas where id = " + id;
                var query = db.ExecuteQuery<pessoa>(sSql);
                // retorna true se achou algum dentista com esse id
                return (query.ToList().Count > 0);
            }
        }

        public List<pessoa> ListarPorNome(string Nome,char Tipo)
        {
            // variável Tipo:
            // T = PESSOAS
            // P = PACIENTES
            // D = DENTISTAS
            // F = FUNCIONARIOS
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "";
                if (Tipo == 'T')
                {
                    sSql = "select P.* from pessoas P where P.nome like '%" + Nome + "%' order by P.nome";
                }
                else 
                {
                    if (Tipo == 'P')
                    { // PACIENTES
                        sSql = "select p.*,d.* from pacientes ";
                        
                    }
                    else if (Tipo == 'D')
                    { // DENTISTAS
                        sSql = "select p.*,d.* from dentistas ";
                        
                    }
                    else
                    { // FUNCIONARIOS
                        sSql = "select p.*,d.* from funcionarios ";                        
                    }
                    sSql = sSql + " d join pessoas p " +
                                 " on (d.pessoa_id = p.id) " +
                                 " where p.nome like '%" + Nome + "%' " +
                                 " order by p.nome";
                }
                var query = db.ExecuteQuery<pessoa>(sSql);
                return query.ToList();                
            }
        }

        public List<pessoa> ListarDentistas()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select p.id,p.nome from dentistas d join pessoas p "+
                              " on (d.pessoa_id = p.id) where p.status = 1 order by p.nome";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return query.ToList();
            }
        }

        public List<pessoa> ListarPacientes()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select p.id,p.nome from pacientes d join pessoas p "+
                              " on (d.pessoa_id = p.id) where p.status = 1 order by p.nome";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return query.ToList();
            }
        }

        public List<pessoa> ListarFuncionarios()
        {
            using (WebOdontoClassesDataContext db = new WebOdontoClassesDataContext())
            {
                String sSql = "select p.id,p.nome,p.cpf,p.rg,p.status,d.cargo from funcionarios d join pessoas p " +
                              " on (d.pessoa_id = p.id) where p.status = 1 order by p.nome";
                var query = db.ExecuteQuery<pessoa>(sSql);
                return query.ToList();
            }
        }

        public pessoa ObterUsuario(string usuario, string senha)
        {
            WebOdontoClassesDataContext db = new WebOdontoClassesDataContext();
            var pessoa = (from p in db.GetTable<pessoa>()
                          where p.usuario == usuario && p.senha == senha
                          select p).SingleOrDefault();
            return pessoa;
        }

    }
}