<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agendamento.aspx.cs" Inherits="FrontEnd.agendamento" meta:resourcekey="PageResource2" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
                <div class="panel-heading">
                    <div class="col-md-12">
                        <br />
                        <button class="btn btn-primary" type="button" data-toggle="collapse" onclick="ExibeAtend()">
                            <asp:Literal ID="lt00" Text="<%$ resources: atendimento %>" runat="server"/>
                        </button>                                            
                        &nbsp;                                            
                        <button class="btn btn-primary" type="button" data-toggle="collapse" onclick="ExibeAval()">
                            <asp:Literal ID="Literal1" Text="<%$ resources: avaliacao %>" runat="server"/>
                        </button>
                    </div>                                        
                </div>
                <div class="panel-body">
                    <br />
                    <h2><label id="lbTitulo"></label></h2>
                    <hr />
                    <div class="col-md-4">
                        <asp:Label ID="lblDentista" Text="Dentista" runat="server" meta:resourcekey="lblDentistaResource2"/>
                        <asp:DropDownList ID="ddDentista" runat="server" CssClass="form-control dropdown-toggle" meta:resourcekey="ddDentistaResource2">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <asp:Literal ID="Literal3" Text="<%$ resources: dtconsulta %>" runat="server"/>
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
                                    <label><asp:Literal ID="Literal2" Text="<%$ resources: paciente %>" runat="server"/></label>                                            
                                    <asp:DropDownList ID="ddPaciente" CssClass="form-control dropdown-toggle" runat="server" meta:resourcekey="ddPacienteResource2">
                                    </asp:DropDownList>                                    
                                </div>                                                                                     
                                <div class="col-md-4">    
                                    <br />                          
                                    <asp:Button ID="btnBuscaTratamento" runat="server" Text="Buscar Tratamento" CssClass="btn btn-primary" OnClick="BuscaTratamento" meta:resourcekey="btnBuscaTratamentoResource2"/>                                    
                                </div>                                                           
                                
                                <div class="col-md-6">
                                    <br />
                                    <asp:Label id="lblNumeroTrat" Text="Numero do Tratamento" runat="server" Visible="False" meta:resourcekey="lblNumeroTratResource2" />
                                    <asp:TextBox id="txtNumeroTratamento" ReadOnly="True" CssClass="form-control" runat="server" Visible="False" meta:resourcekey="txtNumeroTratamentoResource2" />                                    
                                </div>
                                <div class="col-md-6">                                    
                                    <br />
                                    <asp:Label ID="lblStatusTrat" Text="Status do Tratamento" runat="server" Visible="False" meta:resourcekey="lblStatusTratResource2"/>
                                    <asp:TextBox id="txtStatusTratamento" ReadOnly="True" CssClass="form-control" runat="server" Visible="False" meta:resourcekey="txtStatusTratamentoResource2" />
                                </div>                                
                                <br />
                                                       
                                <div class="col-lg-12">  
                                    <br />                                                                                                        
                                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped" 
                                        GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Código_Procedimento" meta:resourcekey="gvItensAtendimentoResource2">
                                    <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderText="Selecione" meta:resourcekey="TemplateFieldResource7">
                                        <ItemTemplate >
                                            <asp:CheckBox id="cbProc" runat="server" meta:resourcekey="cbProcResource2"/>
                                        </ItemTemplate>                              

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="ID"  HeaderStyle-Width="35" meta:resourcekey="TemplateFieldResource8">
                                        <ItemTemplate>
                                            <%#Eval("Código_Procedimento") %>
                                        </ItemTemplate>

<HeaderStyle Width="35px"></HeaderStyle>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Descrição Procedimento" meta:resourcekey="TemplateFieldResource9">
                                        <ItemTemplate>
                                            <%#Eval("Descrição") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Qtd" HeaderStyle-Width="50" meta:resourcekey="TemplateFieldResource10">
                                        <ItemTemplate>
                                            <%#Eval("Quantidade") %>
                                        </ItemTemplate>

<HeaderStyle Width="50px"></HeaderStyle>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status" meta:resourcekey="TemplateFieldResource11">
                                        <ItemTemplate>
                                            <%#Eval("Status") %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Valor" meta:resourcekey="TemplateFieldResource12">
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
                                    <asp:Label ID="lblPacienteAv" Text="Paciente" runat="server" meta:resourcekey="lblPacienteAvResource2"/>
                                    <asp:DropDownList ID="ddPacienteAv" runat="server" CssClass="form-control dropdown-toggle" meta:resourcekey="ddPacienteAvResource2">
                                    </asp:DropDownList>                                    
                                    <br />
                                </div>                                               
                            </div>
                        </div>
                    </div>
                </div>
                    <!-- FIM CONTEUDO AVALIAÇÃO-->                                        
                <div class="modal-footer">                                        
                    <asp:Button ID="btnVoltar" runat="server" CssClass="btn btn-warning" Text="Voltar" OnClick="btnVoltar_Click" meta:resourcekey="btnVoltarResource2" />
                    <asp:Button js="btaten" id="btnFinalizaAtendimento" runat="server" CssClass="btn btn-primary" OnClick="btnFinalizaAgendamento_Click" Text="Agendar Atendimento" meta:resourcekey="btnFinalizaAtendimentoResource2" />                                            
                    <asp:Button js="btaval" id="btnFinalizaAgendamento2" runat="server" CssClass="btn btn-primary" OnClick="CadAvaliacao" meta:resourcekey="btnFinalizaAgendamento2Resource2"/>                                        
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

            var lang = navigator.language;
            if (lang == 'en-US') {
                $('#lbTitulo').text('EVALUATION SCHEDULE');
            }
            else {
                $('#lbTitulo').text('AGENDAR AVALIAÇÃO');
            }
        }

        function ExibeAtend() {
            $('#pnlAvaliacao').fadeOut(300);
            $('#pnlAtendimento').delay(300).fadeIn(300);
            $('input[js="btaval"]').hide();
            $('input[js="btaten"]').show();
            
            var lang = navigator.language;
            if (lang == 'en-US') {
                $('#lbTitulo').text('SERVICE SCHEDULE');
            }
            else {
                $('#lbTitulo').text('AGENDAR ATENDIMENTO');
            }

        }

    </script>

</asp:Content>
