using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.EntityData;
using BackEnd.Model;

namespace FrontEnd
{
    public partial class listaPessoas : System.Web.UI.Page
    {
        char tipo = 'T';
        protected void Page_Load(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();
            
            if (Request.QueryString["TP"] != null)
            {
                tipo = Char.Parse(Request.QueryString["TP"]);
                string txt;
                if (tipo == 'P')
                {
                    txt = (string)GetLocalResourceObject("tituloPaciente");                    
                }
                else if (tipo == 'F')
                {
                    txt = (string)GetLocalResourceObject("tituloFuncionario"); 
                }
                else if (tipo == 'D')
                {
                    txt = (string)GetLocalResourceObject("tituloDentista"); 
                }
                else
                {
                    txt = (string)GetLocalResourceObject("tituloPessoa"); 
                }
                lbTitulo.Text = txt;
            }
            // asp:repeater
            rListaPessoas.DataSource = model.ListarPorNome("", tipo);
            rListaPessoas.DataBind();

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();

            rListaPessoas.DataSource = model.ListarPorNome(txtNome.Text,tipo);
            rListaPessoas.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("pessoas.aspx");
        }
    }
}