<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="FrontEnd.pessoas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

<h2>
CADASTRO BÁSICO
</h2>    
<h5>
Faça cadastro de Funcionário, Paciente, e Dentista
</h5>
<hr />
<!--Topo -->
<div class="col-md-12">
    <div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
        <div class="col-md-6">    
            <!--<asp:ScriptManager ID="sm1" runat="server" EnablePageMethods="true"></asp:ScriptManager>-->
                <label>CPF</label>
            <label id="lblNotificaCPF" runat="server"></label>    
            <div class="input-group">
                    <asp:TextBox ID="txtCpf" CssClass="form-control" runat="server"/>
                    <span class="input-group-btn" >
                        <button runat="server" js="vCpf" type="button" id="btnVerifica" class="btn btn-default" 
                            data-toggle="modal" data-target="#myModal">Verifica</button>
                    </span>                                        
                </div>
                <br />              
                <label>
                Escolha o tipo de cadastro
                </label>                    
                <asp:CheckBoxList js="TipoPessoa" ID="cbTipoPessoa" runat="server">                                            
                    <asp:ListItem Value="P" Text="Paciente" />
                    <asp:ListItem Value="F" Text="Funcionário" />
                    <asp:ListItem Value="D" Text="Dentista" />
                </asp:CheckBoxList>     
                <br />                                                      
                <label>Status:</label>                   
                <asp:RadioButtonList ID="rdStatus" runat="server">
                    <asp:ListItem Value="1" Selected="True">Ativo</asp:ListItem>
                    <asp:ListItem Value="2" >Inativo</asp:ListItem>
                </asp:RadioButtonList>                
                <br />                
                <label>Nome:</label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtNome"/>
                <br />
                <label>Sexo:</label>                
                <asp:RadioButtonList ID="rdSexo" runat="server">
                    <asp:ListItem Value="M" Selected="True" >Masculino</asp:ListItem>
                    <asp:ListItem Value="F"                 >Feminino</asp:ListItem>
                </asp:RadioButtonList>                                
                <br />                
                <label>Data de Nascimento:</label>
                <input class="form-control" id="datepicker" runat="server"/>
                <br />
                <label>RG</label>
                <asp:TextBox ID="txtRg" CssClass="form-control" runat="server" />
                <br />

                <label>Cidade</label>
                <asp:DropDownList ID="ddCidade" runat="server" CssClass="form-control">                    
                </asp:DropDownList>
                <br />
                <label>Endereço</label>
                <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server"/>
                <br />
                <label>Telefone</label>
                <asp:TextBox ID="txtTelefone1" CssClass="form-control" runat="server"/>
                <br />
                <label>Celular</label>
                <asp:TextBox ID="txtTelefone2" CssClass="form-control" runat="server"/>
                <br />
                <label for="descricao">
                Observação:
                </label>
                <asp:TextBox CssClass="form-control" ID="txtObs" runat="server" Height="57px" TextMode="MultiLine" />                
                <br />
                <!-- Funcionário e Dentista -->
                <div id="dTipoUsuario" runat="server" js="TipoUsuario">
                    <label runat="server" id="lblTipoUsuario">
                    Tipo de Usuário
                    </label>
                    <asp:DropDownList ID="ddTipoUsuario" runat="server" CssClass="form-control">   
                        <asp:ListItem Selected="True" Value="1">Padrão</asp:ListItem>  
                        <asp:ListItem Value="2">Administrador</asp:ListItem>                                   
                    </asp:DropDownList>
                    <br />
                </div>
                <div id="dUsuario" runat="server" js="Usuario">
                    <label id="lblUsuario" runat="server">Usuário</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"/>
                    <br />
                </div>
                <div id="dSenha" runat="server" js="Senha">
                    <label id="lblSenha" runat="server">Senha</label>
                    <asp:TextBox id="txtSenha" runat="server" CssClass="form-control" />
                    <br />
                </div>
                <!-- Dentista -->
                <div id="dCro" runat="server" js="Cro">
                    <label id="lblCro" runat="server">C.R.O.</label>
                    <asp:TextBox ID="txtCro" runat="server" CssClass="form-control" TextMode="Number" />
                    <br />
                </div>
                <!-- Funcionario -->
                <div id="dCargo" runat="server" js="Cargo">
                    <label id="lblCargo" runat="server">Cargo</label>
                    <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control"/>
                    <br />
                </div>
                <div id="dSalario" runat="server" js="Salario"> 
                    <label id="lblSalario" runat="server">Salário</label>
                    <asp:TextBox ID="txtSalario" runat="server" CssClass="form-control" TextMode="Number" />
                    <br />
                </div>
                <!-- Paciente -->
                <div id="dConvenio" runat="server" js="Convenio">
                    <label id="lblConvenio" runat="server">Convênio</label>
                    <asp:DropDownList ID="ddConvenio" runat="server" CssClass="form-control">
                        <asp:ListItem Selected="True">Nenhum</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
            </div>            
        </div>
        <!-- row -->
        </div>
        <!-- panel-body -->
    </div>
    <!-- panel panel-default -->
    </div>
    <!-- col-md-12 -->
    <!-- Botões -->    
    <div class="col-md-offset-3">
    
        <div class="form-group">
            <asp:Button js="Salvar" ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" />
            <asp:Button ID="btnListar" runat="server" Text="Listar" CssClass="btn btn-primary" />
            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" />
            <asp:Button ID="btnExcluir" runat="server" Text="Excluir" CssClass="btn btn-danger" />
            <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" />
        </div>    
    </div>
    
    <!-- modal -->    
    <div runat="server" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel">Verifica CPF</h4>
        </div>
        <!-- BODY -->
        <div class="modal-body">
        <h1>  </h1>                     	                                                               
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
            Sim
            </button>
            <button type="button" class="btn btn-primary" data-dismiss="modal">
            Não
            </button>
        </div>
    </div>
    </div>
    </div>      

    <script type="text/javascript">
        $(document).ready(function () {
            // executa a função quando a página está pronta e carregada
            ModificaCampos();
        });

        function VerificaCPF() {
            alert("ta funfando");            
            PageMethods.Verifica();
            function onSuccess(result) {
                if (!result) {
                    //exibir a mensagem que existe cpf cadastrado e pergunta se deseja buscar o cadastro                    
                }
                else {
                    //exibe uma mensagem que o cpf está livre para cadastro
                }
            }
            function onError(result) {
                alert("erro");
            }
        }

        function ModificaCampos() {            
            // oculta os campos para depois verificar quais serão exibidos
            $('div[js="Convenio"]').hide();
            $('div[js="Cro"]').hide();
            $('div[js="Cargo"]').hide();
            $('div[js="Salario"]').hide();
            $('div[js="TipoUsuario"]').hide();
            $('div[js="Senha"]').hide();
            $('div[js="Usuario"]').hide();            

            // verifica os três checkbox para saber quais estão checkados para exibir os campos
            if ($('input[Value="P"]').is(':checked')) { // PACIENTE
                $('div[js="Convenio"]').show();                
            }
            if ($('input[Value="F"]').is(':checked')) { // FUNCIONÁRIO
                $('div[js="Cargo"]').show();
                $('div[js="Salario"]').show();
                $('div[js="TipoUsuario"]').show();
                $('div[js="Senha"]').show();
                $('div[js="Usuario"]').show();                    
            }
            if ($('input[Value="D"]').is(':checked')) { // DENTISTA
                $('div[js="Cro"]').show();
                $('div[js="Salario"]').show();
                $('div[js="TipoUsuario"]').show();
                $('div[js="Senha"]').show();
                $('div[js="Usuario"]').show();                    
            }
        }                   

        // ao modificar o conteúdo do select[js="TipoPessoa"] irá executar o ModificaCampos
        $('table[js="TipoPessoa"]').on('change', function () {            
            ModificaCampos();
        });

    </script>
    
    <!-- /. PAGE ROW -->
<!-- /. PAGE INNER -->

</asp:Content>
