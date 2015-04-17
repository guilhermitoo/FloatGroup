<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="procedimentos.aspx.cs" Inherits="FrontEnd.procedimentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
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
                        <div class="form-group">
                            <label>
                                Descrição completa do procedimento
                            </label>
                            <input class="form-control" />
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
            <form role="form">
                <div class="form-group">
                    <button type="submit" class="btn btn-info">
                        Salvar
                    </button>
                    <button type="submit" class="btn btn-success">
                        Limpar
                    </button>
                    <button type="submit" class="btn btn-warning">
                        Sair
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!-- /. PAGE ROW -->
    <!-- /. PAGE INNER -->

</asp:Content>
