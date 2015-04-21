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
    public partial class procedimentos : System.Web.UI.Page
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
                ProcedimentoModel model = new ProcedimentoModel(sConexao);
                //recupera o produto do id informado
                Procedimento procedimento = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtDescricao.Text = procedimento.Descricao;                
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
            Procedimento procedimento = new Procedimento();
            procedimento.Descricao = txtDescricao.Text;            

            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            ProcedimentoModel model = new ProcedimentoModel(sConexao);

            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
            {
                procedimento.Id = int.Parse(Request.QueryString["ID"]);
                model.Editar(procedimento);
            }
            else
            {
                model.Inserir(procedimento);
            }
            Response.Redirect("procedimentos.aspx"); 
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaProcedimentos.aspx");
        }
    }
}