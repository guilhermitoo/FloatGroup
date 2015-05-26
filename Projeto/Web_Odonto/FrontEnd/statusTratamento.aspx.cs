using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.Model;
using BackEnd.EntityData;

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
            }
        }

        protected void btnBuscaTratamento_Click(object sender, EventArgs e)
        {
            // buscar o tratamento
            // antes de realizar o processo da busca do tratamento, limpa o status da tela
            Master.Status("");
            TratamentoModel tratModel = new TratamentoModel();

            // obtem o id do tratamento em aberto do paciente selecionado
            try
            {
                tratamento tratamento = new tratamento();
                TratamentoModel tModel = new TratamentoModel();
                tratamento = (tratModel.ListarPorPaciente(Int32.Parse(ddPaciente.SelectedValue))).First();
                int idTrat = tratamento.avaliacao_id;
                // exibe o número do tratamento e o status
                txtNumTrat.Text = idTrat.ToString();
                txtStatus.Text = tModel.GetStatus(tratamento.status);
                txtDataIni.Text = tratamento.dataInicial.ToString();
                txtDataFin.Text = tratamento.dataFinal.ToString();
                // atribui os valores da barra de progresso
                pbProgresso.Style.Value = "width: "+tModel.PorcentagemConcluida(idTrat).ToString()+"%";
                pbProgresso.InnerText = tModel.PorcentagemConcluida(idTrat).ToString() + "% Concluído";                
                // lista os procedimentos do tratamento no GridView
                gvProcPendentes.DataSource = tratModel.ListarItensPendentes(idTrat);
                gvProcPendentes.DataBind();
                gvProcConcluidos.DataSource = tratModel.ListarItensConcluidos(idTrat);
                gvProcConcluidos.DataBind();
                pnlTratamento.Visible = true;
            }
            catch
            {
                pnlTratamento.Visible = false;
                Master.Status("Tratamento não encontrado");
            }
        }
    }
}