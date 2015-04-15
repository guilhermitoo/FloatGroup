<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaCidades.aspx.cs" Inherits="FrontEnd.listaCidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Lista de Cidades</h1>

    <asp:HyperLink ID="btnNovo" runat="server" CssClass="btn btn-success" 
        NavigateUrl="~/cidades.aspx" >Novo</asp:HyperLink>      

    <asp:Repeater ID="rlistaCidades" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>UF</th>                        
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"Id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"Nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"UF") %></td>                    
                <td>
                    <asp:HyperLink ID="hplExibir" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Id", "ExibirItem.aspx?ID={0}") %>'>Exibir</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>



</asp:Content>
