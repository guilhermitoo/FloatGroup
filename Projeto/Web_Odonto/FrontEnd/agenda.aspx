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
        <asp:DropDownList ID="ddDentistas" runat="server" CssClass="form-control">
        </asp:DropDownList>
    </div>
    <!-- MODO DE EXIBIÇÃO-->
    <div class="col-md-2" >
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Agendar</button>
    </div>
    <!-- CONTEUDO BOTÃO AGENDAR-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button id="btnFechar" type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">                    
                    &times;
                    </span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        Agendar
                    </h4>
                </div>
                <div class="modal-body">                    
                    <a class="btn btn-primary" data-toggle="collapse" href="#atendimento" aria-expanded="false" aria-controls="atendimento">
                    Atendimento
                    </a>
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                    Avaliação
                    </button>
                    <!-- CONTEUDO ATENDIMENTO-->
                    <div id="atendimento" class="panel panel-default">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <label>Paciente</label>                            
                                <asp:DropDownList ID="ddPacientes" CssClass="form-control" runat="server">
                                </asp:DropDownList>
                            </div>                                           
                        
                        <!-- NUMERO E STATUS-->
                        
                            <div class="col-md-6">
                                <label>Numero do Tratamento</label>
                                <asp:TextBox id="txtNumeroTratamento" ReadOnly="true" CssClass="form-control" runat="server"/>
                            </div>
                            <div class="col-md-6">
                                <label>Status do Tratamento</label>
                                <asp:TextBox id="txtStatusTratamento" ReadOnly="true" CssClass="form-control" runat="server"/>
                            </div>
                        </div>
                        <div class="panel-footer">                            
                            <div class="well">
                                <asp:Repeater ID="rListaProcedimentos" runat="server">     
                                    <HeaderTemplate>
                                        <table class="table table-hover">
                                            <tr>
                                                <th></th>
                                                <th>Nome</th>
                                                <th>Qtd</th>                        
                                                <th>Status</th>
                                            </tr>                
                                    </HeaderTemplate>

                                    <ItemTemplate>
                                        <tr>
                                            <td><input type="checkbox" runat="server" /></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Nome") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Qtd") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Status") %></td>                    
                                        </tr>
                                    </ItemTemplate>

                                    <FooterTemplate>
                
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                         
                            </div>
                        </div>
                    </div>
                    <!-- FIM CONTEUDO ATENDIMENTO -->
                    <!-- CONTEUDO AVALIAÇÃO-->
                    <div class="collapse" id="collapseExample">
                        <div class="panel panel-default">
                            <div class="panel-body">
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
                            </div>
                        </div>
                    </div>
                    <!-- FIM CONTEUDO AVALIAÇÃO-->
                    <br />
                    <br />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                    Fechar
                    </button>
                    <button type="button" class="btn btn-primary">
                    Finalizar Agendamento
                    </button>
                </div>
            </div>
        </div>
    </div>
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