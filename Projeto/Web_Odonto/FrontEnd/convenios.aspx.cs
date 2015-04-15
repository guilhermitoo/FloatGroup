using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Entity;
using System.Configuration;
using BackEnd.Model;

namespace FrontEnd
{
    public partial class convenios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            Convenio convenio = new Convenio();

            convenio.Cnpj = txtCNPJ.Text;
            convenio.Ie = txtIe.Text;
            convenio.RazaoSocial = txtRazao.Text;
            convenio.NomeFantasia = txtNomeFantasia.Text;

            string sConexao = ConfigurationManager.ConnectionStrings["sConexao"].ConnectionString;

            ConvenioModel model = new ConvenioModel(sConexao);

            model.Inserir(convenio);

        }
    }
}