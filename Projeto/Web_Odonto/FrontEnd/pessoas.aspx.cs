using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;

using BackEnd.EntityData;
using BackEnd.Model;

namespace FrontEnd
{
    public partial class pessoas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // carrega todas as cidades e lista no DropDown Cidades            
                CidadeModel cidModel = new CidadeModel();
                // atribui uma lista de cidades para o DropDown
                ddCidade.DataSource = cidModel.Listar();
                ddCidade.DataValueField = "id";
                ddCidade.DataTextField = "nome";
                ddCidade.DataBind();

                // carrega todos os convenios e lista no DropDown Convenios
                ConvenioModel conModel = new ConvenioModel();
                ddConvenio.DataSource = conModel.Listar();
                ddConvenio.DataValueField = "id";
                ddConvenio.DataTextField = "razao_social";
                ddConvenio.DataBind();
            }

            if (Request.QueryString["ID"] != null && !IsPostBack)
            {
                //recupera o id
                int id = int.Parse(Request.QueryString["ID"]);
                // declara os objetos models
                PessoaModel Model = new PessoaModel();
                DentistaModel dModel = new DentistaModel();
                PacienteModel pModel = new PacienteModel();
                FuncionarioModel fModel = new FuncionarioModel();
                //recupera a pessoa do id informado
                pessoa pessoa = Model.Obter(id);       
        
                // verifica se é dentista, funcionário ou paciente 
                // se for algum deles atribui o valor
                if ( dModel.Verifica(pessoa.id) ) {
                    dentista dentista = dModel.Obter(id);
                    cbTipoPessoa.Items.FindByValue("D").Selected = true;
                    txtCro.Text = dentista.cro;
                    txtSalario.Value = dentista.salario.ToString();
                }
                if ( fModel.Verifica(pessoa.id) ) {
                    funcionario funcionario = fModel.Obter(id);
                    cbTipoPessoa.Items.FindByValue("F").Selected = true;
                    txtCargo.Text = funcionario.cargo;
                    txtSalario.Value = funcionario.salario.ToString();
                }
                if ( pModel.Verifica(pessoa.id) ) {
                    paciente paciente = pModel.Obter(id);
                    cbTipoPessoa.Items.FindByValue("P").Selected = true;
                    ddConvenio.Items.FindByValue(paciente.convenio_id.ToString());
                }
                // DADOS DE PESSOA
                rdStatus.Items.FindByValue(pessoa.status.ToString());
                txtNome.Text = pessoa.nome;
                rdSexo.Items.FindByValue(pessoa.sexo.ToString());
                txtNasc.Value = pessoa.nascimento.ToString();
                txtRg.Value = pessoa.rg;
                txtCpf.Value = pessoa.cpf;
                ddCidade.Items.FindByValue(pessoa.cidade_id.ToString());
                txtEndereco.Text = pessoa.endereco;                
                txtTelefone1.Value = pessoa.telefone1;
                txtTelefone2.Value = pessoa.telefone2;
                txtObs.Text = pessoa.obs;
                ddTipoUsuario.Items.FindByValue(pessoa.tipoUsuario.ToString());
                txtUsuario.Text = pessoa.usuario;
                txtSenha.Text = pessoa.senha;
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            Response.Redirect("pessoas.aspx");
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            // salva o cadastro da pessoa
            // deve verificar quais opções no tipo de pessoa estão marcadas (PACIENTE, FUNCIONARIO, DENTISTA)
            // e deve inserir/atualizar os cadastros que estiverem marcados
            
            pessoa pessoa = new pessoa();
            PessoaModel pessoaModel = new PessoaModel();

            bool bNovo = true;
            // se existir pessoa cadastrada com esse ID, atualiza os cadastros
            if (Request.QueryString["ID"] != null)
            {
                pessoa.id = int.Parse(Request.QueryString["ID"]);
                bNovo = false;
            }

            if (pessoaModel.ValidaCPF(txtCpf.Value) || (! bNovo) )
            {
                // DADOS DE PESSOA
                pessoa.nome = txtNome.Text;
                pessoa.status = Int32.Parse(rdStatus.SelectedValue);
                pessoa.sexo = Char.Parse(rdSexo.SelectedValue);
                pessoa.nascimento = DateTime.Parse(txtNasc.Value);
                pessoa.rg = txtRg.Value;
                pessoa.cpf = txtCpf.Value;
                pessoa.cidade_id = Int32.Parse(ddCidade.SelectedValue);
                pessoa.endereco = txtEndereco.Text;
                pessoa.telefone1 = txtTelefone1.Value;
                pessoa.telefone2 = txtTelefone2.Value;
                pessoa.obs = txtObs.Text;
                pessoa.tipoUsuario = Int32.Parse(ddTipoUsuario.SelectedValue);
                pessoa.usuario = txtUsuario.Text;
                pessoa.senha = txtSenha.Text;
                
                // insere ou atualiza o cadastro da pessoa
                if (pessoaModel.InserirAtualizar(pessoa))
                {
                    if (bNovo) // se é cadastro novo retorna o id para a pessoa              
                        pessoa.id = pessoaModel.ObterCPF(pessoa.cpf);

                    // verificar os tipos
                    if (cbTipoPessoa.Items.FindByValue("P").Selected)
                    {
                        paciente paciente = new paciente();
                        paciente.convenio_id = Int32.Parse(ddConvenio.SelectedValue);
                        paciente.pessoa = pessoa;
                        PacienteModel pModel = new PacienteModel();
                        // tenta inserir ou atualizar o cadastro
                        pModel.InserirAtualizar(paciente);
                    }
                    if (cbTipoPessoa.Items.FindByValue("D").Selected)
                    {
                        dentista dentista = new dentista();
                        dentista.cro = txtCro.Text;
                        dentista.salario = Decimal.Parse(txtSalario.Value);
                        dentista.pessoa = pessoa;
                        DentistaModel dModel = new DentistaModel();
                        // tenta inserir ou atualizar o cadastro
                        dModel.InserirAtualizar(dentista);
                    }
                    if (cbTipoPessoa.Items.FindByValue("F").Selected)
                    {
                        funcionario funcionario = new funcionario();
                        funcionario.cargo = txtCargo.Text;
                        funcionario.salario = Decimal.Parse(txtSalario.Value);
                        funcionario.pessoa = pessoa;
                        FuncionarioModel fModel = new FuncionarioModel();
                        // tenta inserir ou atualizar o cadastro
                        fModel.InserirAtualizar(funcionario);
                    }
                }
                else
                {
                }
                Response.Redirect("pessoas.aspx");
            }
        }

        [WebMethod]
        public static bool VerificaCPF(string cpf)
        {
            PessoaModel p = new PessoaModel();

            return p.ValidaCPF(cpf);
        }

        protected void btnListar_Click(object sender, EventArgs e)
        {
            char tipo = 'T';
            if (cbTipoPessoa.Items.FindByValue("P").Selected)
            {
                tipo = 'P';
                //Response.Redirect("listaPacientes.aspx");
            }
            else if (cbTipoPessoa.Items.FindByValue("F").Selected)
            {
                tipo = 'F';
                //Response.Redirect("listaFuncionarios.aspx");
            }
            else if (cbTipoPessoa.Items.FindByValue("D").Selected)
            {
                tipo = 'D';
                //Response.Redirect("listaDentistas.aspx");
            }            
                Response.Redirect("listaPessoas.aspx?TP="+tipo);            
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            PessoaModel p = new PessoaModel();

            // incompleto
            if (p.ValidaCPF(txtCpf.Value))
            {                
                lblAlertaCPF.Text = "CPF não cadastrado";
            }
            else
            {
                Response.Redirect("pessoas.aspx?ID=" + (p.ObterCPF(txtCpf.Value)).ToString());
            }
        }

    }
}