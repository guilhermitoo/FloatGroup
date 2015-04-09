<%@ Page Title="" Language="C#" MasterPageFile="~/Web_Odonto.Master" AutoEventWireup="true" CodeBehind="pessoas.aspx.cs" Inherits="FrontEnd.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="page-wrapper">
        <div id="page-inner">
          <div class="row">
            <div class="col-md-12">
              <h2>
                CADASTRO BÁSICO
              </h2>
              <h5>
                Faça cadastro de Funcionário, Paciente, e Dentista
              </h5>
            </div>
            <hr />
            <!--Topo -->
            <div class="col-md-12">
              <div class="panel panel-default">
                <div class="panel-body">
                  <div class="row">
                    <div class="col-md-6">
                      <form role="form">
                        <div class="form-group">
                          <label>
                            Escolha o tipo de cadastro
                          </label>
                          <select class="form-control">
                            <option>
                              Paciente
                            </option>
                            <option>
                              Funcionário
                            </option>
                            <option>
                              Dentista
                            </option>
                          </select>
                          <br />
                          <label>
                            Status:
                          </label>
                          <br />
                          <div class="radio-inline">
                            <label>
                              <input type="radio" name="status" value="option1" checked />
                              Ativo
                            </label>
                          </div>
                          <div class="radio-inline">
                            <label>
                              <input type="radio" name="status" value="option2" />
                              Inativo
                            </label>
                          </div>
                          <br />
                          <br />
                          <label>
                            Nome
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            Sexo:
                          </label>
                          <br />
                          <div class="radio-inline">
                            <label>
                              <input type="radio" name="genero" id="masculino" value="option1" checked
                              />
                              Masculino
                            </label>
                          </div>
                          <div class="radio-inline">
                            <label>
                              <input type="radio" name="genero" id="feminino" value="option2" />
                              Feminino
                            </label>
                          </div>
                          <br />
                          <br />
                          <label>
                            Data de Nascimento
                          </label>
                          <input class="form-control" id="datepicker" />
                          <br />
                          <label>
                            RG
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            CPF
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            Logradouro
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            CEP
                          </label>
                          <input class="form-control" />
                          <br />
                          <label>
                            Telefone
                          </label>
                          <input class="form-control" />
                          <br />
                          <label for="descricao">
                            Observação:
                          </label>
                          <textarea class="form-control" rows="5" id="comment">
                          </textarea>
                          <br />
                        </div>
                      </form>
                    </div>
                    <!-- row -->
                  </div>
                  <!-- panel-body -->
                </div>
                <!-- panel panel-default -->
              </div>
              <!-- col-md-12 -->
              <!-- Botões -->
              <div class="col-md-offset-3">
                <form role="form">
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
                </form>
              </div>
            </div>
            <!-- /. PAGE ROW -->
            <!-- /. PAGE INNER -->
          </div>
          <!-- /. PAGE WRAPPER -->
        </div>
        <!-- /. WRAPPER -->
      </div>

</asp:Content>
