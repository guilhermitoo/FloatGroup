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
                    <input type="text" class="form-control" placeholder='<asp:Literal ID="lt03" Text="<%$ resources: digite1 %>" runat="server"/>'/>
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <asp:Literal ID="lt01" Text="<%$ resources: procurar %>" runat="server"/>
                        </button>
                    </span>
                    <div class="col-md-1">
                        <a href="agenda.html">
            <button type="submit" class="btn btn-primary"><asp:Literal ID="lt02" Text="<%$ resources: cadusuario %>" runat="server"/></button>
        </a>
                    </div>
                </div>
                <br />
                <!-- BOTÕES QUE LEVA A PÁGINA CADASTRAR -->
            </div>        
    </div>
    </div>
    <!-- /. PAGE INNER -->
</asp:Content>
