<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="avaliacao.aspx.cs" Inherits="FrontEnd.atendimento" meta:resourcekey="PageResource1" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    <h2>
    Pagina de Avaliação</h2>
    <h5>
    Inicie seus tratamentos
    </h5>
    <div class="col-lg-12">
        <div class="panel panel-default">          
                <div class="panel-body">
                    <div class="col-md-4">  
                        <asp:Label Text="Paciente" runat="server" meta:resourcekey="LabelResource1"/>
                        <asp:DropDownList ID="ddPacienteAvaliacao" CssClass="form-control dropdown-toggle" runat="server" meta:resourcekey="ddPacienteAvaliacaoResource1" >
                        </asp:DropDownList>                                    
                    </div>     
                    <div class="col-md-2">    
                        <br />                          
                        <asp:Button ID="btnBuscaAval" runat="server" Text="Buscar Avaliação" CssClass="btn btn-primary" OnClick="btnBuscaAval_Click" meta:resourcekey="btnBuscaAvalResource1"/>                                    
                    </div>                     
                    <div class="col-md-2">                        
                        <asp:Label id="lblNumeroAval" Text="Número da Avaliação" runat="server" meta:resourcekey="lblNumeroAvalResource1" />
                        <input id="txtNumeroAvaliacao" readonly="true" class="form-control" runat="server"/>                                    
                    </div>   
                    <div class="col-md-2">
                        <asp:Label id="Label2" Text="Data da Avaliação" runat="server" meta:resourcekey="lblNumeroAvalResource1" />
                        <input id="txtDataAval" readonly="true" class="form-control" runat="server"/>                                    
                    </div>                             
                    </div>
            </div>
            <asp:Panel class="panel panel-default" id="pnlProc" runat="server" Visible="False" meta:resourcekey="pnlProcResource1">
                <div class="panel-body">               
                    <div class="col-md-5">
                        <asp:Label ID="lblProc" Text="Procedimento" runat="server" meta:resourcekey="lblProcResource1"/>
                        <asp:DropDownList runat="server" ID="ddProcedimento" CssClass="form-control" meta:resourcekey="ddProcedimentoResource1">
                        </asp:DropDownList>       
                    </div>
                    <div class="col-md-1">
                        <asp:Label ID="lblQtd" Text="Quantid." runat="server" meta:resourcekey="lblQtdResource1"/>
                        <asp:TextBox ID="txtQtdProc" TextMode="Number" runat="server" CssClass="form-control" meta:resourcekey="txtQtdProcResource1"/>
                    </div>
                    <div class="col-md-2">
                        <asp:Label ID="Label1" Text="Valor do Procedimento" runat="server" meta:resourcekey="Label1Resource1"/>
                        <input id="txtValor" runat="server" class="form-control" onkeyup="formataValor(this,event);" type="text"/>
                    &nbsp;</div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button ID="btnAddProcedimento" runat="server" CssClass="btn btn-primary" Text="Adicionar" OnClick="btnAddProcedimento_Click" meta:resourcekey="btnAddProcedimentoResource1"/>
                    </div>
                    <div class="col-md-12">
                        <br />
                        <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped"  OnRowCommand="gvItensAtendimento_RowCommand" 
                            GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Código_Procedimento" meta:resourcekey="gvItensAtendimentoResource1">
                        <Columns>
                        <asp:TemplateField HeaderText="ID" meta:resourcekey="TemplateFieldResource1">
                            <ItemTemplate>
                                <%#Eval("Código_Procedimento") %>
                            </ItemTemplate>
                            <HeaderStyle Width="35px" />
                        </asp:TemplateField>                                    
                        <asp:TemplateField HeaderText="Descrição Procedimento" meta:resourcekey="TemplateFieldResource2">
                            <ItemTemplate>
                                <%#Eval("Descrição") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Qtd" meta:resourcekey="TemplateFieldResource3">
                            <ItemTemplate>
                                <%#Eval("Quantidade") %>
                            </ItemTemplate>
                            <HeaderStyle Width="50px" />
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Valor" meta:resourcekey="TemplateFieldResource4">
                            <ItemTemplate>
                                <%#Eval("Valor") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Image" CommandName="Apagar" ImageUrl="assets/img/lixo.png" meta:resourcekey="ButtonFieldResource1" >
                            <HeaderStyle Width="50px" />
                            </asp:ButtonField>
                        </Columns>                            
                        </asp:GridView>                                                         
                        <asp:Panel runat="server" CssClass="pull-right col-md-2" ID="pnlTotal" meta:resourcekey="pnlTotalResource1">
                            <asp:Label Text="Valor Total" ID="lblTotal" runat="server" meta:resourcekey="lblTotalResource1"/>
                            <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control" ReadOnly="True" meta:resourcekey="txtTotalResource1" />
                        </asp:Panel>
                    </div>
                </div>                                                                                                                                                         
            </asp:Panel>    
    <div class="col-md-4">
    
        <div class="form-group">
        <asp:Button id="btnSalvar" CssClass="btn btn-info" Text="Salvar" runat="server" OnClick="btnSalvar_Click" meta:resourcekey="btnSalvarResource1"/>
        <button type="submit" class="btn btn-success">
            Limpar</button>
        <button type="submit" class="btn btn-warning">
            Sair
        </button>
        </div>    
    </div>
    <div class="pull-right">
        <asp:Button id="btnIniciarTratamento" CssClass="btn btn-primary" runat="server" Text="Iniciar Tratamento" 
                      OnClick="btnIniciarTratamento_Click"  meta:resourcekey="btnIniciarTratamentoResource1" />
    </div>
</div>
<!-- /. ROW -->

    <script type="text/javascript">
        $(document).ready(function () {
                    
        }); 
    </script>

</asp:Content>
