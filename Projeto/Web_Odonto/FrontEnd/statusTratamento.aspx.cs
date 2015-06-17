using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Model;
using BackEnd.EntityData;
using System.Resources;

namespace FrontEnd
{
    public partial class statusTratamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {                                      
            if (!IsPostBack)
            {
                PessoaModel p = new PessoaModel();
                ddPaciente.DataSource = p.ListarPacientes();
                ddPaciente.DataValueField = "id";
                ddPaciente.DataTextField = "nome";
                ddPaciente.DataBind();
                ddPaciente.SelectedIndex = 0;
                pnlTratamento.Visible = false;
                // atribui o valor 0 para a barra de progresso.
                bd.Value = "0";
            }           
        }

        protected void btnBuscaTratamento_Click(object sender, EventArgs e)
        {
            // buscar o tratamento
            // antes de realizar o processo da busca do tratamento, limpa o status da tela
            Master.Status("");            
            pnlTratamento.Visible = false;
            try
            {
                TratamentoModel tModel = new TratamentoModel();
                int id = Int32.Parse(ddPaciente.SelectedValue);

                gvListaTratamentos.DataSource = tModel.ListarPorPacienteDetalhado(id);
                gvListaTratamentos.DataBind();
                gvListaTratamentos.Visible = true;
            }
            catch
            {
                gvListaTratamentos.Visible = false;
            }
            
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
             Session["ctrl"] = pnlTratamento;
             ClientScript.RegisterStartupScript(this.GetType(), "onclick",
             "<script language=javascript>window.open('Imprimir.aspx','Imprimir','height=300px,width=300px,scrollbars=1');</script>");
        }

        protected void gvListraTratamentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            int id = (int)gvListaTratamentos.DataKeys[linha].Value;

            if (e.CommandName == "Abrir")
            {
                CarregaTratamento(id);
            }
        }

        private void CarregaTratamento(int id)
        {
            gvListaTratamentos.Visible = false;
            try
            {
                tratamento tratamento = new tratamento();
                TratamentoModel tModel = new TratamentoModel();                
                tratamento = tModel.Obter(id);
                int idTrat = tratamento.avaliacao_id;
                // exibe o número do tratamento e o status
                txtNumTrat.Text = id.ToString();
                // verifica se o tratamento foi concluído, se sim, muda a cor do campo status para verde
                if (tratamento.status == 3)
                {
                    txtStatus.BackColor = System.Drawing.Color.LightGreen;
                }
                else
                {
                    txtStatus.BackColor = txtNumTrat.BackColor;
                }
                txtStatus.Text = tModel.GetStatus(tratamento.status);
                //
                txtDataIni.Text = tratamento.dataInicial.Value.ToShortDateString();

                if (tratamento.dataFinal != null)
                    txtDataFin.Text = tratamento.dataFinal.Value.ToShortDateString();
                // atribui os valores da barra de progresso
                //pbProgresso.Style.Value = "width: "+tModel.PorcentagemConcluida(idTrat).ToString()+"%";
                bd.Value = tModel.PorcentagemConcluida(idTrat).ToString();
                string txt = (string)GetLocalResourceObject("concluido");
                pbProgresso.InnerText = tModel.PorcentagemConcluida(idTrat).ToString() + txt;
                // lista os procedimentos do tratamento no GridView
                gvProcPendentes.DataSource = tModel.ListarItensPendentes(idTrat);
                gvProcPendentes.DataBind();
                gvProcConcluidos.DataSource = tModel.ListarItensConcluidos(idTrat);
                gvProcConcluidos.DataBind();
                pnlTratamento.Visible = true;             
            }
            catch
            {                
                pnlTratamento.Visible = false;
                string txt = (string)GetLocalResourceObject("tratamentonaoencontrado");
                Master.Status(txt);
            }
        }
    }
}