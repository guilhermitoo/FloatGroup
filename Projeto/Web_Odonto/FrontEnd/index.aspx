<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="FrontEnd.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h2>
        Bom dia
        <i>
            "Nome do Usuário"
        </i>
    </h2>
    <h5>
        Fique atento as notificações.
    </h5>
                        
    <hr />
    <!-- FORMULÁRIO PARA PROCURAR USUÁRIO E OUTRAS AÇÕES -->
    <div class="col-md-9">
    <div class="col-md-offset-4">
        <form role="form">
            <div class="form-group">
                <br />
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Digite a sua busca">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            Procurar
                        </button>
                    </span>
                    <div class="col-md-1">
                        <a href="agenda.html">
            <button type="submit" class="btn btn-primary"> Cadastrar Usuário</button>
        </a>
                    </div>
                </div>
                <br />
                <!-- BOTÕES QUE LEVA A PÁGINA CADASTRAR -->
            </div>
        </form>
    </div>
    </div>
    <!-- /. PAGE INNER -->
</asp:Content>
