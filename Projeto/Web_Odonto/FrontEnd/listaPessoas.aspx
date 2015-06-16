<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaPessoas.aspx.cs" Inherits="FrontEnd.listaPessoas" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <h2><asp:Label ID="lbTitulo" runat="server" Text="Lista de Pessoas"/></h2>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Digite o nome que deseja buscar" meta:resourcekey="txtNomeResource1" ></asp:TextBox>  
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" meta:resourcekey="btnBuscarResource1" />
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource1" />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rListaPessoas" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th><asp:Literal ID="lt02" Text="<%$ resources: id %>" runat="server"/></th>
                    <th><asp:Literal ID="lt03" Text="<%$ resources: nome %>" runat="server"/></th>
                    <th><asp:Literal ID="lt04" Text="<%$ resources: cpf %>" runat="server"/></th>       
                    <th><asp:Literal ID="lt05" Text="<%$ resources: rg %>" runat="server"/></th>                 
                    <th><asp:Literal ID="lt06" Text="<%$ resources: status %>" runat="server"/></th>
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"cpf") %></td>                    
                <td><%# DataBinder.Eval(Container.DataItem,"rg") %></td>                    
                <td><%# DataBinder.Eval(Container.DataItem,"status") %></td>                    
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" meta:resourcekey="btnEditarResource1"
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "pessoas.aspx?ID={0}") %>' >Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
