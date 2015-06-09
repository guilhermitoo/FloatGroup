<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="procedimentosPeriodo.aspx.cs" Inherits="FrontEnd.procedimentosDentistaPeriodo" %>
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
                    <asp:TemplateField HeaderText="Código"  HeaderStyle-Width="20">                    
                        <ItemTemplate>
                            <%#Eval("ID") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Descrição do Procedimento">                    
                        <ItemTemplate>
                            <%#Eval("Descrição_do_Procedimento") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                    <asp:TemplateField HeaderText="Qtd Realizada" HeaderStyle-Width="120">                    
                        <ItemTemplate>
                            <%#Eval("qtd") %>
                        </ItemTemplate>                    
                    </asp:TemplateField>   
                </Columns>
            </asp:GridView>
            <asp:Button id="btnPrint" runat="server" CssClass="btn btn-info" Text="Imprimir" Visible="false" OnClick="btnPrint_Click"/>
        </div>      
    </asp:Panel>
</asp:Content>
