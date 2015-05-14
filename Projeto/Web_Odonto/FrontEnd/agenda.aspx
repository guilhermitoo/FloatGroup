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
                    <button class="btn btn-primary" type="button" data-toggle="collapse" aria-expanded="false" onclick="ExibeAtend()">
                    Atendimento
                    </button>                                                                  
                    <button class="btn btn-primary" type="button" data-toggle="collapse" aria-expanded="false" onclick="ExibeAval()">
                    Avaliação
                    </button>                    
                    <!-- CONTEUDO ATENDIMENTO-->
                    <div class="collapse" id="pnlAtendimento">
                        <div class="panel panel-default"> 
                            <div class="panel-body">                                                   
                                <div class="col-md-12"><label>Paciente</label></div>
                                <div class="col-md-8">                                              
                                    <asp:DropDownList ID="ddPaciente" CssClass="form-control" runat="server">
                                    </asp:DropDownList>                                    
                                </div>                 
                                <div class="col-md-4">     
                         
                                    <asp:Button ID="btnBuscaTratamento" runat="server" Text="Buscar Tratamento" CssClass="btn btn-primary" OnClick="BuscaTratamento"/>
                                    <br />
                                </div>                                                                                              
                                <div class="col-md-6">
                                    <label>Numero do Tratamento</label>
                                    <asp:TextBox id="txtNumeroTratamento" ReadOnly="true" CssClass="form-control" runat="server"/>                                    
                                </div>
                                <div class="col-md-6">
                                    <label>Status do Tratamento</label>
                                    <asp:TextBox id="txtStatusTratamento" ReadOnly="true" CssClass="form-control" runat="server"/>                                    
                                </div>
                                <br />
                            </div>
                                <div class="panel-footer">
                                    <%--<asp:Repeater ID="rListaProcedimentos" runat="server">     
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
                                    </asp:Repeater>  --%>                                       
                                    <asp:GridView runat="server" ID="gvItensAtendimento">
                                    <Columns>
                  
                                    </Columns>
                                    </asp:GridView>                                           
                             </div>                            
                        </div>
                    </div>
                    <!-- FIM CONTEUDO ATENDIMENTO -->
                    <!-- CONTEUDO AVALIAÇÃO-->
                    <div class="collapse" id="pnlAvaliacao" >
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <label>
                                    Data Avaliação
                                    </label>
                                    <input class="form-control" id="txtDataAval" js="data" onkeyup="formataData(this,event);" runat="server" maxlength="10" />
                                    <br />
                                </div>                                
                                <div class="col-md-12">
                                    <asp:Label ID="lblPacienteAv" Text="Paciente" runat="server"/>
                                    <asp:DropDownList ID="ddPacienteAv" runat="server" CssClass="form-control dropdown-toggle">
                                    </asp:DropDownList>
                                    <br />
                                </div>                                
                                <div class="col-md-12">
                                    <asp:Label ID="lblDentistaAv" Text="Dentista" runat="server"/>
                                    <asp:DropDownList ID="ddDentistaAv" runat="server" CssClass="form-control dropdown-toggle">
                                    </asp:DropDownList>
                                    <br />
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
                    <asp:Button js="btaten" id="btnFinalizaAgendamento" runat="server" CssClass="btn btn-primary" OnClick="btnFinalizaAgendamento_Click" Text="Finalizar Agendamento" />                                            
                    <asp:Button js="btaval" id="btnFinalizaAgendamento2" runat="server" CssClass="btn btn-primary" OnClick="CadAvaliacao" Text="Finalizar Agendamento"/>                        
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

    <script type="text/javascript"> 

        $(document).ready(function () {
             //executa a função quando a página está pronta e carregada            
            $('input[js="data"]').datepicker({
                format: "dd/mm/yyyy",
                language: "pt-BR",
                calendarWeeks: true,
                todayHighlight: true,                               
            });

            ExibeAtend();
        });

        function ExibeAval() {
            $('#pnlAtendimento').fadeOut(300);
            $('#pnlAvaliacao').delay(300).fadeIn(300);
            $('button[js="btaten"]').hide();
            $('button[js="btaval"]').show();
        }

        function ExibeAtend() {
            $('#pnlAvaliacao').fadeOut(300);
            $('#pnlAtendimento').delay(300).fadeIn(300);
            $('input[js="btaten"]').show();
            $('input[js="btaval"]').hide();
        }

        function Busca() {
            //$ajax({
            //    url: 'agenda.aspx/BuscaTratamento',
            //    type: 'POST',
            //    success: function (retorno) {
            //        alert("deu certo");
            //    }
            //});
            PageMethods.BuscaTratamento();
        }
    </script>
</asp:Content>