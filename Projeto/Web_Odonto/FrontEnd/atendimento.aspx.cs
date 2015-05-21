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
    public partial class atendimento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PessoaModel pessoaModel = new PessoaModel();
                // busca os pacientes e preenche o dropdownlist
                ddPacienteAvaliacao.DataSource = pessoaModel.ListarPacientes();
                ddPacienteAvaliacao.DataValueField = "id";
                ddPacienteAvaliacao.DataTextField = "nome";
                ddPacienteAvaliacao.DataBind();
                ddPacienteAvaliacao.SelectedIndex = 0;

                ProcedimentoModel procModel = new ProcedimentoModel();
                //busca os procedimentos e preenche o dropdownlist
                ddProcedimento.DataSource = procModel.Listar();
                ddProcedimento.DataValueField = "id";
                ddProcedimento.DataTextField = "descricao";
                ddProcedimento.DataBind();
                ddProcedimento.SelectedIndex = 0;
            }
        }

        protected void btnBuscaAval_Click(object sender, EventArgs e)
        {            
            try
            {
                AvaliacaoModel avalModel = new AvaliacaoModel();
                avaliacao a = new avaliacao();
                // busca a avaliação referente ao paciente
                a = (avalModel.ListarPorPaciente(Int32.Parse(ddPacienteAvaliacao.SelectedValue))).First();
                // exibe o número da avaliação referente ao paciente            
                if (a != null)
                    txtNumeroAvaliacao.Text = a.id.ToString();
                else
                    txtNumeroAvaliacao.Text = "Nenhum";
            }
            catch {
                txtNumeroAvaliacao.Text = "Nenhum";
            }
        }
    }
}