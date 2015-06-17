<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="procedimentos.aspx.cs" Inherits="FrontEnd.procedimentos" meta:resourcekey="PageResource1" %>
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
                    <div class="col-md-12">                                                
                        <label>
                            <asp:Literal ID="lt02" Text="<%$ resources: descricao %>" runat="server"/>
                        </label>
                        <asp:TextBox id="txtDescricao" runat="server" CssClass="form-control" meta:resourcekey="txtDescricaoResource1" />
                        <br /> 
                        </div>                                        
                    <!-- row -->
                </div>
                <!-- panel-body -->
                <asp:Label id="lb1" runat="server" Text="<%$ resources: detalhes  %>"/>
            </div>
            <!-- panel panel-default -->
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
    </div>
    <!-- /. PAGE ROW -->
    <!-- /. PAGE INNER -->

</asp:Content>
