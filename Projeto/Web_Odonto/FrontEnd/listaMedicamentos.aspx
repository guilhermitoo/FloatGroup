<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaMedicamentos.aspx.cs" Inherits="FrontEnd.listaMedicamentos" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h1><asp:Literal ID="lt01" Text="<%$ resources: titulo %>" runat="server"/></h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNomeMedicamento" runat="server" CssClass="form-control" placeholder="Digite o nome do medicamento que deseja buscar" ToolTip="Nome da Medicamento" meta:resourcekey="txtNomeMedicamentoResource1" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" meta:resourcekey="btnBuscarResource1"/>
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource1" />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rlistaMedicamentos" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th><asp:Literal ID="lt02" Text="<%$ resources: id %>" runat="server"/></th>
                    <th><asp:Literal ID="lt03" Text="<%$ resources: nome %>" runat="server"/></th>
                    <th><asp:Literal ID="lt04" Text="<%$ resources: classe %>" runat="server"/></th>                        
                    <th><asp:Literal ID="lt05" Text="<%$ resources: tarja %>" runat="server"/></th>
                    <th><asp:Literal ID="lt06" Text="<%$ resources: unidade %>" runat="server"/></th>
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
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "medicamentos.aspx?ID={0}") %>' meta:resourcekey="btnEditarResource1">Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>


</asp:Content>
