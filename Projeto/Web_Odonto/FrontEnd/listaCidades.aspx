<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaCidades.aspx.cs" Inherits="FrontEnd.listaCidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <h1>Lista de Cidades</h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNomeCidade" runat="server" CssClass="form-control" placeholder="Digite o nome da cidade que deseja buscar" ToolTip="Nome da Cidade" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscarCidade" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscarCidade_Click"/>
        <asp:Button ID="tbnSair" runat="server" CssClass="btn btn-danger" Text="Sair" OnClick="tbnSair_Click"/>
    </div>
    <br />
    <br />
    <br />
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
                <td><%# DataBinder.Eval(Container.DataItem,"id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"uf") %></td>                    
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "cidades.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>



</asp:Content>
