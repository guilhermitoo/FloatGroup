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
    public partial class agendamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PessoaModel p = new PessoaModel();

                ddDentista.DataSource = p.ListarDentistas();
                ddDentista.DataValueField = "id";
                ddDentista.DataTextField = "nome";
                ddDentista.DataBind();
                ddDentista.SelectedIndex = 0;

                // atribui uma lista de dentistas para o DropDown
                ddPaciente.DataSource = p.ListarPacientes();
                ddPaciente.DataValueField = "id";
                ddPaciente.DataTextField = "nome";
                ddPaciente.DataBind();
                ddPaciente.SelectedIndex = 0;

                ddPacienteAv.DataSource = p.ListarPacientes();
                ddPacienteAv.DataValueField = "id";
                ddPacienteAv.DataTextField = "nome";
                ddPacienteAv.DataBind();
                ddPacienteAv.SelectedIndex = 0;
            }
        }

        // função que cadastra avaliação
        protected void CadAvaliacao(object sender, EventArgs e)
        {
            avaliacao avaliacao = new avaliacao();
            AvaliacaoModel model = new AvaliacaoModel();

            avaliacao.data = DateTime.Parse(txtDataConsulta.Value);
            avaliacao.dentista_id = Int32.Parse(ddDentista.SelectedValue);
            avaliacao.paciente_id = Int32.Parse(ddPacienteAv.SelectedValue);

            // faz a inserção da avaliação somente se o paciente selecionado
            // não tiver um tratamento em andamento
            TratamentoModel tratModel = new TratamentoModel();
            if ((tratModel.ListarPorPaciente(avaliacao.paciente_id)).Count() < 1)            
            {
                // verifica se não tem alguma avaliacão agendada depois da data atual
                if ((model.ListarPorPaciente(avaliacao.paciente_id)).Count() < 1) 
                {
                    if (model.Inserir(avaliacao))
                        Response.Redirect("agenda.aspx");
                }
            }
        }

        protected void BuscaTratamento(object sender, EventArgs e)
        {
            TratamentoModel tratModel = new TratamentoModel();            

            // obtem o id do tratamento em aberto do paciente selecionado
            try
            {
                tratamento tratamento = new tratamento();
                TratamentoModel tModel = new TratamentoModel();
                tratamento = (tratModel.ListarPorPaciente(Int32.Parse(ddPaciente.SelectedValue))).First();
                int idTrat = tratamento.avaliacao_id;                
                // exibe o número do tratamento e o status
                txtNumeroTratamento.Text = idTrat.ToString();
                txtStatusTratamento.Text = tModel.GetStatus(tratamento.status);
                // lista os procedimentos do tratamento no GridView
                gvItensAtendimento.DataSource = tratModel.ListarItens(idTrat);
                gvItensAtendimento.DataBind();
                ControlaCampos(true);
            }
            catch {
                ControlaCampos(false);
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agenda.aspx");
        }

        protected void btnFinalizaAgendamento_Click(object sender, EventArgs e)
        {
            // faz o agendamento do atendimento
            // antes verifica se o horário do dentista está disponível
            // depois se o horário do dentista estiver livre, cadastra o atendimento
            BackEnd.EntityData.atendimento at = new BackEnd.EntityData.atendimento();
            AtendimentoModel atModel = new AtendimentoModel();

            at.dentista_id = Int32.Parse(ddDentista.SelectedValue);
            at.tratamento_id = Int32.Parse(txtNumeroTratamento.Text);
            at.status = 1;
            at.data = DateTime.Parse(txtDataConsulta.Value);

            // depois de atribuir os dados do atendimento, tenta salvar
            if (atModel.Inserir(at))
            {                
                //se inserir normalmente o atendimento, irá inserir os itens atendimento                                
                // declara o item do atendimento
                itemAtendimento item = new itemAtendimento();
                for (int i = 0;i < gvItensAtendimento.Rows.Count; i++)
                {                    
                    // percorre o grid
                    CheckBox cb = (CheckBox)gvItensAtendimento.Rows[i].Cells[0].FindControl("cbProc");
                    if (cb.Checked)
                    {            
                        // preenche o objeto item
                        item.atendimento_id = at.id;
                        item.procedimento_id = Int32.Parse(gvItensAtendimento.DataKeys[i].Value.ToString());
                        item.qtd = 1;            
                        // adiciona o item do atendimento
                        atModel.InserirItem(item);
                    }                    
                }
                Response.Redirect("agenda.aspx");
            }

            
        }

        private void ControlaCampos(Boolean b)
        {
            lblNumeroTrat.Visible = b;
            lblStatusTrat.Visible = b;
            txtNumeroTratamento.Visible = b;
            txtStatusTratamento.Visible = b;            
        }
        
    }
}