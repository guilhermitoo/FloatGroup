<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaMedicamentos.aspx.cs" Inherits="FrontEnd.listaMedicamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h1>Lista de Medicamentos</h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNomeMedicamento" runat="server" CssClass="form-control" placeholder="Digite o nome do medicamento que deseja buscar" ToolTip="Nome da Cidade" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar"/>
        <asp:Button ID="tbnSair" runat="server" CssClass="btn btn-danger" Text="Sair"/>
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rlistaMedicamentos" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Classe Terapêutica</th>                        
                    <th>Tarja</th>
                    <th>Unidade</th>
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"Id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"Nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"ClasseTerapeutica") %></td>                    
                <td><%# DataBinder.Eval(Container.DataItem,"Tarja") %></td>                   
                <td><%# DataBinder.Eval(Container.DataItem,"Unidade") %></td>                   
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Id", "medicamentos.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>


</asp:Content>
