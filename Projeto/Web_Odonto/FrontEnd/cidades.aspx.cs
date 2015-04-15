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
    public partial class cidades : System.Web.UI.Page
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
                CidadeModel model = new CidadeModel(sConexao);
                //recupera o produto do id informado
                Cidade cidade = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtNome.Text = cidade.Nome;
                ddUF.Items.FindByText(cidade.UF);                              
            }

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Cidade cidade = new Cidade();
            cidade.Nome = txtNome.Text;
            cidade.UF = ddUF.Text;

            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            CidadeModel model = new CidadeModel(sConexao);
          
            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
            {
                cidade.Id = int.Parse(Request.QueryString["ID"]);
                model.Editar(cidade);
            }
            else
            {
                model.Inserir(cidade);
            }        

        
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaCidades.aspx");
        }

        
    }
}