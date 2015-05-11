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
    public partial class agenda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
            PessoaModel p = new PessoaModel();            
            // atribui uma lista de dentistas para o DropDown
            ddDentistas.DataSource = p.ListarDentistas();
            ddDentistas.DataValueField = "id";
            ddDentistas.DataTextField = "nome";
            ddDentistas.DataBind();
            ddDentistas.SelectedIndex = 0;
            
            // atribui uma lista de dentistas para o DropDown
            ddPacientes.DataSource = p.ListarPacientes();
            ddPacientes.DataValueField = "id";
            ddPacientes.DataTextField = "nome";
            ddPacientes.DataBind();
            ddPacientes.SelectedIndex = 0;

        }
    }
}