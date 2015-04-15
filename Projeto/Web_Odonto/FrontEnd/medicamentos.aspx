﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="medicamentos.aspx.cs" Inherits="FrontEnd.medicamentos" %>
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
                        <form role="form">
                            <div class="form-group">
                                <br />
                                <label>
                                    Nome do Medicamento
                                </label>
                                <input class="form-control" id="txtNome"/>
                                <br />
                                <label>
                                    Tarja
                                </label>
                                <input class="form-control" id="txtTarja"/>
                                <br />
                                <label>
                                    Classe Terapêutica
                                </label>
                                <input class="form-control" id="txtClasseTerapeutica"/>
                                <br />
                                <label for="descricao">
                                    Posologia:
                                </label>
                                <textarea class="form-control" rows="5" id="txtPosologia">
                                </textarea>
                                <br />
                                <label for="descricao">
                                    *
                                    <small>
                                        Observações:
                                    </small>
                                </label>
                                <textarea class="form-control" rows="5" id="txtObs">
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
            
            <div class="form-group">
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" 
                    CssClass="btn btn-info" OnClick="btnSalvar_Click" />
                                        
                <button type="submit" class="btn btn-success">
                    Limpar
                </button>
                <button type="submit" class="btn btn-warning">
                    Sair
                </button>
            </div>
            
        </div>
    </div>
    <!-- /. PAGE ROW -->
    <!-- /. PAGE INNER -->
</asp:Content>
