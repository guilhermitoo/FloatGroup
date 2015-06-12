    <%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="atendimento.aspx.cs" Inherits="FrontEnd.atendimento1" meta:resourcekey="PageResource1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">

    
    <h2>
        <asp:Literal ID="lt00" Text="<%$ resources: titulo %>" runat="server"/></h2>
    <h5>
        <asp:Literal ID="Literal1" Text="<%$ resources: subtitulo %>" runat="server"/>
    </h5>
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body"> 
                <div class="col-md-4">  
                    <asp:Label ID="Label1" Text="Paciente" runat="server" meta:resourcekey="Label1Resource1" />
                    <asp:DropDownList ID="ddPacienteAtendimento" CssClass="form-control dropdown-toggle" runat="server" meta:resourcekey="ddPacienteAtendimentoResource1" >
                    </asp:DropDownList>                                    
                </div>  
                <div class="col-md-2">    
                    <br />                          
                    <asp:Button ID="btnBuscaAtend" runat="server" Text="Buscar Atendimento" CssClass="btn btn-primary" OnClick="btnBuscaAtend_Click" meta:resourcekey="btnBuscaAtendResource1" />                                    
                </div>       
            </div>
        </div>
        <%--<asp:Panel ID="pnlListaAt" CssClass="panel panel-default" runat="server">--%>
            <asp:GridView runat="server" ID="gvListaAtendimentos" AutoGenerateColumns="False" OnRowCommand="gvListaAtendimentos_RowCommand"
                  OnRowDataBound="gvListaAtendimentos_RowDataBound" CssClass="table table-bordered" DataKeyNames="id" GridLines="Horizontal" AllowPaging="True" meta:resourcekey="gvListaAtendimentosResource1" >
                <Columns>
                    <asp:TemplateField HeaderText="ID" meta:resourcekey="TemplateFieldResource1">
                        <ItemTemplate>
                            <%#Eval("id") %>
                        </ItemTemplate>
                        <HeaderStyle Width="35px" />
                    </asp:TemplateField>     
                    <asp:TemplateField HeaderText="Data e Hora" meta:resourcekey="TemplateFieldResource2">
                        <ItemTemplate>
                            <%#Eval("data") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nome do Dentista" meta:resourcekey="TemplateFieldResource3">
                        <ItemTemplate>
                            <%#Eval("nomeDentista") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:ButtonField CommandName="Abrir" HeaderStyle-Width="20" Text="Abrir" meta:resourcekey="ButtonFieldResource1">
                        <ControlStyle CssClass="btn btn-xs btn-info"/>                                    

<HeaderStyle Width="20px"></HeaderStyle>
                    </asp:ButtonField>
                </Columns>
            </asp:GridView>
<%--        </asp:Panel>--%>
        <asp:Panel ID="pnlDetalhes" CssClass="panel panel-default" runat="server" Visible="False" meta:resourcekey="pnlDetalhesResource1">
            <div class="panel-body">
                <div class="col-sm-3">
                    <asp:Label id="lblNumeroAval" Text="<%$ resources: numatend %>" runat="server"  />
                    <input id="txtNumeroAtendimento" readonly="true" class="form-control" runat="server" type="text"/>                                    
                &nbsp;</div>
                <div class="col-sm-3">
                    <asp:Label id="Label2" Text="<%$ resources: dataatend %>" runat="server" />
                    <input id="txtDataAtendimento" readonly="true" class="form-control" runat="server" type="text"/>       
                &nbsp;</div>
                <div class="col-sm-4">
                    <asp:Label id="Label3" Text="Dentista" runat="server" meta:resourcekey="lblNumeroAvalResource1" />                    
                    <input id="txtDentista" readonly="true" class="form-control" runat="server" type="text"/>                           
                &nbsp;</div>
                <div class="col-sm-2">
                    <asp:Label ID="lbl4" Text="Status" runat="server" meta:resourcekey="lbl4Resource1" />
                    <asp:TextBox ReadOnly="True" runat="server" ID="txtStatus" CssClass="form-control" meta:resourcekey="txtStatusResource1" />
                </div>
                <br /><br />
                <div class="col-sm-12">
                    <br />
                    <asp:GridView runat="server" ID="gvItensAtendimento" CssClass="table table-bordered table-stripped"   
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
                                    <%#Eval("Descrição_Procedimento") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Qtd" meta:resourcekey="TemplateFieldResource3">
                                <ItemTemplate>
                                    <%#Eval("qtd") %>
                                </ItemTemplate>
                                <HeaderStyle Width="50px" />
                            </asp:TemplateField>            
                            <asp:TemplateField HeaderText="Realizado" meta:resourcekey="TemplateFieldResource4">
                                <ItemTemplate >
                                    <asp:CheckBox id="cbProcRealizado" runat="server" Checked="True" meta:resourcekey="cbProcRealizadoResource1" />
                                </ItemTemplate> 
                                <HeaderStyle Width="80px" />                             
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>                                      
                        </Columns>                            
                    </asp:GridView>       
                </div>
            </div>            
            <div class="panel-footer clearfix">
                <div class="col-md-4 form-group">                    
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" CssClass="btn btn-primary" OnClick="btnConfirmar_Click" meta:resourcekey="btnConfirmarResource1"/>                  
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-danger" OnClick="btnCancelar_Click" meta:resourcekey="btnCancelarResource1"/>
                </div>
            </div>
            
        </asp:Panel>
    </div>
</asp:Content>
