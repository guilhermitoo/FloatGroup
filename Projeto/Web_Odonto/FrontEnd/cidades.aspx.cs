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
    public partial class cidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null && !IsPostBack)
            {                                                
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                CidadeModel model = new CidadeModel();
                //recupera o produto do id informado
                cidade cidade = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtNome.Text = cidade.nome;
                ddUF.Items.FindByText(cidade.uf);                              
            }

        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            cidade cidade = new cidade();
            cidade.nome = txtNome.Text;
            cidade.uf = ddUF.Text;            

            CidadeModel model = new CidadeModel();
          
            // se tiver ID preenche o parâmetro
            if (Request.QueryString["ID"] != null)            
                cidade.id = int.Parse(Request.QueryString["ID"]);
            
            // faz a inserção ou atualização do cadastro da cidade
            if ( model.InserirAtualizar(cidade) )             
                Response.Redirect("cidades.aspx");                             
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            Response.Redirect("listaCidades.aspx");
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            // limpa os campos da tela
            Response.Redirect("cidades.aspx");                       
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            CidadeModel model = new CidadeModel();
            cidade cid = new cidade();

            if (Request.QueryString["ID"] != null)
                cid.id = int.Parse(Request.QueryString["ID"]);

            // verificar se deseja realmente excluir
            model.Excluir(cid);

            Response.Redirect("index.aspx");
        }

        
    }
}