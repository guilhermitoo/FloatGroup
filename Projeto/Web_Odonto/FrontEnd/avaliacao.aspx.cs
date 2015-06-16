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
            // ao atualizar o grid oculta o pnlIniciar, forçando assim o usuário a salvar novamente
            // o tratamento antes de iniciar o mesmo
            pnlIniciar.Visible = false;

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
                // antes de buscar a avaliação, limpa a sessão                
                pnlIniciar.Visible = false;
                LimpaGrid();

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
            int qtd,status;
            Decimal valor;
            
            // se qtd foi informada
            if (txtQtdProc.Text != "")
                qtd = Int32.Parse(txtQtdProc.Text);
            else
                qtd = 0;
            
            // se valor foi informado
            if (txtValor.Value != "")
                valor = Decimal.Parse(txtValor.Value);
            else
                valor = -1;
            
            // somente cadastra se qtd e valor forem informados
            if ((qtd > 0) && (valor >= 0))
            {
                // o status inicial é 1
                status = 1;
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
                    item.Quantidade = qtd;
                    item.Status = status;
                    item.Valor = valor;
                    // adiciona os dados do item no dictionary
                    aval.Add(idProc, item);
                    // limpa os campos
                    AtualizaGrid();
                }
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
            Dictionary<int, v_itensTratamento> aval =
                            Session["avaliacao"] as Dictionary<int, v_itensTratamento>;
            // somente salva o tratamento se pelo menos 1 procedimento estiver sido atribuido na avaliação
            if ( aval != null)
            {
            // salva o tratamento com status 1 (em orçamento)
                TratamentoModel tratModel = new TratamentoModel();
                tratamento trat = new tratamento();
                
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
            pnlIniciar.Visible = true;
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

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            TratamentoModel tModel = new TratamentoModel();
            AvaliacaoModel avModel = new AvaliacaoModel();            
            tratamento t = new tratamento();

            int idAval;
                        
            if (txtNumeroAvaliacao.Value != "")
            {// se houver avaliação carregada, verifica se ela gerou um tratamento
                idAval = Int32.Parse(txtNumeroAvaliacao.Value);
                t = tModel.Obter(idAval);
                if (t == null)
                {// se a aval~iação não gerou um tratamento, permite o cancelamento
                    if (avModel.MudarStatus(idAval, 3))
                        Response.Redirect("agenda.aspx");
                }
            }
        }
    }
}