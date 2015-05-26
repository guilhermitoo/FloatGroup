<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="statusTratamento.aspx.cs" Inherits="FrontEnd.statusTratamento" %>
<%@ MasterType VirtualPath="~/Web_Odonto.master"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="p" runat="server">
    
    <div class="panel-heading">
        <h2><label id="lbTitulo">Buscar Tratamento</label></h2>                  
        <input type="hidden" class="prog" runat="server" id="bd" value="0"/>                                                                                                       
        <hr />            
    </div>        

    <div class="panel-body">
        <div class="col-md-6">  
            <label>Paciente</label> 
            <asp:DropDownList ID="ddPaciente" CssClass="form-control dropdown-toggle" runat="server">
            </asp:DropDownList>                                    
        </div>                                                                                     
        <div class="col-md-6">    
            <br />                          
            <asp:Button ID="btnBuscaTratamento" runat="server" Text="Buscar Tratamento" CssClass="btn btn-primary" OnClick="btnBuscaTratamento_Click"/>                                    
        </div>        
        <br /><br /><br /><br />
        <asp:Panel id="pnlTratamento" runat="server">
            <div class="col-md-3">
                <asp:Label ID="lbNumTrat" runat="server" Text="Número do Tratamento" />
                <asp:TextBox ID="txtNumTrat" runat="server" ReadOnly="true" CssClass="form-control numTrat"/>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbStatus" runat="server" Text="Status" />
                <asp:TextBox ID="txtStatus" runat="server" ReadOnly="true" CssClass="form-control"/>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbDataIni" runat="server" Text="Data Início" />
                <asp:TextBox ID="txtDataIni" runat="server" ReadOnly="true" CssClass="form-control"/>
            </div>
            <div class="col-md-3">
                <asp:Label ID="lbDataFin" runat="server" Text="Data Final" />
                <asp:TextBox ID="txtDataFin" runat="server" ReadOnly="true" CssClass="form-control"/>
            </div>
            <br /><br /><br /><br />
            <div class="col-lg-12">                              
                <asp:Label runat="server" Text="Progresso do Tratamento: "></asp:Label>
                <div class="progress progress-striped active">
                    <div id="pbProgresso" runat="server" class="progress-bar progress-bar-primary" role="progressbar" aria-valuemin="0" aria-valuemax="100">                         
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <asp:Label runat="server" Text="Procedimentos Pendentes"></asp:Label>
                <asp:GridView ID="gvProcPendentes" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
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
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-6">
                <asp:Label runat="server" Text="Procedimentos Concluidos"></asp:Label>
                <asp:GridView ID="gvProcConcluidos" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false">
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
                    </Columns>
                </asp:GridView>
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
