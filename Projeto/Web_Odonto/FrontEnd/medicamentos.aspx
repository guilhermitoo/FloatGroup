<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="medicamentos.aspx.cs" Inherits="FrontEnd.medicamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>
        CADASTRO MEDICAMENTO
    </h2>
    <h5>
        Faça cadastro de Medicamentos
    </h5>
                
    <hr />
    <div class="col-md-12">
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">                        
                        <div class="form-group">
                            <br />
                            <label>
                                Nome do Medicamento
                            </label>
                            <asp:TextBox CssClass="form-control" id="txtNome" runat="server"/>
                            <br />
                            <label>
                                Tarja
                            </label>
                            <asp:TextBox  class="form-control" id="txtTarja" runat="server"/>
                            <br />
                            <label>
                                Classe Terapêutica
                            </label>
                            <asp:TextBox  class="form-control" id="txtClasseTerapeutica" runat="server"/>
                            <br />
                            <label>
                                Unidade
                            </label>
                            <asp:TextBox  class="form-control" id="txtUnidade" runat="server"/>
                            <br />
                            <label for="descricao">
                                Posologia:
                            </label>                                
                            <textarea class="form-control" rows="5" id="txtPosologia" runat="server">
                            </textarea>
                            <br />                          
                        </div>                        
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
                <asp:Button ID="btnListar" runat="server" Text="Listar" CssClass="btn btn-primary" OnClick="btnListar_Click" />
                <asp:Button ID="btnLimpar" runat="server" Text="Limpar" CssClass="btn btn-success" OnClick="btnLimpar_Click" />
                <asp:Button ID="btnSair" runat="server" Text="Sair" CssClass="btn btn-warning" OnClick="btnSair_Click" />
            </div>
            
        </div>
    </div>
    <!-- /. PAGE ROW -->
    <!-- /. PAGE INNER -->
</asp:Content>
