<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaFuncionarios.aspx.cs" Inherits="FrontEnd.listaFuncionarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <h1>Lista de Funcionários</h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" placeholder="Digite o nome que deseja buscar" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" />
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click"  />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rListaFuncionarios" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>       
                    <th>RG</th>                 
                    <th>Status</th>                    
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
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "pessoas.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
