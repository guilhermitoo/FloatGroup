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
                if (tipo == 'P')
                {
                    lbTitulo.Text = "Lista de Pacientes";
                }
                else if (tipo == 'F')
                {
                    lbTitulo.Text = "Lista de Funcionários";
                }
                else if (tipo == 'D')
                {
                    lbTitulo.Text = "Lista de Dentistas";
                }
                else
                {
                    lbTitulo.Text = "Lista de Pessoas";
                }
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