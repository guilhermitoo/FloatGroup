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
    public partial class agendamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.Status("");
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
            Master.Status("");
            avaliacao avaliacao = new avaliacao();
            AvaliacaoModel model = new AvaliacaoModel();

            DateTime data;
            int idDent = Int32.Parse(ddDentista.SelectedValue); ;

            if (txtDataConsulta.Value != "")
            {
                data = DateTime.Parse(txtDataConsulta.Value);

                DentistaModel dentModel = new DentistaModel();
                if (dentModel.VerificaHorario(data, idDent))
                {
                    avaliacao.data = data;
                    avaliacao.dentista_id = idDent;
                    avaliacao.paciente_id = Int32.Parse(ddPacienteAv.SelectedValue);
                    avaliacao.status = 1;

                    // faz a inserção da avaliação somente se o paciente selecionado
                    // não tiver um tratamento em andamento ou em orçamento
                    PacienteModel pacModel = new PacienteModel();
                    paciente p = new paciente();
                    p = pacModel.Obter(avaliacao.paciente_id);
                    if (!pacModel.TemTratamentoPendente(p))
                    {
                        // verifica se não tem alguma avaliacão agendada depois da data atual
                        List<avaliacao> listaAval = new List<avaliacao>();
                        listaAval = model.ListarPorPaciente(avaliacao.paciente_id);
                        if (listaAval.Count() < 1)
                        {
                            if (model.Inserir(avaliacao))
                            {
                                string txt = (string)GetLocalResourceObject("avaliacaoagendadacomsucesso");
                                Master.Status(txt);
                                Response.Redirect("agenda.aspx");
                            }
                            else
                            {
                                string txt = (string)GetLocalResourceObject("erroaoagendaraavaliacao");
                                Master.Status(txt);
                            }
                        }
                        else
                        {
                            string txt = (string)GetLocalResourceObject("opacientejatemumaavaliacaoagendada");
                            Master.Status(txt + listaAval.First().data.ToString());
                        }
                    }
                    else
                    {
                        string txt = (string)GetLocalResourceObject("opacientejatemumtratamento");
                        Master.Status(txt);
                    }
                }
                else
                {
                    string txt = (string)GetLocalResourceObject("dentistanaodisponivel");
                    Master.Status(txt);
                }
            }
            else
            {
                string txt = (string)GetLocalResourceObject("selecioneadata");
                Master.Status(txt);
            }
        }

        protected void BuscaTratamento(object sender, EventArgs e)
        {
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
                txtNumeroTratamento.Text = idTrat.ToString();
                txtStatusTratamento.Text = tModel.GetStatus(tratamento.status);
                // lista os procedimentos do tratamento no GridView
                gvItensAtendimento.DataSource = tratModel.ListarItensPendentes(idTrat);
                gvItensAtendimento.DataBind();
                ControlaCampos(true);
            }
            catch
            {
                ControlaCampos(false);
                string txt = (string)GetLocalResourceObject("tratamentonaoencontrado");
                Master.Status(txt);
            }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agenda.aspx");
        }

        protected void btnFinalizaAgendamento_Click(object sender, EventArgs e)
        {
            DateTime data;
            int idTrat;
            int idDent = Int32.Parse(ddDentista.SelectedValue);
            // faz o agendamento do atendimento
            // Verifica se a data foi definida
            if (txtDataConsulta.Value != "")
            {
                data = DateTime.Parse(txtDataConsulta.Value);
                // verifica se o horário do dentista está disponível
                DentistaModel dentModel = new DentistaModel();
                if (dentModel.VerificaHorario(data, idDent))
                {
                    // depois se o horário do dentista estiver livre, cadastra o atendimento            
                    // verifica se o valor dentro do txtNumeroTratamento é um número
                    if (Int32.TryParse(txtNumeroTratamento.Text, out idTrat))
                    {
                        BackEnd.EntityData.atendimento at = new BackEnd.EntityData.atendimento();
                        AtendimentoModel atModel = new AtendimentoModel();

                        at.dentista_id = idDent;
                        at.tratamento_id = idTrat;
                        at.status = 1;
                        at.data = data;

                        // depois de atribuir os dados do atendimento, tenta salvar
                        if (atModel.Inserir(at))
                        {
                            //se inserir normalmente o atendimento, irá inserir os itens atendimento                                
                            // declara o item do atendimento
                            itemAtendimento item = new itemAtendimento();
                            for (int i = 0; i < gvItensAtendimento.Rows.Count; i++)
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

                            string txt = (string)GetLocalResourceObject("atendimentoagendadocomsucesso");
                            Master.Status(txt);
                            Response.Redirect("agenda.aspx");
                        }
                        else
                        {
                            string txt = (string)GetLocalResourceObject("erroaoagendaroatendimento");
                            Master.Status(txt);
                        }
                    }
                    else
                    {
                        string txt = (string)GetLocalResourceObject("pacientebusquetratamento");
                        Master.Status(txt);
                    }
                }
                else
                {
                    string txt = (string)GetLocalResourceObject("dentistanaodisponivel");
                    Master.Status(txt);
                }
            }
            else
            {
                string txt = (string)GetLocalResourceObject("selecioneadata");
                Master.Status(txt);
            }
        }

        private void ControlaCampos(Boolean b)
        {
            lblNumeroTrat.Visible = b;
            lblStatusTrat.Visible = b;
            txtNumeroTratamento.Visible = b;
            txtStatusTratamento.Visible = b;
            // quando b = false, ou seja, limpando os campos, esvazia o grid
            if (!b)
            {
                LimpaGrid();
            }
        }

        private void LimpaGrid()
        {
            gvItensAtendimento.DataSource = null;
            gvItensAtendimento.DataBind();
        }

    }
}