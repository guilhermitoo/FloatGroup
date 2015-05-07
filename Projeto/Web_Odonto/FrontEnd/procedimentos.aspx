<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="procedimentos.aspx.cs" Inherits="FrontEnd.procedimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <h2>
        CADASTRO PROCEDIMENTO
    </h2>
    <h5>
        Faça cadastro de Procedimento
    </h5>
                        
    <hr />
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <!--Lado Esquerdo do Formulário -->
                    <div class="col-md-6">                                                
                        <label>
                            Descrição completa do procedimento
                        </label>
                        <asp:TextBox id="txtDescricao" runat="server" CssClass="form-control" />
                        <br /> 
                        </div>                                        
                    <!-- row -->
                </div>
                <!-- panel-body -->
            </div>
            <!-- panel panel-default -->
        </div>
        <!-- col-md-12 -->
        <!-- Botões -->
        <div class="col-md-offset-3">            
            <div class="form-group">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" />
                <asp:Button ID="btnListar" runat="server" Text="Consultar" CssClass="btn btn-primary" OnClick="btnListar_Click" />
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" />
                <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" />
            </div>            
        </div>
    </div>
    <!-- /. PAGE ROW -->
    <!-- /. PAGE INNER -->

</asp:Content>
