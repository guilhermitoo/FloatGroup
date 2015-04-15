<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="relatorios.aspx.cs" Inherits="FrontEnd.relatorios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

              <h2>
                RELATÓRIOS
              </h2>
              <h5>
                Confira seus relatórios aqui
              </h5>
              <hr />
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-6">
                      <form role="form">
                        <div class="form-group">
                          <label>
                            Data
                          </label>
                          <div class="form-group" "col-md-6">  
                            <div class="col-md-3">
                                <input type="text" class="form-control" id="datepicker" />
                            
                            </div>
                                  
                            <div class="col-md-3">
                                
                                <input type="text" class="form-control" id="datepicker" />
                            </div>
                          </div>
                          <br />
                          <label>
                            Paciente
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            Dentista
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            Procedimento
                          </label>
                          <input class="form-control" />
                          <br />
                          <div class="panel panel-default">
                            <!-- Default panel contents -->
                            <div class="panel-heading">
                              Relatório
                            </div>
                            <div class="panel-body">
                              <p>
                                ...
                              </p>
                            </div>
                          </div>
                      </form>
                      </div>
                    </div>
                  </div>
                </div>

</asp:Content>
