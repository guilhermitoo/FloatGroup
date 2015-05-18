    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="FrontEnd.LoginControl" %>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    
    <div id="header">        
		
        <asp:Panel id="pnlLogado" runat="server" HorizontalAlign="Right">
            <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                        <span class="sr-only">
                            Toggle navigation
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                        <span class="icon-bar">
                        </span>
                    </button>
                    <a class="navbar-brand">WebOdonto</a>
                </div>
                <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;">                    
                    <asp:Label id="lblNomeUsuario" runat="server"  />&nbsp;
                    <asp:Button ID="btnSairLogado" runat="server" Text="Sair" CssClass="btn btn-danger" OnClick="btnSairLogado_Click"/>
                </div>
            </nav>
        </asp:Panel>
			<asp:Panel id="pnlNaoLogado" runat="server">
                <div class="container">
			    <div class="row">
				    <div class="col-lg-6">													
					    <div class="form-group" >
                            <asp:Label ID="lblUsuario" runat="server" Text="Usuário"></asp:Label>
                            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control"></asp:TextBox><br />
                            <asp:Label ID="lblSenha" runat="server" Text="Senha"></asp:Label>
                            <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control" ></asp:TextBox><br />
                            <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label><br />
                            <asp:Button id="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary"/>
                        	</div>					  							
				    </div>			
			    </div>
            </div>		
        </asp:Panel>										
	</div>
