<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">    
    
    <h2>AGENDA</h2>
    <h5>
        Faça o agendamento de seus atendimentos
    </h5>
    <!-- ESCOLHA DE DENTISTA-->
    <div class="col-md-4">
        <asp:Label ID="lblDentistas" Text="Dentistas" runat="server"/>
        <asp:DropDownList ID="ddDentistas" runat="server" CssClass="form-control dropdown-toggle">
        </asp:DropDownList>
    </div>
    <!-- MODO DE EXIBIÇÃO-->
    <div class="col-md-2">
        <asp:Label ID="lblModo" Text="Modo de Exibição" runat="server"/>
        <asp:DropDownList ID="ddModoExibicao" runat="server" CssClass="form-control">
            <asp:ListItem Text="Diário" Value="D" />
            <asp:ListItem Text="Semanal" Value="S"/>
            <asp:ListItem Text="Mensal" Value="M"/>
            <asp:ListItem Text="Anal" Value="A" />
        </asp:DropDownList>
    </div>
    <!-- BOTÃO AGENDAR -->
    <div class="col-md-1">
        <br />
        <asp:Button CssClass="btn btn-primary" id="btnAgendar" Text="Agendar" runat="server" OnClick="btnAgendar_Click" />
    </div>
    <!-- CONTEUDO BOTÃO AGENDAR-->    
    <!-- FIM CONTEUDO AGENDAR-->    
    <!-- Fechamento das div class="btn-group" role="group" -->
    <div class="col-md-12">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">                    
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>
                                Paciente
                            </th>
                            <th>
                                Motivo
                            </th>
                            <th>
                                Hora
                            </th>
                            <th>
                                Status
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                Claudia
                            </td>
                            <td>
                                Avaliação
                            </td>
                            <td>
                                10:00
                            </td>
                            <td>
                                Concluido
                            </td>
                            <td>
                                <img src="assets/img/check.png" class="img-responsive" alt="Responsive image" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Danilo
                            </td>
                            <td>
                                Consulta
                            </td>
                            <td>
                                11:00
                            </td>
                            <td>
                                Pendente
                            </td>
                            <td>
                                <img src="assets/img/pendente2.png" class="img-responsive" alt="Responsive image" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>      

    
</asp:Content>