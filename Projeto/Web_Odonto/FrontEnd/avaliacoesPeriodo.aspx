<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="avaliacoesPeriodo.aspx.cs" Inherits="FrontEnd.avaliacoesPeriodo" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    <asp:Panel runat="server" ID="pnlRelatorio" meta:resourcekey="pnlRelatorioResource1">
        <div class="panel-heading">
            <h2><label id="lbTitulo"><asp:Literal ID="lt00" Text="Relatório de Avaliações Realizadas por Período" runat="server" meta:resourcekey="lt00Resource1"/></label></h2>                  
            <input type="hidden" class="prog" runat="server" id="bd" value="0"/>                                                               
        </div>        
                
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-body">                                                                                   
                    <div class="col-md-2">
                        <asp:Label id="lbIni" runat="server" Text="Período de" meta:resourcekey="lbIniResource1"/>
                        <input type="text" runat="server" id="txtDatIni" class="form-control" onkeyup="formataData(this,event);" maxlength="10"/>                        
                    &nbsp;</div>                
                    <div class="col-md-2">
                        <asp:Label id="Label1" runat="server" Text="até" meta:resourcekey="Label1Resource1"/>
                        <input type="text" runat="server" id="txtDatFin" class="form-control" onkeyup="formataData(this,event);" maxlength="10"/>                        
                    &nbsp;</div>
                    <div class="col-md-2">    
                        <br />                          
                        <asp:Button ID="btnGerar" runat="server" Text="Gerar Relatório" CssClass="btn btn-primary" OnClick="btnGerar_Click" meta:resourcekey="btnGerarResource1" />                                    
                    </div>        
                </div>
            </div>

            <asp:GridView ID="gvRelatorio" runat="server" AllowPaging="True" CssClass="table table-bordered table-striped" 
                    DataKeyNames="ID" AutoGenerateColumns="False" meta:resourcekey="gvRelatorioResource1">            
                <Columns>                    
                    <asp:TemplateField HeaderText="Código da Avaliação" meta:resourcekey="TemplateFieldResource1">                    
                        <ItemTemplate>
                            <%#Eval("id") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Paciente" meta:resourcekey="TemplateFieldResource2">                    
                        <ItemTemplate>
                            <%# Eval("idPac") + " - " + Eval("Paciente") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Dentista" meta:resourcekey="TemplateFieldResource3">                    
                        <ItemTemplate>
                            <%# Eval("idDent") + " - " + Eval("Dentista") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Data da Avaliação" meta:resourcekey="TemplateFieldResource4">                    
                        <ItemTemplate>
                            <%# Eval("data") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                </Columns>
            </asp:GridView>
            <asp:Button id="btnPrint" runat="server" CssClass="btn btn-info" Text="Imprimir" Visible="False" OnClick="btnPrint_Click" meta:resourcekey="btnPrintResource1"/>            
            <asp:Panel CssClass="pull-right" runat="server" ID="pnlQtd" meta:resourcekey="pnlQtdResource1">
                <asp:Label ID="Label2" runat="server" Text="Quantidade de Registros: " meta:resourcekey="Label2Resource1" />
                <asp:Label ID="lbQtdReg" runat="server" meta:resourcekey="lbQtdRegResource1"/>
            </asp:Panel>
        </div>      
    </asp:Panel>
</asp:Content>
