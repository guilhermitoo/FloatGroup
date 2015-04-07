<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="medicamentos.aspx.cs" Inherits="FrontEnd.medicamentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
    <div id="page-inner">
    <div class="row">
                        <div class="col-md-12">
                            <h2>
                                CADASTRO MEDICAMENTO
                            </h2>
                            <h5>
                                Faça cadastro de Medicamentos
                            </h5>
                        </div>
                        <hr />
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <form role="form">
                                                <div class="form-group">
                                                    <label>
                                                        Código do Medicamento
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                        Nome do Medicamento
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                        Tarja
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                        Classe Terapêutica
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label for="descricao">
                                                        Posologia:
                                                    </label>
                                                    <textarea class="form-control" rows="5" id="comment">
                                                    </textarea>
                                                    <br />
                                                    <label for="descricao">
                                                        *
                                                        <small>
                                                            Observações:
                                                        </small>
                                                    </label>
                                                    <textarea class="form-control" rows="5" id="Textarea1">
                                                    </textarea>
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
        </div>
</asp:Content>
