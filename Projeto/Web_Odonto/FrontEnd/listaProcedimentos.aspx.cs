﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BackEnd.Model;
using System.Configuration;

namespace FrontEnd
{
    public partial class listaProcedimentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            ProcedimentoModel model = new ProcedimentoModel();

            // asp:repeater
            rListaProcedimentos.DataSource = model.Listar();
            rListaProcedimentos.DataBind();
        }
        
        protected void btnBuscar_Click(object sender, EventArgs e)
        {            
            ProcedimentoModel model = new ProcedimentoModel();

            rListaProcedimentos.DataSource = model.ListarPorDescricao(txtDescricaoProcedimento.Text);
            rListaProcedimentos.DataBind();
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("procedimentos.aspx");
        }
    }
}