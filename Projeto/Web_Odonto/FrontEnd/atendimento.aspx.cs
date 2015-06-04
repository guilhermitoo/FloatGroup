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

                // se tiver um id vinculado com a requisição da página
                if (Request.QueryString["ID"] != null)
                { // pega o id e busca o atendimento
                    int id = int.Parse(Request.QueryString["ID"]);
                    txtNumeroAtendimento.Value = id.ToString();
                }
            }
            CarregaDetalhes();            
        }

        protected void btnBuscaAtend_Click(object sender, EventArgs e)
        {
            // busca todos atendimentos do paciente e lista, permitindo selecionar um para visualizar seus detalhes
            pnlDetalhes.Visible = false;
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

        // função verifica se o txtNumeroAtendimento tem um ID informado
        private void CarregaDetalhes()
        {
            pnlDetalhes.Visible = false;
            if (txtNumeroAtendimento.Value != "")
            {
                int idAtend = Int32.Parse(txtNumeroAtendimento.Value);
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento atend = new BackEnd.EntityData.atendimento();
                atend = atModel.Obter(idAtend);
                txtDataAtendimento.Value = atend.data.ToString();
                ddDentistaAtendimento.SelectedValue = atend.dentista_id.ToString();
                txtStatus.Text = atModel.GetStatus(atend.status);

                // GAMBIARRA ON: 
                // acessa a avaliação vinculada ao tratamento vinculado ao atendimento que está sendo aberto
                // somente para pegar o id do paciente
                AvaliacaoModel avModel = new AvaliacaoModel();
                avaliacao av = new avaliacao();
                av = avModel.Obter(atend.tratamento_id);
                ddPacienteAtendimento.SelectedValue = av.paciente_id.ToString();
                // GAMBIARRA OFF;

                // se o numero do atendimento tiver sido informado, busca a lista de itens do atendimento
                gvItensAtendimento.DataSource = atModel.ListarItens(idAtend);
                gvItensAtendimento.DataBind();
                pnlDetalhes.Visible = true;
            }           
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            MudarStatusAtendimento(2);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            MudarStatusAtendimento(3);
        }

        private void MudarStatusAtendimento(int iStatus)
        {
            // verifica o status do atendimento e modifica para iStatus
            if (txtNumeroAtendimento.Value != "")
            {
                int id = Int32.Parse(txtNumeroAtendimento.Value);
                AtendimentoModel atModel = new AtendimentoModel();
                BackEnd.EntityData.atendimento at = new BackEnd.EntityData.atendimento();
                at = atModel.Obter(id);

                if (at.status == 1)
                {
                    // se estiver tentando confirmar o atendimento irá percorrer o grid e listar os itens
                    if (iStatus == 2)
                    {
                        // irá listar todos os itens do grid que foram marcados e enviar para o model
                        // para executar a função(ou procedure) que irá verificar a quantidade e
                        // se todos os itens estiverem sido realizados, modifica o status para 2(concluído)
                        // na tabela ItensTratamento
                        List<itemAtendimento> itens = new List<itemAtendimento>();

                        itemAtendimento item = new itemAtendimento();

                        for (int i = 0; i < gvItensAtendimento.Rows.Count; i++)
                        {
                            item.atendimento_id = id;
                            item.procedimento_id = Int32.Parse(gvItensAtendimento.DataKeys[i].Value.ToString());
                            item.qtd = 1;
                            CheckBox cb = (CheckBox)gvItensAtendimento.Rows[i].Cells[0].FindControl("cbProcRealizado");
                            if (cb.Checked)
                            {
                                itens.Add(item);
                            }
                            else
                            {
                                atModel.RemoveItem(item);
                            }                            
                        }
                        //AGORA chama A FUNÇÃO PARA CONFIRMAR O ATENDIMENTO, PASSANDO COMO PARAMETRO O ID DO ATENDIMENTO
                        //    E A LISTA DOS ITENS QUE FORAM REALIZADOS
                        if (atModel.ConfirmaAtendimento(at, itens))
                        {
                            Response.Redirect("agenda.aspx");
                        }
                    }
                    else
                    {
                        // se o status estiver marcado como 1 (pendente)
                        // permite mudar o status do atendimento
                        if (atModel.MudarStatus(id, iStatus))
                        {
                            Response.Redirect("agenda.aspx");
                        }

                    }
                }
            }
        }
    }
}