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
            ModificaCampos();
        }

        protected void ddTipoPessoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            ModificaCampos();            
        }

        private void ModificaCampos()
        {
            // verifica qual cadastro foi selecionado e modifica os campos que estão sendo exibidos
            String sTipo = ddTipoPessoa.SelectedValue ;

            dCargo.Visible = sTipo.Equals("F");
            dCro.Visible = sTipo.Equals("D");
            dSalario.Visible = sTipo.Equals("F");
            dConvenio.Visible = sTipo.Equals("P");
            dTipoUsuario.Visible = ( sTipo.Equals("F") || sTipo.Equals("D"));
            dSenha.Visible = (sTipo.Equals("F") || sTipo.Equals("D"));
            dUsuario.Visible = (sTipo.Equals("F") || sTipo.Equals("D"));
        }

    }
}