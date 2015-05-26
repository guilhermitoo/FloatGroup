<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="medicamentos.aspx.cs" Inherits="FrontEnd.medicamentos" meta:resourcekey="PageResource1" %>
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
                    <div class="col-md-6">                        
                        <div class="form-group">
                            <br />
                            <label>
                                <asp:Literal ID="lt02" Text="<%$ resources: nomemed %>" runat="server"/>
                            </label>
                            <asp:TextBox CssClass="form-control" id="txtNome" runat="server" meta:resourcekey="txtNomeResource1"/>
                            <br />
                            <label>
                                <asp:Literal ID="lt03" Text="<%$ resources: tarja %>" runat="server"/>
                            </label>
                            <asp:TextBox  class="form-control" id="txtTarja" runat="server" meta:resourcekey="txtTarjaResource1"/>
                            <br />
                            <label>
                                <asp:Literal ID="lt04" Text="<%$ resources: classe %>" runat="server"/>
                            </label>
                            <asp:TextBox  class="form-control" id="txtClasseTerapeutica" runat="server" meta:resourcekey="txtClasseTerapeuticaResource1"/>
                            <br />
                            <label>
                                <asp:Literal ID="lt05" Text="<%$ resources: unidade %>" runat="server"/>
                            </label>
                            <asp:TextBox  class="form-control" id="txtUnidade" runat="server" meta:resourcekey="txtUnidadeResource1"/>
                            <br />
                            <label for="descricao">
                                <asp:Literal ID="lt06" Text="<%$ resources: posologia %>" runat="server"/>
                            </label>                                
                            <textarea class="form-control" rows="5" id="txtPosologia" runat="server">
                            </textarea>
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
