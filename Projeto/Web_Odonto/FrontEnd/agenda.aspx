<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">    
    
    <h2>AGENDA</h2>
    <h5>
        Selecione o dentista para visualizar sua agenda
    </h5>
    <!-- ESCOLHA DE DENTISTA-->
    <div class="col-md-5">
        <asp:Label ID="lblDentistas" Text="Dentistas" runat="server"/>
        <asp:DropDownList ID="ddDentistas" runat="server" CssClass="form-control dropdown-toggle">
        </asp:DropDownList>
    </div>
    <!-- MODO DE EXIBIÇÃO-->
<%--    <div class="col-md-2">
        
        <asp:Label ID="lblModo" Text="Modo de Exibição" runat="server"/>
        <asp:DropDownList ID="ddModoExibicao" runat="server" CssClass="form-control">
            <asp:ListItem Text="Diário" Value="D" />
            <asp:ListItem Text="Semanal" Value="S"/>
            <asp:ListItem Text="Mensal" Value="M"/>
            <asp:ListItem Text="Anal" Value="A" />
        </asp:DropDownList>
        
    </div>--%>
    <!-- BOTÃO AGENDAR -->
    <div class="col-md-4"> 
        <br />        
        <asp:Button CssClass="btn btn-success" id="btnCarregaAgenda" Text="Carregar Agenda" 
                    runat="server" ToolTip="Carrega a agenda do dentista selecionado" OnClick="btnCarregaAgenda_Click"/>
         
        <asp:Button CssClass="btn btn-primary" id="btnAgendar" Text="Agendar" runat="server" 
            ToolTip="Abre a tela de agendamento, para agendar um atendimento ou avaliação" OnClick="btnAgendar_Click" />        
    </div>
    <br />
    <!-- Fechamento das div class="btn-group" role="group" -->     
    <div class="col-md-12">
        <br /><br />
        <%--<div class="panel-body">
            <div class="row">
                <div class="col-md-6">                    
                </div>
            </div>
        </div>--%>
        <div class="panel panel-default">             
            <div class="panel-heading clearfix">
                <div class="form-group">
                    <div class="col-md-3">
                        <div class="input-group">                                            
                            <div runat="server" class="input-group-addon btn" id="btnAnterior" onclick="DiaAnterior()"><i class="fa fa-chevron-left"></i></div>
                            <input runat="server" id="txtData" onkeyup="formataData(this,event);"  onblur="Post()"
                                    maxlength="10" class="dt form-control" type="text" />
                            <div runat="server" class="input-group-addon btn" id="btnPosterior" onclick="DiaPosterior()"><i class="fa fa-chevron-right"></i></div>                                            
                        </div>
                    </div>                                
                    <div class="col-sm-6 text-center">
                        <h5><asp:Label ID="txtTexto" runat="server" class="text-center"/></h5>
                    </div>
                </div>
            </div>
                        
            <div class="panel-body">
            <% if (gvAgenda.Rows.Count > 0) { %>
                <asp:GridView runat="server" ID="gvAgenda" CssClass="table table-bordered table-striped" 
                    GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id,tipo" OnRowCommand="gvAgenda_RowCommand" OnRowDataBound="gvAgenda_RowDataBound">
                <Columns>                                
                <asp:TemplateField HeaderText="Tipo"  HeaderStyle-Width="20">
                    <ItemTemplate>
                        <%#Eval("tipo") %>
                    </ItemTemplate>
                </asp:TemplateField>                                    
                <asp:TemplateField HeaderText="Horário" HeaderStyle-Width="20">
                    <ItemTemplate>
                        <%# DateTime.Parse(Eval("data").ToString()).ToShortTimeString() %>
                    </ItemTemplate>
                </asp:TemplateField>                                
                    <asp:TemplateField HeaderText="Nome do Paciente" >
                    <ItemTemplate>
                        <%#Eval("nomePaciente") %>
                    </ItemTemplate>
                </asp:TemplateField>                                  
                <asp:ButtonField CommandName="Confirmar" HeaderStyle-Width="20" >
                    <ControlStyle CssClass="btn btn-xs btn-primary fa fa-check" />                                    
                </asp:ButtonField>
                <asp:ButtonField CommandName="Adiar" HeaderStyle-Width="20" >
                    <ControlStyle CssClass="btn btn-xs btn-danger fa fa-times"  />                                    
                </asp:ButtonField>
                </Columns>                            
                </asp:GridView>                                 
            <%} else { %>
            <h4 style="text-align: center">Nada agendado.</h4>
            <%} %>
            </div>                                                                                
        </div>
    </div>     
    <script type="text/javascript">
        $(document).ready(function () {

            //$('.dt').datepicker({
            //    format: "dd/mm/yyyy",
            //    lang: 'pt-BR',
            //    calendarWeeks: true,
            //    todayHighlight: true
            //});
            
        });        

        function DiaPosterior() {            
            __doPostBack('btnPosterior', 'posterior');
        }

        function DiaAnterior() {
            __doPostBack('btnAnterior', 'anterior');
        }

        function Post() {
            __doPostBack('agenda', '');
        };

        //$('.dt').on('        
    </script>
    <style type="text/css">
        .rdius {
            border-radius: 50%!important;
        }
    </style>
</asp:Content>
