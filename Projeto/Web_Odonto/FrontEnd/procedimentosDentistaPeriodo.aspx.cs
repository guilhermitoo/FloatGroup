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
    public partial class procedimentosDentistaPeriodo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDatIni.Value = DateTime.Now.ToShortDateString();
                txtDatFin.Value = DateTime.Now.Date.AddMonths(1).ToShortDateString();
            }
        }

        protected void btnGerar_Click(object sender, EventArgs e)
        {

        }
    }
}