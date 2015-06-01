    <%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="atendimento.aspx.cs" Inherits="FrontEnd.atendimento1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    
    <h2>
    Pagina de Atendimento</h2>
    <h5>
    realizar seus atendimentos
    </h5>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body"> 
                <div class="col-md-4">  
                    <asp:Label ID="Label1" Text="Paciente" runat="server" />
                    <asp:DropDownList ID="ddPacienteAtendimento" CssClass="form-control dropdown-toggle" runat="server" >
                    </asp:DropDownList>                                    
                </div>  
                <div class="col-md-2">    
                    <br />                          
                    <asp:Button ID="btnBuscaAtend" runat="server" Text="Buscar Atendimento" CssClass="btn btn-primary" OnClick="btnBuscaAtend_Click" />                                    
                </div>       
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <div class="col-sm-3">
                    <asp:Label id="lblNumeroAval" Text="Número Atendimento" runat="server" meta:resourcekey="lblNumeroAvalResource1" />
                    <input id="txtNumeroAtendimento" readonly="true" class="form-control" runat="server"/>                                    
                </div>
                <div class="col-sm-3">
                    <asp:Label id="Label2" Text="Data Atendimento" runat="server" meta:resourcekey="lblNumeroAvalResource1" />
                    <input id="txtDataAtendimento" readonly="true" class="form-control" runat="server"/>       
                </div>
                <div class="col-sm-6">
                    <asp:Label id="Label3" Text="Dentista" runat="server" meta:resourcekey="lblNumeroAvalResource1" />
                    <asp:DropDownList ID="ddDentistaAtendimento" runat="server" CssClass="form-control dropdown-toggle">
                    </asp:DropDownList>
                </div>
                <div class="col-sm-12">
                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-striped"   
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
                        </Columns>                            
                    </asp:GridView>       
                </div>
                <div class="panel-footer">
                    <div class="col-md-1">                    
                        <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-primary"/>
                    </div>
                    <div class="col-md-1">                    
                        <asp:Button ID="btnCancelar" runat="server" Text="Confirmar" CssClass="btn btn-danger"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
