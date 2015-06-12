<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="agenda.aspx.cs" Inherits="FrontEnd.agenda" 
meta:resourcekey="PageResource1" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">    
    
    <h2><asp:Literal ID="lt01" Text="<%$ resources: titulo %>" runat="server"/></h2>
    <h5>
        <asp:Literal ID="Literal1" Text="<%$ resources: subtitulo %>" runat="server"/>
    </h5>
    <!-- ESCOLHA DE DENTISTA-->
    <div class="col-md-5">
        <asp:Label ID="lblDentistas" Text="Dentistas" runat="server" meta:resourcekey="lblDentistasResource1"/>
        <asp:DropDownList ID="ddDentistas" runat="server" CssClass="form-control dropdown-toggle" meta:resourcekey="ddDentistasResource1">
        </asp:DropDownList>
    </div>
    <!-- BOTÃO AGENDAR -->
    <div class="col-md-4"> 
        <br />        
        <asp:Button CssClass="btn btn-success" id="btnCarregaAgenda" Text="Carregar Agenda" 
                    runat="server" ToolTip="Carrega a agenda do dentista selecionado" OnClick="btnCarregaAgenda_Click" meta:resourcekey="btnCarregaAgendaResource1"/>
         
        <asp:Button CssClass="btn btn-primary" id="btnAgendar" Text="Agendar" runat="server" 
            ToolTip="Abre a tela de agendamento, para agendar um atendimento ou avaliação" OnClick="btnAgendar_Click" meta:resourcekey="btnAgendarResource1" />        
    </div>
    <br />
    <div class="col-md-12">
        <br /><br />
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
                        <h5><asp:Label ID="txtTexto" runat="server" class="text-center" meta:resourcekey="txtTextoResource1"/></h5>
                    </div>
                </div>
            </div>
                        
            <div class="panel-body">
            <% if (gvAgenda.Rows.Count > 0) { %>
                <asp:GridView runat="server" ID="gvAgenda" CssClass="table table-bordered" 
                    GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id,tipo" OnRowCommand="gvAgenda_RowCommand" 
                        OnRowDataBound="gvAgenda_RowDataBound" meta:resourcekey="gvAgendaResource1">
                <Columns>                                
                <asp:TemplateField HeaderText="Tipo"  HeaderStyle-Width="20" meta:resourcekey="TemplateFieldResource1">
                    <ItemTemplate>
                        <%#Eval("tipo") %>
                    </ItemTemplate>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </asp:TemplateField>                                    
                <asp:TemplateField HeaderText="Horário" HeaderStyle-Width="20" meta:resourcekey="TemplateFieldResource2">
                    <ItemTemplate>
                        <%# DateTime.Parse(Eval("data").ToString()).ToShortTimeString() %>
                    </ItemTemplate>
                    <HeaderStyle Width="20px"></HeaderStyle>
                </asp:TemplateField>                                
                    <asp:TemplateField HeaderText="Nome do Paciente" meta:resourcekey="TemplateFieldResource3" >
                    <ItemTemplate>
                        <%#Eval("nomePaciente") %>
                    </ItemTemplate>
                </asp:TemplateField>                                  
                <asp:ButtonField CommandName="Abrir" HeaderStyle-Width="40" Text="Abrir Registro" meta:resourcekey="ButtonFieldResource1">
                    <ControlStyle CssClass="btn btn-xs btn-default"/>                                    
                <HeaderStyle Width="40px"></HeaderStyle>
                </asp:ButtonField>
                </Columns>                            
                </asp:GridView>                                 
            <%} else { %>
            <h4 style="text-align: center"><asp:Literal ID="Literal2" Text="<%$ resources: nada %>" runat="server"/></h4>
            <%} %>
            </div>                                                                                
        </div>
    </div>  
       
    <div class="col-md-3">
        <div class="panel panel-default">
	        <div class="panel-heading"><asp:Literal ID="Literal7" Text="<%$ resources: legenda %>" runat="server"/></div>
	            <div class="panel-body">
	                <div class="table-responsive">
		                <table class="table table-condensed">								
		                <tbody>
			                <tr>
				                <th class="qverd"> </th>
				                <td><asp:Literal ID="Literal3" Text="<%$ resources: concluido %>" runat="server"/></td>
			                </tr>
									  
			                <tr>
				                <th class="qverm"> </th>
				                <td><asp:Literal ID="Literal4" Text="<%$ resources: cancelado %>" runat="server"/></td>
			                </tr>
									  
			                <tr>
				                <th class="qama"> </th>
				                <td><asp:Literal ID="Literal5" Text="<%$ resources: atrasado %>" runat="server"/></td>
			                </tr>
									  
			                <tr>
				                <th class="qbran"> </th>
				                <td><asp:Literal ID="Literal6" Text="<%$ resources: pendente %>" runat="server"/></td>	
			                </tr>
		                </tbody>
		            </table>
	            </div>
	        </div>
        </div>    
    </div>

    	<style>
	.qbran { 
	width: 15px; 
	height: 15px;  
	background: #eee; 
	}
	.qverm { 
	width: 15px; 
	height: 15px;  
	background: #f00; 
	}
	.qama { 
	width: 15px; 
	height: 15px;  
	background: #DAD018; 
	}
	.qverd { 
	width: 15px; 
	height: 15px;  
	background: #9BCD9B; 
	}
	</style>


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
