using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.EntityData;
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
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                MedicamentoModel model = new MedicamentoModel();
                //recupera o produto do id informado
                medicamento medicamento = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtNome.Text = medicamento.nome;
                txtClasseTerapeutica.Text = medicamento.classe_terapeutica;
                txtTarja.Text = medicamento.tarja;
                txtUnidade.Text = medicamento.unidade;
                txtPosologia.InnerText = medicamento.posologia;
                
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            medicamento medicamento = new medicamento();
            medicamento.nome = txtNome.Text;
            medicamento.classe_terapeutica = txtClasseTerapeutica.Text;
            medicamento.tarja = txtTarja.Text;
            medicamento.posologia = txtPosologia.InnerText;
            medicamento.unidade = txtUnidade.Text;            

            MedicamentoModel model = new MedicamentoModel();

            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)            
                medicamento.id = int.Parse(Request.QueryString["ID"]);
            // faz a inserção ou atualização do cadastro da cidade
            if (model.InserirAtualizar(medicamento))   
                Response.Redirect("medicamentos.aspx");  
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("medicamentos.aspx");
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaMedicamentos.aspx");
        }
    }
}