<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="cidades.aspx.cs" Inherits="FrontEnd.cidades" meta:resourcekey="PageResource1"%>
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
                    <div class="form-group">
                        <div class="col-md-8">
                            <label><asp:Literal ID="lt02" Text="<%$ resources: cidade %>" runat="server"/></label>
                            <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" 
                                   placeholder="<%$ resources: txtdigite %>" ToolTip="Nome da Cidade" />                                                                  
                        </div>
                        <div class="col-md-1">
                            <label><asp:Literal ID="lt03" Text="<%$ resources: estado %>" runat="server"/></label>     
                            <asp:DropDownList CssClass="btn btn-default dropdown-toggle" ID="ddUF" runat="server" ToolTip="Selecione o estado">
                                <asp:ListItem>AC</asp:ListItem>
                                <asp:ListItem>AL</asp:ListItem>
                                <asp:ListItem>AP</asp:ListItem>
                                <asp:ListItem>AM</asp:ListItem>
                                <asp:ListItem>BA</asp:ListItem>
                                <asp:ListItem>CE</asp:ListItem>
                                <asp:ListItem>DF</asp:ListItem>
                                <asp:ListItem>ES</asp:ListItem>
                                <asp:ListItem>GO</asp:ListItem>
                                <asp:ListItem>MA</asp:ListItem>
                                <asp:ListItem>MT</asp:ListItem>
                                <asp:ListItem>MS</asp:ListItem>
                                <asp:ListItem>MG</asp:ListItem>
                                <asp:ListItem>PA</asp:ListItem>
                                <asp:ListItem>PB</asp:ListItem>
                                <asp:ListItem>PR</asp:ListItem>
                                <asp:ListItem>PE</asp:ListItem>
                                <asp:ListItem>PI</asp:ListItem>
                                <asp:ListItem>RJ</asp:ListItem>
                                <asp:ListItem>RN</asp:ListItem>                                        
                                <asp:ListItem>RS</asp:ListItem>
                                <asp:ListItem>RO</asp:ListItem>
                                <asp:ListItem>RR</asp:ListItem>
                                <asp:ListItem>SC</asp:ListItem>
                                <asp:ListItem>SP</asp:ListItem>
                                <asp:ListItem>SE</asp:ListItem>
                                <asp:ListItem>TO</asp:ListItem>                                        
                            </asp:DropDownList>
                        </div>
                    </div>                            
                </div>                    
            </div>
        </div>
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


</asp:Content>
