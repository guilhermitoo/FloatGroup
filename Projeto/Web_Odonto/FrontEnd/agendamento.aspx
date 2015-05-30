<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agendamento.aspx.cs" Inherits="FrontEnd.agendamento" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
                <div class="panel-heading">
                    <div class="col-md-12">
                        <br />
                        <button class="btn btn-primary" type="button" data-toggle="collapse" onclick="ExibeAtend()">
                        Atendimento
                        </button>                                            
                        &nbsp;                                            
                        <button class="btn btn-primary" type="button" data-toggle="collapse" onclick="ExibeAval()">
                        Avaliação
                        </button>
                    </div>                                        
                </div>
                <div class="panel-body">
                    
                    <h2><label id="lbTitulo"></label></h2>
                    <hr />
                    <div class="col-md-4">
                        <asp:Label ID="lblDentista" Text="Dentista" runat="server"/>
                        <asp:DropDownList ID="ddDentista" runat="server" CssClass="form-control dropdown-toggle">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <label>Data da Consulta</label>
                        <input class="form-control" id="txtDataConsulta" js="data" onkeyup="formataData(this,event);" runat="server" maxlength="10" />
                        <br />
                    </div>  

                    <br />                                                                              
                    <!-- CONTEUDO ATENDIMENTO-->
                    <div class="collapse col-lg-12" id="pnlAtendimento">
                        <div class="panel panel-default"> 
                            <div class="panel-body" >                                                   
                                <%--<div class="col-md-12"></div> --%>
                                <div class="col-md-8">  
                                    <label>Paciente</label>                                            
                                    <asp:DropDownList ID="ddPaciente" CssClass="form-control dropdown-toggle" runat="server">
                                    </asp:DropDownList>                                    
                                </div>                                                                                     
                                <div class="col-md-4">    
                                    <br />                          
                                    <asp:Button ID="btnBuscaTratamento" runat="server" Text="Buscar Tratamento" CssClass="btn btn-primary" OnClick="BuscaTratamento"/>                                    
                                </div>                                                           
                                
                                <div class="col-md-6">
                                    <br />
                                    <asp:Label id="lblNumeroTrat" Text="Numero do Tratamento" runat="server" Visible="false" />
                                    <asp:TextBox id="txtNumeroTratamento" ReadOnly="true" CssClass="form-control" runat="server" Visible="false" />                                    
                                </div>
                                <div class="col-md-6">                                    
                                    <br />
                                    <asp:Label ID="lblStatusTrat" Text="Status do Tratamento" runat="server" Visible="false"/>
                                    <asp:TextBox id="txtStatusTratamento" ReadOnly="true" CssClass="form-control" runat="server" Visible="false" />
                                </div>                                
                                <br />
                                                       
                                <div class="col-lg-12">  
                                    <br />                                                                                                        
                                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped" 
                                        GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Código_Procedimento">
                                    <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Selecione">
                                        <ItemTemplate >
                                            <asp:CheckBox id="cbProc" runat="server"/>
                                        </ItemTemplate>                              
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID"  HeaderStyle-Width="35">
                                        <ItemTemplate>
                                            <%#Eval("Código_Procedimento") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Descrição Procedimento">
                                        <ItemTemplate>
                                            <%#Eval("Descrição") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qtd" HeaderStyle-Width="50">
                                        <ItemTemplate>
                                            <%#Eval("Quantidade") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <%#Eval("Status") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Valor">
                                        <ItemTemplate>
                                            <%#Eval("Valor") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    </Columns>                            
                                    </asp:GridView>                                 
                                </div>
                                <%--<div class="col-md-6">
                                    <asp:Label ID="lblDentistaAtn" Text="Dentista" runat="server" Visible="false"/>
                                    <asp:DropDownList ID="ddDentistaAtn" CssClass="form-control" 
                                        ToolTip="Selecione o Dentista que irá realizar o atendimento" runat="server" Visible="false">
                                    </asp:DropDownList>                                 
                                </div>--%>
                                </div>    
                            
                        </div>                                                                      
                    </div>                            
                
                    
                    <!-- FIM CONTEUDO ATENDIMENTO -->
                    <!-- CONTEUDO AVALIAÇÃO-->
                    <div class="collapse col-lg-12" id="pnlAvaliacao" >
                        <div class="panel panel-default">
                            <div class="panel-body">                                                               
                                <div class="col-md-12">
                                    <asp:Label ID="lblPacienteAv" Text="Paciente" runat="server"/>
                                    <asp:DropDownList ID="ddPacienteAv" runat="server" CssClass="form-control dropdown-toggle">
                                    </asp:DropDownList>                                    
                                    <br />
                                </div>                                               
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- FIM CONTEUDO AVALIAÇÃO-->                                        
                <div class="modal-footer">                                        
                    <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" />
                    <asp:Button js="btaten" id="btnFinalizaAtendimento" runat="server" CssClass="btn btn-primary" OnClick="btnFinalizaAgendamento_Click" Text="Agendar Atendimento" />                                            
                    <asp:Button js="btaval" id="btnFinalizaAgendamento2" runat="server" CssClass="btn btn-primary" OnClick="CadAvaliacao" Text="Agendar Avaliação"/>                                        
                </div>
                 
    <script type="text/javascript">
        $(document).ready(function () {
            //executa a função quando a página está pronta e carregada                        
            $('input[js="data"]').datetimepicker({
                locale: 'pt-BR',                
            });

            ExibeAtend();
        });

        function ExibeAval() {
            $('#pnlAtendimento').fadeOut(300);
            $('#pnlAvaliacao').delay(300).fadeIn(300);
            $('input[js="btaten"]').hide();
            $('input[js="btaval"]').show();
            $('#lbTitulo').text('AGENDAR AVALIAÇÃO');
        }

        function ExibeAtend() {
            $('#pnlAvaliacao').fadeOut(300);
            $('#pnlAtendimento').delay(300).fadeIn(300);
            $('input[js="btaval"]').hide();
            $('input[js="btaten"]').show();
            $('#lbTitulo').text('AGENDAR ATENDIMENTO');
        }

    </script>

</asp:Content>
