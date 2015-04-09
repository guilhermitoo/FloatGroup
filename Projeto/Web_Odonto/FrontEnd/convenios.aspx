<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="convenios.aspx.cs" Inherits="FrontEnd.convenios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">
                <div id="page-inner">
                    <div class="row">
                        <div class="col-md-12">
                            <h2>
                                CADASTRO CONVÊNIO
                            </h2>
                            <h5>
                                Faça cadastro de Convênio
                            </h5>
                        </div>
                        <hr />
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <!--Lado Esquerdo do Formulário -->
                                        <div class="col-md-6">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label>
                                                        CNPJ
                                                    </label>
                                                    <div class="input-group">
                                                        <input type="text" class="form-control" placeholder="Digite a CNPJ">
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
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                        Nome Fantasia
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                        IE (Inscrição Estadual)
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                </div>
                                            </form>
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
                    </div>
                    <!-- /. PAGE WRAPPER -->
                </div>
                <!-- /. WRAPPER -->
            </div>

</asp:Content>
