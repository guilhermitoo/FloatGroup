<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="statusTratamento.aspx.cs" Inherits="FrontEnd.statusTratamento" meta:resourcekey="PageResource1" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <div class="panel-heading">
        <h2><label id="lbTitulo"><asp:Literal ID="lt00" Text="<%$ resources: titulo %>" runat="server"/></label></h2>                  
        <input type="hidden" class="prog" runat="server" id="bd" value="0"/>                                                                                                                        
    </div>        
    
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-body"> 
                <div class="col-md-6">  
                    <asp:Label id="lbPaciente" runat="server" Text="Paciente" meta:resourcekey="lbPacienteResource1"/>
                    <asp:DropDownList ID="ddPaciente" CssClass="form-control dropdown-toggle" runat="server" meta:resourcekey="ddPacienteResource1">
                    </asp:DropDownList>                                    
                </div>                                                                                     
                <div class="col-md-6">    
                    <br />                          
                    <asp:Button ID="btnBuscaTratamento" runat="server" Text="Buscar Tratamento" CssClass="btn btn-primary" OnClick="btnBuscaTratamento_Click" meta:resourcekey="btnBuscaTratamentoResource1"/>                                    
                </div>        
            </div>
        </div>   
        <asp:GridView runat="server" ID="gvListaTratamentos" AutoGenerateColumns="false" OnRowCommand="gvListraTratamentos_RowCommand"
                CssClass="table table-bordered" DataKeyNames="Código" GridLines="Horizontal" AllowPaging="True" >
            <Columns>
                <asp:TemplateField HeaderText="<%$ resources: codtrat %>" HeaderStyle-Width="180px" >
                    <ItemTemplate>
                        <%#Eval("Código") %>
                    </ItemTemplate>                    
                </asp:TemplateField>     
                <asp:TemplateField HeaderText="<%$ resources: nomepac %>">
                    <ItemTemplate>
                        <%#Eval("Nome") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <%#Eval("Status") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:ButtonField CommandName="Abrir" HeaderStyle-Width="20" Text="<%$ resources: abrir %>" >
                    <ControlStyle CssClass="btn btn-xs btn-info"/>                                    
                </asp:ButtonField>
            </Columns>
        </asp:GridView>   
        <asp:Panel id="pnlTratamento" runat="server" meta:resourcekey="pnlTratamentoResource1">      
            <div class="panel panel-default">
                <div class="panel-body">                 
                    <div class="col-md-3">
                        <asp:Label ID="lbNumTrat" runat="server" Text="Número do Tratamento" meta:resourcekey="lbNumTratResource1" />
                        <asp:TextBox ID="txtNumTrat" runat="server" ReadOnly="True" CssClass="form-control numTrat" meta:resourcekey="txtNumTratResource1"/>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbDataIni" runat="server" Text="Data Início" meta:resourcekey="lbDataIniResource1" />
                        <asp:TextBox ID="txtDataIni" runat="server" ReadOnly="True" CssClass="form-control" meta:resourcekey="txtDataIniResource1"/>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbDataFin" runat="server" Text="Data Final" meta:resourcekey="lbDataFinResource1" />
                        <asp:TextBox ID="txtDataFin" runat="server" ReadOnly="True" CssClass="form-control" meta:resourcekey="txtDataFinResource1"/>
                    </div>
                    <div class="col-md-3">
                        <asp:Label ID="lbStatus" runat="server" Text="Status" meta:resourcekey="lbStatusResource1" />
                        <asp:TextBox ID="txtStatus" runat="server" ReadOnly="True" CssClass="form-control" meta:resourcekey="txtStatusResource1"/>
                    </div>
                    <br /><br /><br /><br />
                    <div class="col-lg-12">                              
                        <asp:Label ID="Label1" runat="server" Text="Progresso do Tratamento: " meta:resourcekey="LabelResource1"></asp:Label>
                        <div class="progress progress-striped active">
                            <div id="pbProgresso" runat="server" class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100">                         
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <asp:Label ID="Label2" runat="server" Text="Procedimentos Pendentes" meta:resourcekey="LabelResource2"></asp:Label>
                        <asp:GridView ID="gvProcPendentes" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" meta:resourcekey="gvProcPendentesResource1">
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
                    <div class="col-md-6">
                        <asp:Label ID="Label3" runat="server" Text="Procedimentos Concluidos" meta:resourcekey="LabelResource3"></asp:Label>
                        <asp:GridView ID="gvProcConcluidos" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" meta:resourcekey="gvProcConcluidosResource1">
                            <Columns>
                                <asp:TemplateField HeaderText="ID" meta:resourcekey="TemplateFieldResource4">
                                    <ItemTemplate>
                                        <%#Eval("Código_Procedimento") %>
                                    </ItemTemplate>
                                    <HeaderStyle Width="35px" />
                                </asp:TemplateField>                                    
                                <asp:TemplateField HeaderText="Descrição Procedimento" meta:resourcekey="TemplateFieldResource5">
                                    <ItemTemplate>
                                        <%#Eval("Descrição") %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Qtd" meta:resourcekey="TemplateFieldResource6">
                                    <ItemTemplate>
                                        <%#Eval("Quantidade") %>
                                    </ItemTemplate>
                                    <HeaderStyle Width="50px" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>                
                </div>
                <div class="panel-footer">
                    <asp:Button id="btnPrint" runat="server" CssClass="btn btn-info" Text="Imprimir" OnClick="btnPrint_Click" />
                </div>
            </div>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            var p = $('.prog').val();
            $('.progress-bar').width(p + "%");
        });

    </script>
</asp:Content>
