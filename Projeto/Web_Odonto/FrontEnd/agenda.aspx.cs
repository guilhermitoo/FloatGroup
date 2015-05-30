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
                // pega a data de hoje
                txtData.Value = DateTime.Now.ToShortDateString();                
            }
            // verifica qual foi o botão que fez o PostBack e realiza as alterações
            string parameter = Request["__EVENTARGUMENT"];
            if (parameter == "anterior")
            {
                txtData.Value = DateTime.Parse(txtData.Value).AddDays(-1).ToShortDateString();
            }
            else if (parameter == "posterior")
            {
                txtData.Value = DateTime.Parse(txtData.Value).AddDays(1).ToShortDateString();
            }
            // exibe a data em formato longo, ou seja, por escrito
            txtTexto.Text = DateTime.Parse(txtData.Value).ToLongDateString();
            DentistaModel dModel = new DentistaModel();
            // carrega a agenda do dentista na data selecionada
            gvAgenda.DataSource = dModel.Agenda(Int32.Parse(ddDentistas.SelectedValue), DateTime.Parse(txtData.Value));
            gvAgenda.DataBind();
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agendamento.aspx");
        }

        protected void btnCarregaAgenda_Click(object sender, EventArgs e)
        {
            
        }

        protected void gvAgenda_RowDataBound(object sender, GridViewRowEventArgs e)
        {            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int linha = e.Row.RowIndex;
                Int32 id = (Int32)gvAgenda.DataKeys[linha].Value;
                String tipo = gvAgenda.DataKeys[linha][1].ToString();
                v_agenda v = new v_agenda();
                AtendimentoModel atendModel = new AtendimentoModel();
                v = atendModel.AgendamentoObter(id,tipo);

                int status = v.status;
                if (status == 2)
                {
                    e.Row.BackColor = System.Drawing.Color.LightGreen;
                    //Int32 id = (Int32)gvAgenda.DataKeys(linha)("tipo");
                }
                else if (status == 3)
                {
                    e.Row.BackColor = System.Drawing.Color.LightPink;                    
                }
                else
                {
                    e.Row.BackColor = System.Drawing.Color.White;
                }
            }
        }

        protected void gvAgenda_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            Int32 id = (Int32)gvAgenda.DataKeys[linha].Value;
            String tipo = gvAgenda.DataKeys[linha][1].ToString();
            
            int status = 0;
            // deve verificar se é avaliação ou atendimento e modificar o status
            if (e.CommandName == "Adiar")
            {// se for adiar, muda o status para 3
                status = 3;
            }
            else if (e.CommandName == "Confirmar")
            {// se for confirmar, muda o status para 2
                status = 2; 
            }

            if (status > 0)
            {
                AvaliacaoModel avm = new AvaliacaoModel();
                AtendimentoModel atm = new AtendimentoModel();
                if (tipo == "AV")
                {
                    avm.MudarStatus(id, status);
                }
                else if (tipo == "AT")
                {
                    atm.MudarStatus(id, status);
                }                
            }
            

        }
                

    }
}