<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="FrontEnd.pessoas" meta:resourcekey="PageResource1"%>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
     
<h2>
    <asp:Literal ID="lt00" Text="<%$ resources: titulo %>" runat="server"/>
</h2>    
<h5>
    <asp:Literal ID="lt01" Text="<%$ resources: subtitulo %>" runat="server"/> 
</h5>
<hr />
<!--Topo -->
<div class="col-md-12">
    <div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
        <div class="col-md-6">    
            
                <label><asp:Literal ID="lt02" Text="<%$ resources: cpf  %>" runat="server"/></label>              
            <div class="input-group">
                <input id="txtCpf" class="form-control" runat="server" onkeyup="formataCPF(this,event);" maxlength="14" />
                <span class="input-group-btn" >
                    <asp:Button runat="server" id="btnBuscar" CssClass="btn btn-default" Text="Buscar" OnClick="btnBuscar_Click" meta:resourcekey="btnBuscarResource1" />
                </span>                                        
            </div>
            <asp:Label id="lblAlertaCPF" runat="server" Font-Size="8pt" ForeColor="#00CC66" meta:resourcekey="lblAlertaCPFResource1" />
                <br />              
                <label>
                    <asp:Literal ID="lt03" Text="<%$ resources: tipocadastro  %>" runat="server"/>
                </label>                    
                <asp:CheckBoxList js="TipoPessoa" ID="cbTipoPessoa" runat="server" meta:resourcekey="cbTipoPessoaResource1">                                            
                    <asp:ListItem Value="P" Text="Paciente" meta:resourcekey="ListItemResource1" />
                    <asp:ListItem Value="F" Text="Funcionário" meta:resourcekey="ListItemResource2" />
                    <asp:ListItem Value="D" Text="Dentista" meta:resourcekey="ListItemResource3" />
                </asp:CheckBoxList>     
                <br />                                                      
                <label><asp:Literal ID="lt04" Text="<%$ resources: status  %>" runat="server"/></label>                   
                <asp:RadioButtonList ID="rdStatus" runat="server" meta:resourcekey="rdStatusResource1">
                    <asp:ListItem Value="1" Selected="True" meta:resourcekey="ListItemResource4">Ativo</asp:ListItem>
                    <asp:ListItem Value="2" meta:resourcekey="ListItemResource5" >Inativo</asp:ListItem>
                </asp:RadioButtonList>                
                <br />                
                <label><asp:Literal ID="lt05" Text="<%$ resources: nome  %>" runat="server"/></label>
                <asp:TextBox CssClass="form-control" runat="server" ID="txtNome" meta:resourcekey="txtNomeResource1"/>
                <br />
                <label><asp:Literal ID="lt06" Text="<%$ resources: sexo  %>" runat="server"/></label>                
                <asp:RadioButtonList ID="rdSexo" runat="server" meta:resourcekey="rdSexoResource1">
                    <asp:ListItem Value="M" Selected="True" meta:resourcekey="ListItemResource6" >Masculino</asp:ListItem>
                    <asp:ListItem Value="F" meta:resourcekey="ListItemResource7"                 >Feminino</asp:ListItem>
                </asp:RadioButtonList>                                
                <br />                
                <label><asp:Literal ID="lt07" Text="<%$ resources: nascimento %>" runat="server"/></label>
                <input class="form-control" id="txtNasc" js="data" onkeyup="formataData(this,event);" runat="server" maxlength="10" />
                <br />
                <label><asp:Literal ID="lt08" Text="<%$ resources: rg  %>" runat="server"/></label>
                <input id="txtRg" class="form-control" runat="server" onkeyup="formataRG(this,event);" maxlength="12"/>
                <br />

                <label><asp:Literal ID="lt09" Text="<%$ resources: cidade  %>" runat="server"/></label>
                <asp:DropDownList ID="ddCidade" runat="server" CssClass="form-control" meta:resourcekey="ddCidadeResource1">                    
                </asp:DropDownList>
                <br />
                <label><asp:Literal ID="lt10" Text="<%$ resources: endereco  %>" runat="server"/></label>
                <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server" meta:resourcekey="txtEnderecoResource1"/>
                <br />
                <label><asp:Literal ID="lt11" Text="<%$ resources: telefone  %>" runat="server"/></label>
                <input id="txtTelefone1" class="form-control" runat="server" onkeyup="formataTelefone(this,event);" />
                <br />
                <label><asp:Literal ID="lt12" Text="<%$ resources: celular  %>" runat="server"/></label>
                <input id="txtTelefone2" class="form-control" runat="server" onkeyup="formataTelefone(this,event);"/>
                <br />
                <label for="descricao">
                    <asp:Literal ID="lt13" Text="<%$ resources: observacao  %>" runat="server"/>
                </label>
                <asp:TextBox CssClass="form-control" ID="txtObs" runat="server" Height="57px" TextMode="MultiLine" meta:resourcekey="txtObsResource1" />                
                <br />
                <!-- Funcionário e Dentista -->
                <div id="dTipoUsuario" runat="server" js="TipoUsuario">
                    <label runat="server" id="lblTipoUsuario">
                        <asp:Literal ID="lt14" Text="<%$ resources: tpusuario  %>" runat="server"/>
                    </label>
                    <asp:DropDownList ID="ddTipoUsuario" runat="server" CssClass="form-control" meta:resourcekey="ddTipoUsuarioResource1">   
                        <asp:ListItem Selected="True" Value="1" meta:resourcekey="ListItemResource8">Padrão</asp:ListItem>  
                        <asp:ListItem Value="2" meta:resourcekey="ListItemResource9">Administrador</asp:ListItem>                                   
                    </asp:DropDownList>
                    <br />
                </div>
                <div id="dUsuario" runat="server" js="Usuario">
                    <label id="lblUsuario" runat="server"><asp:Literal ID="lt15" Text="<%$ resources: usuario  %>" runat="server"/></label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" meta:resourcekey="txtUsuarioResource1"/>
                    <br />
                </div>
                <div id="dSenha" runat="server" js="Senha">
                    <label id="lblSenha" runat="server"><asp:Literal ID="lt16" Text="<%$ resources: senha  %>" runat="server"/></label>
                    <asp:TextBox id="txtSenha" runat="server" CssClass="form-control" meta:resourcekey="txtSenhaResource1" />
                    <br />
                </div>
                <!-- Dentista -->
                <div id="dCro" runat="server" js="Cro">
                    <label id="lblCro" runat="server"><asp:Literal ID="lt17" Text="<%$ resources: cro  %>" runat="server"/></label>
                    <asp:TextBox ID="txtCro" runat="server" CssClass="form-control" TextMode="Number" meta:resourcekey="txtCroResource1" />
                    <br />
                </div>
                <!-- Funcionario -->
                <div id="dCargo" runat="server" js="Cargo">
                    <label id="lblCargo" runat="server"><asp:Literal ID="lt18" Text="<%$ resources: cargo  %>" runat="server"/></label>
                    <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control" meta:resourcekey="txtCargoResource1"/>
                    <br />
                </div>
                <div id="dSalario" runat="server" js="Salario"> 
                    <label id="lblSalario" runat="server"><asp:Literal ID="lt19" Text="<%$ resources: salario  %>" runat="server"/></label>                    
                    <input id="txtSalario" runat="server"  class="form-control" 
                        style="text-align:right" onkeyup="formataValor(this,event);" />                    
                    <br />
                </div>
                <!-- Paciente -->
                <div id="dConvenio" runat="server" js="Convenio">
                    <label id="lblConvenio" runat="server"><asp:Literal ID="lt20" Text="<%$ resources: convenio  %>" runat="server"/></label>
                    <asp:DropDownList ID="ddConvenio" runat="server" CssClass="form-control" meta:resourcekey="ddConvenioResource1">
                        <asp:ListItem Selected="True" meta:resourcekey="ListItemResource10">Nenhum</asp:ListItem>
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
            <asp:Button js="Salvar" ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" meta:resourcekey="btnSalvarResource1" />
            <asp:Button ID="btnListar" runat="server" Text="Consultar" CssClass="btn btn-primary" OnClick="btnListar_Click" meta:resourcekey="btnListarResource1" />
            <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" meta:resourcekey="btnLimparResource1" />            
            <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" meta:resourcekey="btnSairResource1" />
        </div>    
    </div>
    
        

    <script type="text/javascript">
        $(document).ready(function () {
            // executa a função quando a página está pronta e carregada
            ModificaCampos();

            $('input[js="data"]').datepicker({
                format: "dd/mm/yyyy",
                language: "pt-BR",
                calendarWeeks: true,
                todayHighlight: true
            });

        });

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
