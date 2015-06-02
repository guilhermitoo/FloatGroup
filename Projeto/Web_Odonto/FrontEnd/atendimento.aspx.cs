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

                ddDentistaAtendimento.DataSource = pessoaModel.ListarDentistas();
                ddDentistaAtendimento.DataValueField = "id";
                ddDentistaAtendimento.DataTextField = "nome";
                ddDentistaAtendimento.DataBind();
                ddDentistaAtendimento.SelectedIndex = 0;
            }
            CarregaDetalhes();
            
        }

        protected void btnBuscaAtend_Click(object sender, EventArgs e)
        {
            // busca todos atendimentos do paciente e lista, permitindo selecionar um para visualizar seus detalhes
            try
            {
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento atend = new BackEnd.EntityData.atendimento();
                int idPaciente = Int32.Parse(ddPacienteAtendimento.SelectedValue);

                gvListaAtendimentos.DataSource = atModel.ListarPorPaciente(idPaciente);                
                gvListaAtendimentos.DataBind();
                gvListaAtendimentos.Visible = true;
            }
            catch
            {
                gvListaAtendimentos.Visible = false;
            }
        }

        protected void gvListaAtendimentos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            int id = (int)gvListaAtendimentos.DataKeys[linha].Value;

            if (e.CommandName == "Abrir")
            {
                txtNumeroAtendimento.Value = id.ToString();
                gvListaAtendimentos.Visible = false;
                CarregaDetalhes();                
            }
        }

        private void CarregaDetalhes()
        {
            if (txtNumeroAtendimento.Value != "")
            {
                int idAtend = Int32.Parse(txtNumeroAtendimento.Value);
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento atend = new BackEnd.EntityData.atendimento();
                atend = atModel.Obter(idAtend);
                txtDataAtendimento.Value = atend.data.ToString();
                ddDentistaAtendimento.SelectedValue = atend.dentista_id.ToString();
                // se o numero do atendimento tiver sido informado, busca a lista de itens do atendimento
                gvItensAtendimento.DataSource = atModel.ListarItens(idAtend);
                gvItensAtendimento.DataBind();
                pnlDetalhes.Visible = true;
            }
            else
            {
                pnlDetalhes.Visible = false;
            }
        }
    }
}