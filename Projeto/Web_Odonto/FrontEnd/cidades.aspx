<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="cidades.aspx.cs" Inherits="FrontEnd.cidades" %>
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
                                Faça cadastro de Cidade/Estado
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
                                                       Cidade
                                                    </label>
                                                    <input class="form-control" />
                                                    <br />
                                                    <label>
                                                       Estado
                                                    </label>
                                                    <input class="form-control" />
                                                    </div>
                                                </form>
                                                </div>
                                        </div>
                                    </div>
                                </div>
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
        </div>
        </div>
        </div>

</asp:Content>
