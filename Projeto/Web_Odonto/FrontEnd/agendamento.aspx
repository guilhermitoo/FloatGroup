<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agendamento.aspx.cs" Inherits="FrontEnd.agendamento" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <div>
                <div class="modal-header">
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
                                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-hover">
                                    <Columns>
                                    <asp:TemplateField>                                        
                                    </asp:TemplateField>
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
                    <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" />
                    <asp:Button js="btaten" id="btnFinalizaAtendimento" runat="server" CssClass="btn btn-primary" OnClick="btnFinalizaAgendamento_Click" Text="Agendar Atendimento" />                                            
                    <asp:Button js="btaval" id="btnFinalizaAgendamento2" runat="server" CssClass="btn btn-primary" OnClick="CadAvaliacao" Text="Agendar Avaliação"/>                        
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
            $('input[js="btaten"]').hide();
            $('input[js="btaval"]').show();
        }

        function ExibeAtend() {
            $('#pnlAvaliacao').fadeOut(300);
            $('#pnlAtendimento').delay(300).fadeIn(300);
            $('input[js="btaval"]').hide();
            $('input[js="btaten"]').show();
        }

    </script>

</asp:Content>
