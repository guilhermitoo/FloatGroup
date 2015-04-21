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
    public partial class convenios : System.Web.UI.Page
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
                ConvenioModel model = new ConvenioModel(sConexao);
                //recupera o produto do id informado
                Convenio convenio = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtRazao.Text = convenio.RazaoSocial;
                txtNomeFantasia.Text = convenio.NomeFantasia;
                txtCNPJ.Text = convenio.Cnpj;
                txtIe.Text = convenio.Ie;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Convenio convenio = new Convenio();

            convenio.Cnpj = txtCNPJ.Text;
            convenio.Ie = txtIe.Text;
            convenio.RazaoSocial = txtRazao.Text;
            convenio.NomeFantasia = txtNomeFantasia.Text;

            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            ConvenioModel model = new ConvenioModel(sConexao);

            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
            {
                convenio.Id = int.Parse(Request.QueryString["ID"]);
                model.Editar(convenio);
            }
            else
            {
                model.Inserir(convenio);
            }
            Response.Redirect("convenios.aspx");  
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("convenios.aspx");
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaConvenios.aspx");
        }
    }
}