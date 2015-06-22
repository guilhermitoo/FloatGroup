<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaConvenios.aspx.cs" Inherits="FrontEnd.listaConvenios" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">    
    <h1><asp:Literal ID="lt01" Text="<%$ resources: titulo %>" runat="server"/></h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtConvenio" runat="server" CssClass="form-control" placeholder="Digite o nome do convênio que deseja buscar" ToolTip="Convênio" meta:resourcekey="txtConvenioResource1" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" meta:resourcekey="btnBuscarResource1"/>
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource1" />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rlistaConvenio" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th><asp:Literal ID="lt02" Text="<%$ resources: id %>" runat="server"/></th>
                    <th><asp:Literal ID="lt03" Text="<%$ resources: razaosocial %>" runat="server"/></th>
                    <th><asp:Literal ID="lt04" Text="<%$ resources: nomefantasia %>" runat="server"/></th>                        
                    <th><asp:Literal ID="lt05" Text="<%$ resources: cnpj %>" runat="server"/></th>
                    <th><asp:Literal ID="lt06" Text="<%$ resources: ie %>" runat="server"/></th>
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"razao_social") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"nome_fantasia") %></td>                    
                <td><%# DataBinder.Eval(Container.DataItem,"cnpj") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"ie") %></td>
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "convenios.aspx?ID={0}") %>' meta:resourcekey="btnEditarResource1">Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
