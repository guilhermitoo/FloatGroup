using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Model;

namespace FrontEnd
{
    public partial class Imprimir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {       
            Control ctrl = (Control)Session["ctrl"];
            PrintWeb.PrintWebControl(ctrl);    
        }
    }
}