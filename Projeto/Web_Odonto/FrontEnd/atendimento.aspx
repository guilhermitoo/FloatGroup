<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="atendimento.aspx.cs" Inherits="FrontEnd.atendimento" %>
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
                        <asp:Label Text="Paciente" runat="server"/>
                        <asp:DropDownList ID="ddPacienteAvaliacao" CssClass="form-control dropdown-toggle" runat="server" >
                        </asp:DropDownList>                                    
                    </div>     
                    <div class="col-md-2">    
                        <br />                          
                        <asp:Button ID="btnBuscaAval" runat="server" Text="Buscar Avaliação" CssClass="btn btn-primary" OnClick="btnBuscaAval_Click"/>                                    
                    </div>                     
                    <div class="col-md-2">                        
                        <asp:Label id="lblNumeroAval" Text="Numero da Avaliação" runat="server" />
                        <input id="txtNumeroAvaliacao" readonly="true" class="form-control" runat="server"/>                                    
                    </div>        
                    </div>
            </div>
            <asp:Panel class="panel panel-default" id="pnlProc" runat="server" Visible="false">
                <div class="panel-body">               
                    <div class="col-md-4">
                        <asp:Label ID="lblProc" Text="Procedimento" runat="server"/>
                        <asp:DropDownList runat="server" ID="ddProcedimento" CssClass="form-control">
                        </asp:DropDownList>       
                    </div>
                    <div class="col-md-1">
                        <asp:Label ID="lblQtd" Text="Quantid." runat="server"/>
                        <asp:TextBox ID="txtQtdProc" TextMode="Number" runat="server" CssClass="form-control"/>
                    </div>
                    <div class="col-md-2">
                        <asp:Label ID="Label1" Text="Valor do Procedimento" runat="server"/>
                        <input id="txtValor" runat="server" class="form-control" onkeyup="formataValor(this,event);"/>
                    </div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button ID="btnAddProcedimento" runat="server" CssClass="btn btn-primary" Text="Adicionar" OnClick="btnAddProcedimento_Click"/>
                    </div>
                    <div class="col-md-12">
                        <br />
                        <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped"  OnRowCommand="gvItensAtendimento_RowCommand" 
                            GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Código_Procedimento">
                        <Columns>
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
                        <asp:TemplateField HeaderText="Valor">
                            <ItemTemplate>
                                <%#Eval("Valor") %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField HeaderStyle-Width="50" ButtonType="Image" CommandName="Apagar" ImageUrl="assets/img/lixo.png" />
                        </Columns>                            
                        </asp:GridView>                                 
                    </div>
                </div>                                                                                                                                                         
            </asp:Panel>    
    <div class="col-md-4">
    
        <div class="form-group">
        <asp:Button id="btnSalvar" CssClass="btn btn-info" Text="Salvar" runat="server" OnClick="btnSalvar_Click"/>
        <button type="submit" class="btn btn-success">
            Limpar</button>
        <button type="submit" class="btn btn-warning">
            Sair
        </button>
        </div>    
    </div>
    <div class="pull-right">
        <asp:Button id="btnIniciarTratamento" CssClass="btn btn-primary" runat="server" Text="Iniciar Tratamento" />
    </div>
</div>
<!-- /. ROW -->

    <script type="text/javascript">
        $(document).ready(function () {
                    
        }); 
    </script>

</asp:Content>
