using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.EntityData;
using BackEnd.Model;
using System.Web.Services;

namespace FrontEnd
{
    public partial class agenda : System.Web.UI.Page
    {
        // variavel utilizada para verificar se foi clidado no botão de busca tratamento        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PessoaModel p = new PessoaModel();
                // atribui uma lista de dentistas para o DropDown
                ddDentistas.DataSource = p.ListarDentistas();
                ddDentistas.DataValueField = "id";
                ddDentistas.DataTextField = "nome";
                ddDentistas.DataBind();
                ddDentistas.SelectedIndex = 0;

            }
        }

        protected void btnFinalizaAgendamento_Click(object sender, EventArgs e)
        {
            /*if ( cbVerificaAval.)
            {
                CadAvaliacao();
            }*/
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendamento.aspx");
        }

    }
}