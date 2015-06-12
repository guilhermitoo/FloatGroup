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
                    // verifica se está atrasado
                    if (v.data < DateTime.Now)
                        e.Row.BackColor = System.Drawing.Color.LightYellow;                    
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

            // deve verificar se é avaliação ou atendimento e redirecionar para a tela específica
            if (e.CommandName == "Abrir")
            {
                AtendimentoModel atModel = new AtendimentoModel();
                v_agenda a = new v_agenda();
                // busca o registro para verificar o status SE for avaliação
                // atendimentos ele exibe qualquer status
                a = atModel.AgendamentoObter(id, tipo);
                if (tipo == "AV")
                {
                    if (a.status == 1)
                    {
                        Response.Redirect("avaliacao.aspx?ID=" + id.ToString());
                    }
                }
                else if (tipo == "AT")
                {
                    Response.Redirect("atendimento.aspx?ID=" + id.ToString());
                }                
            }            
        }
                

    }
}