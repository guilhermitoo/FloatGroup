<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="FrontEnd.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
            <div class="form-group">
                <label>
                Escolha o tipo de cadastro
                </label>
                <asp:DropDownList ID="ddTipoPessoa" class="form-control" runat="server" OnSelectedIndexChanged="ddTipoPessoa_SelectedIndexChanged">
                <asp:ListItem Value="P">Paciente</asp:ListItem>
                <asp:ListItem Value="F">Funcionário</asp:ListItem>
                <asp:ListItem Value="D">Dentista</asp:ListItem>
                </asp:DropDownList>
                <br />
                <label>
                Status:
                </label>
                <br />
                <div class="radio-inline">
                <label>
                    <input type="radio" name="status" value="option1" checked="checked" />
                    Ativo
                </label>
                </div>
                <div class="radio-inline">
                <label>
                    <input type="radio" name="status" value="option2" />
                    Inativo
                </label>
                </div>
                <br />
                <br />
                <label>
                Nome
                </label>
                <input class="form-control" />
                <br />
                <label>
                Sexo:
                </label>
                <br />
                <div class="radio-inline">
                <label>
                    <input type="radio" name="genero" id="masculino" value="option1" checked="checked"/>
                    Masculino
                </label>
                </div>
                <div class="radio-inline">
                <label>
                    <input type="radio" name="genero" id="feminino" value="option2" />
                    Feminino
                </label>
                </div>
                <br />
                <br />
                <label>
                Data de Nascimento
                </label>
                <input class="form-control" id="datepicker" />
                <br />
                <label>
                RG
                </label>
                <input class="form-control" />
                <br />
                <label>
                CPF
                </label>
                <input class="form-control" />
                <br />
                <label>
                Cidade
                </label>
                <asp:DropDownList ID="ddCidade" runat="server" CssClass="form-control">                    
                </asp:DropDownList>
                <br />
                <label>
                Endereço
                </label>
                <asp:TextBox ID="txtEndereco" CssClass="form-control" runat="server"/>
                <br />
                <label>
                CEP
                </label>
                <input class="form-control" />
                <br />
                <label>
                Telefone
                </label>
                <input class="form-control" />
                <br />
                <label>
                Celular
                </label>
                <input class="form-control" />
                <br />
                <label for="descricao">
                Observação:
                </label>
                <textarea class="form-control" rows="5" id="comment">
                </textarea>
                <br />
                <!-- Funcionário e Dentista -->
                <div id="dTipoUsuario" runat="server">
                    <label runat="server" id="lblTipoUsuario">
                    Tipo de Usuário
                    </label>
                    <asp:DropDownList ID="ddTipoUsuario" runat="server" CssClass="form-control">   
                        <asp:ListItem Selected="True" Value="1">Padrão</asp:ListItem>  
                        <asp:ListItem Value="2">Administrador</asp:ListItem>                                   
                    </asp:DropDownList>
                    <br />
                </div>
                <div id="dUsuario" runat="server">
                    <label id="lblUsuario" runat="server">Usuário</label>
                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"/>
                    <br />
                </div>
                <div id="dSenha" runat="server">
                    <label id="lblSenha" runat="server">Senha</label>
                    <asp:TextBox id="txtSenha" runat="server" CssClass="form-control" TextMode="Password" />
                    <br />
                </div>
                <!-- Dentista -->
                <label id="lblCro" runat="server">C.R.O.</label>
                <asp:TextBox ID="txtCro" runat="server" CssClass="form-control" TextMode="Number" />
                <br />
                <!-- Funcionario -->
                <label id="lblCargo" runat="server">Cargo</label>
                <asp:TextBox ID="txtCargo" runat="server" CssClass="form-control"/>
                <br />
                <label id="lblSalario" runat="server">Salário</label>
                <asp:TextBox ID="txtSalario" runat="server" CssClass="form-control" TextMode="Number" />
                <br />
                <!-- Paciente -->
                <label id="lblConvenio" runat="server">Convênio</label>
                <asp:DropDownList ID="ddConvenio" runat="server">
                    <asp:ListItem Selected="True">Nenhum</asp:ListItem>
                </asp:DropDownList>
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
    <form role="form">
        <div class="form-group">
        <button type="submit" class="btn btn-info">
            Salvar
        </button>
        <button type="submit" class="btn btn-success">
            Limpar
        </button>
        <button type="submit" class="btn btn-warning">
            Sair
        </button>
        </div>
    </form>
    </div>
</div>
<!-- /. PAGE ROW -->
<!-- /. PAGE INNER -->

</asp:Content>
