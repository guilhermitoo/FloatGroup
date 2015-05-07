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
    public partial class convenios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["ID"] != null && !IsPostBack)
            {               
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara o objeto model
                ConvenioModel model = new ConvenioModel();
                //recupera o produto do id informado
                convenio convenio = model.Obter(id);

                //preencher caixas de texto com valores de produto
                txtRazao.Text = convenio.razao_social;
                txtNomeFantasia.Text = convenio.nome_fantasia;
                txtCNPJ.Value = convenio.cnpj;
                txtIe.Text = convenio.ie;
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            convenio convenio = new convenio();
            ConvenioModel model = new ConvenioModel();

            if (model.ValidaCNPJ(txtCNPJ.Value))
            {
                convenio.cnpj = txtCNPJ.Value;
                convenio.ie = txtIe.Text;
                convenio.razao_social = txtRazao.Text;
                convenio.nome_fantasia = txtNomeFantasia.Text;

                //se existir ID então faz a edição, se não existir ID, é uma inserção
                if (Request.QueryString["ID"] != null)
                    convenio.id = int.Parse(Request.QueryString["ID"]);

                // faz a inserção ou atualização do cadastro da cidade
                if (model.InserirAtualizar(convenio))
                    Response.Redirect("convenios.aspx");
            }            
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

        protected void btnProcuraCNPJ_Click(object sender, EventArgs e)
        {
            ConvenioModel m = new ConvenioModel();

            // incompleto
            if (m.ValidaCNPJ(txtCNPJ.Value))
            {                
                lblAlertaCNPJ.Text = "CNPJ não cadastrado";
            }
            else
            {
                Response.Redirect("convenios.aspx?ID="+(m.ObterCNPJ(txtCNPJ.Value)).ToString());
            }
        }
    }
}