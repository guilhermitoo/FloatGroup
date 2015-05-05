<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaMedicamentos.aspx.cs" Inherits="FrontEnd.listaMedicamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h1>Lista de Medicamentos</h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNomeMedicamento" runat="server" CssClass="form-control" placeholder="Digite o nome do medicamento que deseja buscar" ToolTip="Nome da Medicamento" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click"/>
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" />
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
                <td><%# DataBinder.Eval(Container.DataItem,"id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"classe_terapeutica") %></td>                    
                <td><%# DataBinder.Eval(Container.DataItem,"tarja") %></td>                   
                <td><%# DataBinder.Eval(Container.DataItem,"unidade") %></td>                   
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "medicamentos.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>


</asp:Content>
