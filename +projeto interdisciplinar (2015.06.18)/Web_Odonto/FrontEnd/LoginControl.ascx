    <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="FrontEnd.LoginControl" %>

    <!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
    <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
    <!-- SB ADMIN 2 -->    
    <link href="assets/css/fundo.css" rel="stylesheet" />
    <div>        
		
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
                    <asp:Label id="lblNomeUsuario" runat="server" meta:resourcekey="lblNomeUsuarioResource1" />&nbsp;
                    <asp:Button ID="btnSairLogado" runat="server" Text="Sair" CssClass="btn btn-danger sair" OnClick="btnSairLogado_Click" meta:resourcekey="btnSairLogadoResource1"/>
                </div>
            </nav>
        </asp:Panel>
			<asp:Panel id="pnlNaoLogado" runat="server" meta:resourcekey="pnlNaoLogadoResource1">                                    
			        <div class="fundoLogin" style="color: white">                        
                        <!--<img src="assets/img/float.png" />-->
                        <asp:Label runat="server" CssClass="col-md-12 textoTitulo" Text="Web Odonto" meta:resourcekey="LabelResource1"/>
                        <div>
				            <div class="col-sm-8">													
					            <div class="col-md-4" >
                                    <asp:Label ID="lblUsuario" runat="server" Text="Usuário" meta:resourcekey="lblUsuarioResource1"></asp:Label>
                                    <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" meta:resourcekey="txtUsuarioResource1"></asp:TextBox><br />
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSenha" runat="server" Text="Senha" meta:resourcekey="lblSenhaResource1"></asp:Label>
                                    <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" CssClass="form-control" meta:resourcekey="txtSenhaResource1"></asp:TextBox><br />
                                    <asp:Label ID="lblErro" runat="server" ForeColor="Red" meta:resourcekey="lblErroResource1"></asp:Label><br />
                                </div>
                                <div class="col-md-2">
                                    <br />
                                    <asp:Button id="btnEntrar" runat="server" Text="Entrar" OnClick="btnEntrar_Click" CssClass="btn btn-primary" meta:resourcekey="btnEntrarResource1"/>                        				  							
                                </div>	
				            </div>	
                        </div>		
			        </div>            		                
        </asp:Panel>										
	</div>

<script type="text/javascript">
    $(".sair").keydown(function (event) {

        if (event.keyCode == '13') {

            event.preventDefault();

        }
    });
</script>   