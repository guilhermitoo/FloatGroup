using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FrontEnd
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ddTipoPessoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModificaCampos();            
        }

        private void ModificaCampos()
        {
            // verifica qual cadastro foi selecionado e modifica os campos que estão sendo exibidos
            String sTipo = ddTipoPessoa.SelectedValue ;

            txtCargo.Visible = sTipo.Equals("F");
            txtCro.Visible = sTipo.Equals("D");
            txtSalario.Visible = sTipo.Equals("F");
            ddConvenio.Visible = sTipo.Equals("P");
            ddTipoUsuario.Visible = ( sTipo.Equals("F") || sTipo.Equals("D"));
            txtSenha.Visible = (sTipo.Equals("F") || sTipo.Equals("D"));
            txtUsuario.Visible = (sTipo.Equals("F") || sTipo.Equals("D"));

            lblCargo.Visible = txtCargo.Visible;
            lblCro.Visible = txtCro.Visible;
            lblSalario.Visible = txtSalario.Visible;
            lblConvenio.Visible = ddConvenio.Visible;
            lblTipoUsuario.Visible = ddTipoUsuario.Visible;
            lblSenha.Visible = txtSenha.Visible;
            lblUsuario.Visible = txtUsuario.Visible;
        }
    }
}