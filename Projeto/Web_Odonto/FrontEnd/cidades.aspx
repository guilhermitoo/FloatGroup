<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="cidades.aspx.cs" Inherits="FrontEnd.cidades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page-wrapper">
    <div id="page-inner">
    <div class="row">
                        <div class="col-md-12">
                            <h2>
                                CADASTRO DE CIDADE
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
                                                        <asp:TextBox ID="txtNome" runat="server" CssClass="form-control" 
                                                            placeholder="Digite o nome da cidade" ToolTip="Nome da Cidade">
                                                        </asp:TextBox>
                                                    <br />
                                                    <label>
                                                       Estado
                                                    </label>     
                                                        <asp:DropDownList ID="ddUF" runat="server" ToolTip="Selecione o estado">
                                                            <asp:ListItem>SP</asp:ListItem>
                                                            <asp:ListItem>MG</asp:ListItem>
                                                    </asp:DropDownList>
                                                    </div>
                                                </form>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            <!-- Botões -->
                            <div class="col-md-offset-3">
                               
                                    <div class="form-group">
                                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" CssClass="btn btn-info" OnClick="btnSalvar_Click" />
                                        <button type="submit" class="btn btn-success">
                                            Limpar</button>
                                        <button type="submit" class="btn btn-warning">
                                            Sair</button>
                                    </div>
                           
                            </div>                                                                      
                            </div>
        </div>
        </div>
        </div>

</asp:Content>
