<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaProcedimentos.aspx.cs" Inherits="FrontEnd.listaProcedimentos" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    <h2><asp:Literal ID="lt01" Text="<%$ resources: titulo %>" runat="server"/></h2>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtDescricaoProcedimento" runat="server" CssClass="form-control" placeholder="Digite a descrição do procedimento que deseja buscar" ToolTip="Descrição do Procedimento" meta:resourcekey="txtDescricaoProcedimentoResource1" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click" meta:resourcekey="btnBuscarResource1"/>
        <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource1" />
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rListaProcedimentos" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th><asp:Literal ID="lt02" Text="<%$ resources: id %>" runat="server"/></th>
                    <th><asp:Literal ID="lt03" Text="<%$ resources: descricao %>" runat="server"/></th>                    
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"Id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"Descricao") %></td>                
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" meta:resourcekey="btnEditarResource1" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Id", "procedimentos.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
