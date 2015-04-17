<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h2>AGENDAR</h2>
<h5>
Faça o agendamento de seus atendimentos
</h5>
              
              
<!-- BOTÃO AGENDAR -->
<div class="btn-group" role="group">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Agendar</button>

<!-- ESCOLHA DE DENTISTA-->
<div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    Dentistas
    <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
    <li><a href="#">João</a></li>
    <li><a href="#">Thiago</a></li>
    <li><a href="#">Lucas</a></li>
    <li><a href="#">Pedro</a></li>
    </ul>
<!-- FIM - ESCOLHA DENTISTA-->
                  
<!-- MODO DE EXIBIÇÃO-->
<div class="btn-group" role="group">
    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    Modo de Exibição
    <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" role="menu">
    <li><a href="#">Dia</a></li>
    <li><a href="#">Semanal</a></li>
    <li><a href="#">Mês</a></li>
    <li><a href="#">Ano</a></li>
    </ul>
<!-- FIM - MODO DE EXIBIÇÃO-->

</div></div>

<!-- CONTEUDO BOTÃO AGENDAR-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
aria-hidden="true">
<div class="modal-dialog">
    <div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
        <div class="collapse" id="atendimento">      
            <div class="form-group">
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
            </div>            

                          
            <!-- NUMERO E STATUS-->
            <div class="panel-body">
										<div class="row">
										<label>
											Numero
										</label>
										<input type="text" class="form-control-sm" />
										<label>
											Status
										</label>
										<input type="text" class="form-control-sm" />
										</div>
									</div>
                                                      
                            
            <br />

                         	
                            
            <div class="well">
                <table class="table">
                <thead>
                    <tr>
                    <th>X</th>
                    <th>Nome do Procedimento</th>
                    <th>Qtd</th>
                    <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                    <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                    <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                    <td><input type="checkbox"></td>
                    </tr>
                    <tr>
                    <td><input type="checkbox"></td>
                    </tr>
                </tbody>
                </table>
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
			</div>
						
		<!-- Fechamento das div class="btn-group" role="group" -->
						
						
              
              


              
              <div class="col-md-12">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-6">
                      <form role="form">
                      </form>
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
                            <img src="assets/img/check.png" class="img-responsive" alt="Responsive image">
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
                            <img src="assets/img/pendente2.png" class="img-responsive" alt="Responsive image">
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                
              </div>
            </div>

</asp:Content>
