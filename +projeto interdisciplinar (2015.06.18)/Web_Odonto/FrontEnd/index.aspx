<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" meta:resourcekey="PageResource1" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h2>        
        <i>
            <asp:Label id="lblNomeUsuarioPrincipal" runat="server" meta:resourcekey="lblNomeUsuarioPrincipalResource1"/>
        </i>
    </h2>
    <h5>
        <asp:Literal ID="lt00" Text="<%$ resources: atencao %>" runat="server"/>
    </h5>
                        
    <hr />
    <!-- FORMULÁRIO PARA PROCURAR USUÁRIO E OUTRAS AÇÕES -->
    <div class="col-md-9">
    <div class="col-md-offset-4">        
            <div class="form-group">
                <br />
                <div class="input-group">
                    
                </div>
                <br />
                <!-- BOTÕES QUE LEVA A PÁGINA CADASTRAR -->
            </div>        
    </div>
    </div>
    <!-- /. PAGE INNER -->
</asp:Content>
