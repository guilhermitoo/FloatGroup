<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="convenios.aspx.cs" Inherits="FrontEnd.convenios" meta:resourcekey="PageResource1" %>
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
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <!--Lado Esquerdo do Formulário -->
                <div class="col-md-6">                                            
                    <div class="form-group">
                        <label>
                            <asp:Literal ID="lt02" Text="<%$ resources: cnpj %>" runat="server"/>
                        </label>                                               
                        <div class="input-group">                                                    
                            <input class="form-control" placeholder="<%$ resources: cnpj %>" id="txtCNPJ" 
                                runat="server" onkeyup="formataCNPJ(this,event);" maxlength="18"/>
                            <span class="input-group-btn">
                                <asp:Button CssClass="btn btn-default" id="btnProcuraCNPJ" runat="server" 
                                    Text="Buscar" OnClick="btnProcuraCNPJ_Click" meta:resourcekey="btnProcuraCNPJResource1" />                                
                            </span>
                        </div>
                        <asp:Label ID="lblAlertaCNPJ" runat="server" Font-Size="8pt" ForeColor="#00CC00" meta:resourcekey="lblAlertaCNPJResource1" />
                        <br />
                        <label>
                            <asp:Literal ID="lt03" Text="<%$ resources: razaosocial %>" runat="server"/>
                        </label>
                        <asp:TextBox ID="txtRazao" CssClass="form-control" runat="server" meta:resourcekey="txtRazaoResource1"></asp:TextBox>                                                                                               
                        <br />
                        <label>
                            <asp:Literal ID="lt04" Text="<%$ resources: nomefantasia %>" runat="server"/>
                        </label>                                                
                        <asp:TextBox ID="txtNomeFantasia" CssClass="form-control" runat="server" meta:resourcekey="txtNomeFantasiaResource1"></asp:TextBox>
                        <br />
                        <label>
                            <asp:Literal ID="lt05" Text="<%$ resources: ie %>" runat="server"/>
                        </label>                                                
                        <asp:TextBox ID="txtIe" CssClass="form-control" runat="server" meta:resourcekey="txtIeResource1"></asp:TextBox>
                        <br />
                    </div>
                               
                </div>
                <!-- row -->
            </div>
            <!-- panel-body -->
        </div>
        <!-- panel panel-default -->
    </div>
    </div>
    <!-- col-md-12 -->
    <!-- Botões -->
    <div class="col-md-offset-3">   
        <div class="form-group">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" meta:resourcekey="btnSalvarResource1" />
                <asp:Button ID="btnListar" runat="server" Text="Consultar" CssClass="btn btn-primary" OnClick="btnListar_Click" meta:resourcekey="btnListarResource1" />
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" meta:resourcekey="btnLimparResource1" />
                <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" meta:resourcekey="btnSairResource1" />
        </div>        
    </div>

<!-- /. PAGE ROW -->
                        


</asp:Content>
