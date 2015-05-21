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
                {
                    txtNumeroAvaliacao.Value = a.id.ToString();
                    pnlProc.Visible = true;
                }
                else
                {
                    txtNumeroAvaliacao.Value = "Nenhum";
                    pnlProc.Visible = false;
                    LimpaGrid();
                }
            }
            catch {
                txtNumeroAvaliacao.Value = "Nenhum";
                pnlProc.Visible = false;
                LimpaGrid();
            }
        }

        public void AtualizaGrid()
        {
            // limpa campos da seleção do procedimento
            ddProcedimento.SelectedIndex = 0;
            txtQtdProc.Text = "";
            txtValor.Value = "";

            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;

            gvItensAtendimento.DataSource = aval.Values;
            gvItensAtendimento.DataBind();
        }

        protected void btnAddProcedimento_Click(object sender, EventArgs e)
        {
            //Response.Redirect("atendimento.aspx?ID="+ddProcedimento.SelectedValue);
            //recupera o id do procedimento que será adicionado no grid
            int idProc = Int32.Parse(ddProcedimento.SelectedValue);
            //recupera o dictionary da session
            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;

            if (aval == null)
            {
                // instancia o Dictionary
                aval = new Dictionary<int, v_itensTratamento>();
                // adiciona uma variável na sessão
                // e atribui o dictionary a variável
                Session["avaliacao"] = aval;
            }

            // verifica se a chave (o id do procedimento) ja esta no dictionary
            if (!aval.ContainsKey(idProc))
            {
                ProcedimentoModel pModel = new ProcedimentoModel();
                v_itensTratamento item = new v_itensTratamento();
                // preenche o item
                item.Código_Procedimento = idProc;
                item.Descrição = (pModel.Obter(idProc)).descricao;
                item.Quantidade = Int32.Parse(txtQtdProc.Text);
                item.Status = 1;
                item.Valor = Decimal.Parse(txtValor.Value);
                // adiciona os dados do item no dictionary
                aval.Add(idProc, item);
                // limpa os campos
                AtualizaGrid();
            }
        }

        protected void gvItensAtendimento_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            int id = (int)gvItensAtendimento.DataKeys[linha].Value;

            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;

            if (e.CommandName == "Apagar")
            {
                aval.Remove(id);
            }
            AtualizaGrid();
        }

        private void LimpaGrid()
        {
            Session.Remove("avaliacao");
            gvItensAtendimento.DataSource = null;
            gvItensAtendimento.DataBind();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // salva o tratamento com status 1 (em orçamento)
        }
    }
}