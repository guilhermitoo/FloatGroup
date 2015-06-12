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
    public partial class tratamentosPeriodo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDatIni.Value = DateTime.Now.ToShortDateString();
                txtDatFin.Value = DateTime.Now.Date.AddMonths(1).ToShortDateString();
                btnPrint.Visible = false;
                pnlQtd.Visible = false;
            }
        }

        protected void btnGerar_Click(object sender, EventArgs e)
        {
            TratamentoModel tModel = new TratamentoModel();

            if ((txtDatIni.Value != "") && (txtDatFin.Value != ""))
            {
                DateTime datIni, datFin;
                datIni = DateTime.Parse(txtDatIni.Value);
                datFin = DateTime.Parse(txtDatFin.Value);
                gvRelatorio.DataSource = tModel.ListarPorPeriodo(datIni, datFin);
                gvRelatorio.DataBind();
            }
            else
            {
                gvRelatorio.DataSource = null;
                gvRelatorio.DataBind();
            }
            btnPrint.Visible = (gvRelatorio.Rows.Count > 0);
            pnlQtd.Visible = (gvRelatorio.Rows.Count > 0);
            lbQtdReg.Text = gvRelatorio.Rows.Count.ToString();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["ctrl"] = pnlRelatorio;
            ClientScript.RegisterStartupScript(this.GetType(), "onclick",
            "<script language=javascript>window.open('Imprimir.aspx','Imprimir','height=300px,width=300px,scrollbars=1');</script>");
        }
    }
}