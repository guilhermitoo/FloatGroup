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
    public partial class listaMedicamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            MedicamentoModel model = new MedicamentoModel(sConexao);

            // asp:repeater
            rlistaMedicamentos.DataSource = model.Listar();
            rlistaMedicamentos.DataBind();
        }
    }
}