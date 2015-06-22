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
    public partial class listaPacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();

            // asp:repeater
            rListaPacientes.DataSource = model.ListarPorNome("", 'P');
            rListaPacientes.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("pessoas.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();

            rListaPacientes.DataSource = model.ListarPorNome(txtNome.Text, 'P');
            rListaPacientes.DataBind();
        }
    }
}