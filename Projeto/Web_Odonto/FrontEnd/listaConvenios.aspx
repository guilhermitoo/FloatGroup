<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaConvenios.aspx.cs" Inherits="FrontEnd.listaConvenios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">    
    <h1>Lista de Convenios</h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtConvenio" runat="server" CssClass="form-control" placeholder="Digite o nome do convênio que deseja buscar" ToolTip="Convênio" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click"/>
        <asp:Button ID="tbnSair" runat="server" CssClass="btn btn-danger" Text="Sair" OnClick="tbnSair_Click"/>
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rlistaConvenio" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Razão Social</th>
                    <th>Nome Fantasia</th>                        
                    <th>CNPJ</th>
                    <th>IE</th>
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
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "convenios.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>
</asp:Content>
