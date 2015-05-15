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
    public partial class agendamento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PessoaModel p = new PessoaModel();

                ddDentistaAv.DataSource = p.ListarDentistas();
                ddDentistaAv.DataValueField = "id";
                ddDentistaAv.DataTextField = "nome";
                ddDentistaAv.DataBind();
                ddDentistaAv.SelectedIndex = 0;

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

            avaliacao.data = DateTime.Parse(txtDataAval.Value);
            avaliacao.dentista_id = Int32.Parse(ddDentistaAv.SelectedValue);
            avaliacao.paciente_id = Int32.Parse(ddPacienteAv.SelectedValue);


            //se existir ID então faz a edição, se não existir ID, é uma inserção
            if (Request.QueryString["ID"] != null)
                avaliacao.id = int.Parse(Request.QueryString["ID"]);

            // faz a inserção ou atualização do cadastro da cidade
            if (model.InserirAtualizar(avaliacao))
                Response.Redirect("agenda.aspx");
        }

        protected void BuscaTratamento(object sender, EventArgs e)
        {
            TratamentoModel tratModel = new TratamentoModel();

            ItemTratamentoModel itModel = new ItemTratamentoModel();

            // obtem o id do tratamento em aberto do paciente selecionado
            try
            {
                tratamento tratamento = new tratamento();
                tratamento = (tratModel.ListarPorPaciente(Int32.Parse(ddPaciente.SelectedValue))).First();
                int idTrat = tratamento.avaliacao_id;
                int statusTrat = tratamento.status;

                txtNumeroTratamento.Text = idTrat.ToString();
                txtStatusTratamento.Text = statusTrat.ToString();
                gvItensAtendimento.DataSource = itModel.ListarPorTratamento(idTrat);
                gvItensAtendimento.DataBind();
            }
            catch { }
        }

        protected void btnVoltar_Click(object sender, EventArgs e)
        {
            Response.Redirect("agenda.aspx");
        }

        protected void btnFinalizaAgendamento_Click(object sender, EventArgs e)
        {

        }
    }
}