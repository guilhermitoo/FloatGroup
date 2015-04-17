﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.Data;
using BackEnd.Entity;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class CidadeModel
    {
        private string sConexao;
        public CidadeModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Cidade cidade)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaCidade.InsertOnSubmit(cidade);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Cidade cidade)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from cid in bd.TabelaCidade
                                where cid.Id == cidade.Id
                                select cid;
                    foreach (Cidade cid in query)
                    {
                        cid.Nome = cidade.Nome;
                        cid.UF = cidade.UF;                       
                        cid.Id = cidade.Id;
                    }

                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Excluir(Cidade cidade)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaCidade.DeleteOnSubmit(bd.TabelaCidade.First(p => p.Id == cidade.Id));
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public Cidade Obter(int id)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaCidade.First(p => p.Id == id);
            }
        }

        public List<Cidade> Listar()
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                return bd.TabelaCidade.ToList();
            }
        }

        public List<Cidade> ListarPorNome(string Nome)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                
                String sSql = "select * from cidades C where C.nome like '%"+Nome+"%' ";
                var query = bd.ExecuteQuery<Cidade>(sSql);
                return query.ToList();
                //return bd.TabelaCidade.ToList(); 
            }
        }

    }
}
