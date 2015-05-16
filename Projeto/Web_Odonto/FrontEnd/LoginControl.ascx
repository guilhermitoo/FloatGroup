    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="FrontEnd.LoginControl" %>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <div class="jumbotron">
        <asp:Panel ID="painelLogado" runat="server">
            <asp:Button ID="btnSair" runat="server" Text="Sair"  CssClass="btn btn-danger"/>
        </asp:Panel>

        <asp:Panel id="painelNaoLogado" runat="server">
            <asp:Label ID="lblUsuario" runat="server" Text="Usuário"></asp:Label>
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox><br />
            <asp:Label ID="lblSenha" runat="server" Text="Senha"></asp:Label>
            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox><br />
            <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label><br />
            <asp:Button id="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary"/>
        </asp:Panel>
    </div>
