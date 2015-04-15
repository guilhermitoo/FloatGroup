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
    public partial class listaCidades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            CidadeModel model = new CidadeModel(sConexao);

            // asp:repeater
            rlistaCidades.DataSource = model.Listar();
            rlistaCidades.DataBind();
        }
    }
}