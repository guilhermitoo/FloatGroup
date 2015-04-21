﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="listaProcedimentos.aspx.cs" Inherits="FrontEnd.listaProcedimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Procedimentos </h1>
    <br />  
    <br />        
    <div class="col-md-5">
        <asp:TextBox ID="txtDescricaoProcedimento" runat="server" CssClass="form-control" placeholder="Digite a descrição do procedimento que deseja buscar" ToolTip="Descrição do Procedimento" ></asp:TextBox>    
    </div>
    <div class="col-md-2">
        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-primary" Text="Buscar" OnClick="btnBuscar_Click"/>
        <asp:Button ID="tbnSair" runat="server" CssClass="btn btn-danger" Text="Sair" OnClick="tbnSair_Click"/>
    </div>
    <br />
    <br />
    <br />
    <asp:Repeater ID="rListaProcedimentos" runat="server">     
        <HeaderTemplate>
            <table class="table table-hover">
                <tr>
                    <th>ID</th>
                    <th>Descrição</th>                    
                </tr>                
        </HeaderTemplate>

        <ItemTemplate>
            <tr>
                <td><%# DataBinder.Eval(Container.DataItem,"Id") %></td>
                <td><%# DataBinder.Eval(Container.DataItem,"Descricao") %></td>                
                <td>            
                    <asp:HyperLink ID="btnEditar" runat="server" CssClass="btn btn-info" 
                            NavigateUrl='<%# DataBinder.Eval(Container.DataItem, "Id", "procedimentos.aspx?ID={0}") %>'>Editar</asp:HyperLink>
                </td>
            </tr>
        </ItemTemplate>

        <FooterTemplate>
                
            </table>
        </FooterTemplate>
    </asp:Repeater>

</asp:Content>
