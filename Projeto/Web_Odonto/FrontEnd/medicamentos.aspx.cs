using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Entity;
using System.Configuration;
using BackEnd.Model;

namespace FrontEnd
{
    public partial class medicamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null && !IsPostBack)
            {
                // recupera a string de conexão
                string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                MedicamentoModel model = new MedicamentoModel(sConexao);
                //recupera o produto do id informado
                Medicamento medicamento = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtNome.Text = medicamento.Nome;
                
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Medicamento medicamento = new Medicamento();
            medicamento.Nome = txtNome.Text;
            medicamento.ClasseTerapeutica = txtClasseTerapeutica.Text;
            medicamento.Tarja = txtTarja.Text;
            medicamento.Posologia = txtPosologia.InnerText;
            medicamento.Unidade = txtUnidade.Text;

            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            MedicamentoModel model = new MedicamentoModel(sConexao);

            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
            {
                medicamento.Id = int.Parse(Request.QueryString["ID"]);
                model.Editar(medicamento);
            }
            else
            {
                model.Inserir(medicamento);
            }
            Response.Redirect("medicamentos.aspx");  
        }
    }
}