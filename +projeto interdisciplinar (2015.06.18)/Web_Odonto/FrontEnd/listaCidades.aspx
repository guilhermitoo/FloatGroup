<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaCidades.aspx.cs" Inherits="FrontEnd.listaCidades" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <h1><asp:Literal ID="lt01" Text="<%$ resources: titulo %>" runat="server"/></h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtNomeCidade" runat="server" CssClass="form-control" placeholder="Digite o nome da cidade que deseja buscar" ToolTip="Nome da Cidade" meta:resourcekey="txtNomeCidadeResource1" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscarCidade" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscarCidade_Click" meta:resourcekey="btnBuscarCidadeResource1"/>
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource1" />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rlistaCidades" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th><asp:Literal ID="lt02" Text="<%$ resources: id %>" runat="server"/></th>
                    <th><asp:Literal ID="lt03" Text="<%$ resources: nome %>" runat="server"/></th>
                    <th><asp:Literal ID="lt04" Text="<%$ resources: uf %>" runat="server"/></th>                        
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"nome") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"uf") %></td>                    
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "id", "cidades.aspx?ID={0}") %>' meta:resourcekey="btnEditarResource1">Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>



</asp:Content>
