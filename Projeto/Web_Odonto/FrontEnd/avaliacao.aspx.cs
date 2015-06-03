using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Resources;
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
                // se tiver um id vinculado com a requisição da página
                if (Request.QueryString["ID"] != null)
                { // pega o id e busca a avaliação
                    int id = int.Parse(Request.QueryString["ID"]);
                    BuscaAvaliacao(id);                 
                }
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
                { // somente busca a avaliação se tiver encontrado uma avaliação
                    BuscaAvaliacao(a.id);
                }
            }
            catch { BuscaAvaliacao(0); }
        }

        public void AtualizaGrid()
        {
            // limpa campos da seleção do procedimento
            ddProcedimento.SelectedIndex = 0;
            txtQtdProc.Text = "";
            txtValor.Value = "";

            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;

            gvItensTratamento.DataSource = aval.Values;
            gvItensTratamento.DataBind();
            CalculaTotal();
        }

        private void BuscaAvaliacao(int id)
        { 
            try
            {
                AvaliacaoModel avModel = new AvaliacaoModel();
                avaliacao a = avModel.Obter(id) as avaliacao;
                if (a != null)
                {
                    txtNumeroAvaliacao.Value = a.id.ToString();
                    pnlProc.Visible = true;
                    pnlBotoes.Visible = true;
                    txtDataAval.Value = a.data.ToString();
                    ddPacienteAvaliacao.SelectedValue = a.paciente_id.ToString();
                    TratamentoModel tratModel = new TratamentoModel();
                    if (tratModel.Obter(a.id) != null)
                    {
                        CarregarTratamento(a.id);
                    }
                }
                else
                {
                    txtNumeroAvaliacao.Value = "Nenhum";
                    txtDataAval.Value = "";
                    pnlProc.Visible = false;
                    pnlBotoes.Visible = false;
                    LimpaGrid();
                }
            }
            catch
            {
                txtNumeroAvaliacao.Value = "Nenhum";
                txtDataAval.Value = "";
                pnlProc.Visible = false;
                pnlBotoes.Visible = false;
                LimpaGrid();
            }
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

        protected void gvItensTratamento_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // recupera a linha clicada no gridview
            int linha = Convert.ToInt32(e.CommandArgument);
            // recupera o id do procedimento na linha clicada
            int id = (int)gvItensTratamento.DataKeys[linha].Value;

            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;

            if (e.CommandName == "Apagar")
            {
                aval.Remove(id);
            }
            AtualizaGrid();
        }

        private void LimpaGrid()
        { // limpa os dados do grid e remove a sessão
            Session.Remove("avaliacao");
            gvItensTratamento.DataSource = null;
            gvItensTratamento.DataBind();
            pnlTotal.Visible = false;
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // salva o tratamento com status 1 (em orçamento)
            TratamentoModel tratModel = new TratamentoModel();
            tratamento trat = new tratamento();
            Dictionary<int, v_itensTratamento> aval =
                        Session["avaliacao"] as Dictionary<int, v_itensTratamento>;
            itemTratamento item = new itemTratamento();

            trat.avaliacao_id = Int32.Parse(txtNumeroAvaliacao.Value);            
            trat.status = 1;
            trat.total = Decimal.Parse(txtTotal.Text);

            // verifica se o tratamento já está salvo no banco para poder comparar seus itens.
            bool bNovo = false;
            bNovo = (tratModel.Obter(trat.avaliacao_id) == null);            

            if (tratModel.InserirAtualizar(trat))
            {
                // se não for registro novo deve buscar os itens que já estão no tratamento e validar
                if (!bNovo)
                {
                    // se não for registro novo, limpa os itens do banco para inserir novamente
                    tratModel.RemoverTodosItens(trat.avaliacao_id);
                }
                
                foreach (v_itensTratamento v_item in aval.Values)
                {
                    // preenche os dados do item
                    item.procedimento_id = v_item.Código_Procedimento;
                    item.tratamento_id = trat.avaliacao_id;
                    item.qtd = v_item.Quantidade;
                    item.status = 1;
                    item.valor = v_item.Valor;
                    // insere o item do tratamento
                    tratModel.InserirItem(item);
                }
                pnlIniciar.Visible = true;
            }
            else
            {
                pnlIniciar.Visible = false;
            }
        }

        private void CalculaTotal()
        {
            // recupera o dicionário que está armazenado na sessão
            Dictionary<int, v_itensTratamento> aval =
                Session["avaliacao"] as Dictionary<int, v_itensTratamento>;
            // percorre o dicionário somando os valores
            Decimal total = 0;
            foreach (v_itensTratamento item in aval.Values)
            {                
                total += item.Quantidade * Decimal.Parse(item.Valor.ToString());
            }
            // exibe o total
            pnlTotal.Visible = true;
            txtTotal.Text = total.ToString();
        }

        private void CarregarTratamento(int idTrat)
        { // carrega o tratamento vinculado a avaliação
            TratamentoModel tratModel = new TratamentoModel();
            // declara o dicionário do tipo específico
            Dictionary<int, v_itensTratamento> aval = Session["avaliacao"] as Dictionary<int, v_itensTratamento>;
            // instancia o Dictionary
            if (aval == null)
            {
                // instancia o Dictionary
                aval = new Dictionary<int, v_itensTratamento>();
                // adiciona uma variável na sessão
                // e atribui o dictionary a variável
                Session["avaliacao"] = aval;
            }
            
            foreach (v_itensTratamento item in tratModel.ListarItens(idTrat))
            {                
                aval.Add(item.Código_Procedimento, item);
                // limpa os campos
                AtualizaGrid();               
            }
        }

        protected void btnIniciarTratamento_Click(object sender, EventArgs e)
        {// inicia o tratamento            
            int idTrat;
            // verifica se o valor dentro do txtNumeroAvaliacao é um número
            if (Int32.TryParse(txtNumeroAvaliacao.Value.ToString(),out idTrat))
            {
                TratamentoModel tratModel = new TratamentoModel();
                // instancia a sessão e verifica se está vazia
                Dictionary<int, v_itensTratamento> aval = Session["avaliacao"] as Dictionary<int, v_itensTratamento>;
                if (aval != null)
                { // só então é que inicia o tratamento, modificando o status para 2
                    if (tratModel.Iniciar(idTrat))
                    {
                        Response.Redirect("index.aspx");
                    }
                }
            }
        }
    }
}