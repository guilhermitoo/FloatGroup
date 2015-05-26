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
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pessoa pessoa = Session["pessoa"] as pessoa;

            if (pessoa != null)
            {                
                string txt = (string)GetLocalResourceObject("bemvindo");
                lblNomeUsuarioPrincipal.Text = txt + " " + pessoa.nome;
            }
        }
    }
}