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

            MedicamentoModel model = new MedicamentoModel();

            // asp:repeater
            rlistaMedicamentos.DataSource = model.Listar();
            rlistaMedicamentos.DataBind();
        }

        protected void tbnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("medicamentos.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {            
            MedicamentoModel model = new MedicamentoModel();

            rlistaMedicamentos.DataSource = model.ListarPorNome(txtNomeMedicamento.Text);
            rlistaMedicamentos.DataBind();
        }
    }
}