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
    public partial class atendimento1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PessoaModel pessoaModel = new PessoaModel();
                // busca os pacientes e preenche o dropdownlist
                ddPacienteAtendimento.DataSource = pessoaModel.ListarPacientes();
                ddPacienteAtendimento.DataValueField = "id";
                ddPacienteAtendimento.DataTextField = "nome";
                ddPacienteAtendimento.DataBind();
                ddPacienteAtendimento.SelectedIndex = 0;
            }
            if (txtNumeroAtendimento.Value != "")
            { 
                int idAtend = Int32.Parse(txtNumeroAtendimento.Value);
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento atend = new BackEnd.EntityData.atendimento();
                atend = atModel.Obter(idAtend);
                // se o numero do atendimento tiver sido informado, busca a lista de itens do atendimento
                gvItensAtendimento.DataSource = atModel.ListarItens(idAtend);
                gvItensAtendimento.DataBind();
            }
        }

        protected void btnBuscaAtend_Click(object sender, EventArgs e)
        {
            try
            {
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento atend = new BackEnd.EntityData.atendimento();
                int idPaciente = Int32.Parse(ddPacienteAtendimento.SelectedValue);
                // busca a avaliação referente ao paciente
                //atend = (atModel.
                // exibe o número da avaliação referente ao paciente            
                //if (a != null)
                //{
                //    txtNumeroAvaliacao.Value = a.id.ToString();
                //    pnlProc.Visible = true;
                //    pnlBotoes.Visible = true;
                //    txtDataAval.Value = a.data.ToString();
                //    TratamentoModel tratModel = new TratamentoModel();
                //    if (tratModel.Obter(a.id) != null)
                //    {
                //        CarregarTratamento(a.id);
                //    }
                //}
                //else
                //{
                //    txtNumeroAvaliacao.Value = "Nenhum";
                //    txtDataAval.Value = "";
                //    pnlProc.Visible = false;
                //    pnlBotoes.Visible = false;
                //    LimpaGrid();
                //}
            }
            catch
            {
                //txtNumeroAvaliacao.Value = "Nenhum";
                //txtDataAval.Value = "";
                //pnlProc.Visible = false;
                //pnlBotoes.Visible = false;
                //LimpaGrid();
            }
        }
    }
}