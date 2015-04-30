﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="convenios.aspx.cs" Inherits="FrontEnd.convenios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h2>
        CADASTRO CONVÊNIO
    </h2>
    <h5>
        Faça cadastro de Convênio
    </h5>
                        
<hr />
<div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-body">
            <div class="row">
                <!--Lado Esquerdo do Formulário -->
                <div class="col-md-6">                                            
                    <div class="form-group">
                        <label>
                            CNPJ
                        </label>
                        <div class="input-group">
                                                    
                            <asp:TextBox CssClass="form-control" placeholder="Digite a CNPJ" ID="txtCNPJ" runat="server"></asp:TextBox>
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    Procurar
                                </button>
                            </span>
                        </div>
                        <br />
                        <label>
                            Razão Social
                        </label>
                        <asp:TextBox ID="txtRazao" CssClass="form-control" runat="server"></asp:TextBox>                                                                                               
                        <br />
                        <label>
                            Nome Fantasia
                        </label>                                                
                        <asp:TextBox ID="txtNomeFantasia" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                        <label>
                            IE (Inscrição Estadual)
                        </label>                                                
                        <asp:TextBox ID="txtIe" CssClass="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                               
                </div>
                <!-- row -->
            </div>
            <!-- panel-body -->
        </div>
        <!-- panel panel-default -->
    </div>
    </div>
    <!-- col-md-12 -->
    <!-- Botões -->
    <div class="col-md-offset-3">   
        <div class="form-group">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" />
                <asp:Button ID="btnListar" runat="server" Text="Listar" CssClass="btn btn-primary" OnClick="btnListar_Click" />
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" />
                <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" />
        </div>        
    </div>

<!-- /. PAGE ROW -->
                        


</asp:Content>
