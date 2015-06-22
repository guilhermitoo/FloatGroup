using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Model;
using System.Configuration;

namespace FrontEnd
{
    public partial class listaConvenios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            ConvenioModel model = new ConvenioModel();

            // asp:repeater
            rlistaConvenio.DataSource = model.Listar();
            rlistaConvenio.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {            
            ConvenioModel model = new ConvenioModel();

            rlistaConvenio.DataSource = model.ListarPorNome(txtConvenio.Text);
            rlistaConvenio.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("convenios.aspx");
        }
    }
}