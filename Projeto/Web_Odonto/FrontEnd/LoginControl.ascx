    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="FrontEnd.LoginControl" %>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />

    <asp:Panel ID="painelLogado" runat="server">
        <asp:Button ID="btnSair" runat="server" Text="Sair" OnClick="btnSair_Click" CssClass="btn btn-danger"/>
    </asp:Panel>

    <asp:Panel id="painelNaoLogado" runat="server">
        <asp:Label ID="lblUsuario" runat="server" Text="Usuário"></asp:Label>
        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox><br />
        <asp:Label ID="lblSenha" runat="server" Text="Senha"></asp:Label>
        <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox><br />
        <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label><br />
        <asp:Button id="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary"/>
    </asp:Panel>


    <script src="assets/js/jquery-ui-1.11.4.custom/external/jquery/jquery.js"></script>
                        
    <!--JQUERY UI SCRIPTS -->    
    <script src="assets/js/jquery-ui-1.11.4.custom/jquery-ui.js">
    </script>
    <script src="assets/js/jquery-ui-1.11.4.custom/jquery-ui.min.js">
    </script>
    <link href="assets/js/jquery-ui-1.11.4.custom/jquery-ui.css" rel="stylesheet" />

    <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js">                        
    </script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js">                        
    </script>
    <!-- MORRIS CHART SCRIPTS -->
    <script src="assets/js/morris/raphael-2.1.0.min.js">                        
    </script>
    <script src="assets/js/morris/morris.js">                        
    </script>
    <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js">                        
    </script>        
    <!-- DATEPICKER -->      
    <script src="assets/js/datepicker/js/bootstrap-datepicker.js">
    </script>   

    <!-- MÁSCARAS -->
    <script src="assets/js/mascara.js">
    </script>