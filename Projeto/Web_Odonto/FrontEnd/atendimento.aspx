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
                        <asp:TextBox id="txtNumeroAvaliacao" ReadOnly="true" CssClass="form-control" runat="server"/>                                    
                    </div>        
                    </div>
            </div>
            <div class="panel panel-default">
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
                        <asp:Label ID="Label1" Text="Valor" runat="server"/>
                        <input id="txtValor" runat="server" class="form-control"/>
                    </div>
                    <div class="col-md-2">
                        <br />
                        <asp:Button ID="btnAddProcedimento" runat="server" CssClass="btn btn-primary" Text="Adicionar"/>
                    </div>
                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped" 
                        GridLines="Horizontal" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="procedimento_id">
                    <Columns>
                    <asp:BoundField DataField="Procedimento.id" />  
                    <asp:BoundField DataField="Procedimento.descricao" />                     
                    <asp:BoundField DataField="Quantidade" />
                    <asp:BoundField DataField="Preco" />
                    <asp:ButtonField ButtonType="Image" CommandName="Apagar" ImageUrl="assets/img/lixo.png" />
                    </Columns>                            
                    </asp:GridView>                                 
                </div>                                                                                                                                                         
            </div>
    <div class="col-md-12">
    <div class="panel panel-default">
        <div class="table-responsive">
        <table class="table">
            
            <tbody>
            <tr>
                <td>
                <img src="assets/img/lixo.png" class="img-responsive" alt="Responsive image"/>
                </td>
            </tr>
                        </tbody>
        </table>
        </div>
    </div>
    </div>
    <div class="col-md-offset-4">
    
        <div class="form-group">
        <button type="submit" class="btn btn-info">
            Salvar
        </button>
        <button type="submit" class="btn btn-success">
            Limpar
        </button>
        <button type="submit" class="btn btn-warning">
            Sair
        </button>
        </div>
    
    </div>
<!-- /. ROW -->



</asp:Content>
