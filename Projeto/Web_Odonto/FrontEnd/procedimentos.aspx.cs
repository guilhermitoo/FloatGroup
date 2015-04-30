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
    public partial class procedimentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null && !IsPostBack)
            {                                
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                ProcedimentoModel model = new ProcedimentoModel();
                //recupera o produto do id informado
                procedimento procedimento = model.Obter(id);
                //preencher caixas de texto com valores de produto
                txtDescricao.Text = procedimento.descricao;                
            }
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("procedimentos.aspx");
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            procedimento procedimento = new procedimento();
            procedimento.descricao = txtDescricao.Text;                        

            ProcedimentoModel model = new ProcedimentoModel();

            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
                procedimento.id = int.Parse(Request.QueryString["ID"]);
            // faz a inserção ou atualização do cadastro
            if (model.InserirAtualizar(procedimento))                 
                Response.Redirect("procedimentos.aspx"); 
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaProcedimentos.aspx");
        }
    }
}