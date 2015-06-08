<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="procedimentosDentistaPeriodo.aspx.cs" Inherits="FrontEnd.procedimentosDentistaPeriodo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <div class="panel-heading">
        <h2><label id="lbTitulo"><asp:Literal ID="lt00" Text="Relatório de Procedimentos Realizados por Período" runat="server"/></label></h2>                  
        <input type="hidden" class="prog" runat="server" id="bd" value="0"/>                                                                                                                        
    </div>        
    
    <asp:Panel runat="server" ID="pnlRelatorio">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">                                                                                   
                    <div class="col-md-2">
                        <asp:Label id="lbIni" runat="server" Text="Período de"/>
                        <input type="text" runat="server" id="txtDatIni" class="form-control"/>                        
                    </div>                
                    <div class="col-md-2">
                        <asp:Label id="Label1" runat="server" Text="até"/>
                        <input type="text" runat="server" id="txtDatFin" class="form-control" />                        
                    </div>
                    <div class="col-md-2">    
                        <br />                          
                        <asp:Button ID="btnGerar" runat="server" Text="Gerar Relatório" CssClass="btn btn-primary" OnClick="btnGerar_Click" />                                    
                    </div>        
                </div>
            </div>
            <asp:GridView ID="gvRelatorio" runat="server" AllowPaging="true">            
            </asp:GridView>
        </div>      
    </asp:Panel>
</asp:Content>
