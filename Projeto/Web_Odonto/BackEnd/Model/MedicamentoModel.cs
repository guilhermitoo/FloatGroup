using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using BackEnd.Data;
using BackEnd.Entity;
using System.Data.Linq;

namespace BackEnd.Model
{
    public class MedicamentoModel
    {
        private string sConexao;
        public MedicamentoModel(string sConexao)
        {
            this.sConexao = sConexao;
        }

        public bool Inserir(Medicamento medicamento)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    bd.TabelaMedicamento.InsertOnSubmit(medicamento);
                    bd.SubmitChanges();
                    return true;
                }
                catch
                {
                    return false;
                }
            }
        }

        public bool Editar(Medicamento medicamento)
        {
            using (WebOdontoContext bd = new WebOdontoContext(sConexao))
            {
                try
                {
                    var query = from med in bd.TabelaMedicamento
                                where med.Id == medicamento.Id
                                select med;
                    foreach (Medicamento med in query)
                    {
                        med.Nome = medicamento.Nome;
                        med.ClasseTerapeutica = medicamento.ClasseTerapeutica;                       
                        
                        med.Id = medicamento.Id;
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
    }
}
