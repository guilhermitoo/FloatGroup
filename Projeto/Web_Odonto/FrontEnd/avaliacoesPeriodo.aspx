﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="avaliacoesPeriodo.aspx.cs" Inherits="FrontEnd.avaliacoesPeriodo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    <asp:Panel runat="server" ID="pnlRelatorio">
        <div class="panel-heading">
            <h2><label id="lbTitulo"><asp:Literal ID="lt00" Text="Relatório de Avaliações Realizadas por Período" runat="server"/></label></h2>                  
            <input type="hidden" class="prog" runat="server" id="bd" value="0"/>                                                                                                                        
        </div>        
                
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">                                                                                   
                    <div class="col-md-2">
                        <asp:Label id="lbIni" runat="server" Text="Período de"/>
                        <input type="text" runat="server" id="txtDatIni" class="form-control" onkeyup="formataData(this,event);" maxlength="10"/>                        
                    </div>                
                    <div class="col-md-2">
                        <asp:Label id="Label1" runat="server" Text="até"/>
                        <input type="text" runat="server" id="txtDatFin" class="form-control" onkeyup="formataData(this,event);" maxlength="10"/>                        
                    </div>
                    <div class="col-md-2">    
                        <br />                          
                        <asp:Button ID="btnGerar" runat="server" Text="Gerar Relatório" CssClass="btn btn-primary" OnClick="btnGerar_Click" />                                    
                    </div>        
                </div>
            </div>

            <asp:GridView ID="gvRelatorio" runat="server" AllowPaging="true" CssClass="table table-bordered table-striped" 
                    DataKeyNames="ID" AutoGenerateColumns="false">            
                <Columns>                    
                    <asp:TemplateField HeaderText="Código da Avaliação">                    
                        <ItemTemplate>
                            <%#Eval("id") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Paciente">                    
                        <ItemTemplate>
                            <%# Eval("idPac") + " - " + Eval("Paciente") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Dentista">                    
                        <ItemTemplate>
                            <%# Eval("idDent") + " - " + Eval("Dentista") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Data da Avaliação">                    
                        <ItemTemplate>
                            <%# Eval("data") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                </Columns>
            </asp:GridView>
            <asp:Button id="btnPrint" runat="server" CssClass="btn btn-info" Text="Imprimir" Visible="false" OnClick="btnPrint_Click"/>            
            <asp:Panel CssClass="pull-right" runat="server" ID="pnlQtd">
                <asp:Label ID="Label2" runat="server" Text="Quantidade de Registros: " />
                <asp:Label ID="lbQtdReg" runat="server"/>
            </asp:Panel>
        </div>      
    </asp:Panel>
</asp:Content>
