<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="atendimento.aspx.cs" Inherits="FrontEnd.atendimento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>
    Pagina de Atendimento
    </h2>
    <h5>
    Inicie seus tratamentos
    </h5>
    <div class="col-md-12">
    <div class="panel panel-default">
        <div class="panel-body">
        <div class="row">
            <div class="col-md-6">            
                <div class="form-group">
                <label>
                    Data Avaliação
                </label>
                <input type="text" class="form-control" id="datepicker" />

                            
                <br />
                <label>
                    Paciente
                </label>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Digite a sua busca"
                    />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        Busca
                    </button>
                    </span>
                </div>
                <br />
                <label>
                    Dentista
                </label>
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Digite a sua busca"
                    />
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        Busca
                    </button>
                    </span>
                </div>
                <br />
                <button type="submit" class="btn btn-info">
                    Iniciar Tratamento
                </button>
                </div>
            
            </div>
        </div>
        </div>
    </div>
    </div>
    <div class="col-md-12">
    <div class="panel panel-default">
        <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>
                Procedimento
                </th>
                <th>
                QtdID
                </th>
                <th>
                Valor
                </th>
                <th>
                Status
                </th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>
                Limpeza
                </td>
                <td>
                1
                </td>
                <td>
                R$100,00
                </td>
                <td>
                Pendente
                </td>
                <td>
                <img src="assets/img/lixo.png" class="img-responsive" alt="Responsive image">
                </td>
            </tr>
            <tr>
                <td>
                ---
                </td>
                <td>
                ---
                </td>
                <td>
                ---
                </td>
                <td>
                ---
                </td>
                <td>
                <img src="assets/img/novo.png" class="img-responsive" alt="Responsive image"/>
                </td>
            </tr>
            </tbody>
        </table>
        </div>
    </div>
    </div>
    <div class="col-md-offset-4">
    
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
    
    </div>
<!-- /. ROW -->
<hr />


</asp:Content>
