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
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pessoa pessoa = Session["pessoa"] as pessoa;
            
            if (pessoa != null)
            {
                pnlLogado.Visible = true;
                pnlNaoLogado.Visible = false;
                lblNomeUsuario.Text = pessoa.nome;
            }
            else
            {
                pnlNaoLogado.Visible = true;
                pnlLogado.Visible = false;
            }
        }

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            PessoaModel pModel= new PessoaModel();
            pessoa pessoa = pModel.ObterUsuario(txtUsuario.Text, txtSenha.Text);

            if (pessoa != null)
            {
                Session["pessoa"] = pessoa;                
                Response.Redirect("index.aspx");
            }
            else
            {
                lblErro.Text = "Usuário ou senha inválidos!";
            }
        }

        protected void btnSairLogado_Click(object sender, EventArgs e)
        {
            pessoa pessoa = Session["pessoa"] as pessoa;

            if (pessoa != null)
            {
                Session.Remove("pessoa");
                Response.Redirect("index.aspx");
            }
        }
    }
}