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
        protected void Page_Load(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();

            // asp:repeater
            rListaPessoas.DataSource = model.Listar();
            rListaPessoas.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PessoaModel model = new PessoaModel();

            rListaPessoas.DataSource = model.ListarPorNome(txtNome.Text);
            rListaPessoas.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("pessoas.aspx");
        }
    }
}