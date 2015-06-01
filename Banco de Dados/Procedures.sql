-- CRIAÇÃO DE PROCEDURES --
use WebOdonto1
go

create procedure cadCidade
(
	@nome	varchar(30),
	@uf		char(2)
)
as
begin
	insert into cidades values (@nome,@uf);
end
go

create procedure cadConvenio
(
	@cnpj			varchar(20),
	@ie				varchar(20),
	@razao_social	varchar(100),
	@nome_fantasia	varchar(100)
)
as
begin
	insert into convenios values (@cnpj,@ie,@razao_social,@nome_fantasia);
end
go

create procedure cadPessoa
(
    @nome		varchar(100),
	@cpf		varchar(15),
	@rg 		varchar(12),
	@nascimento	date,
	@telefone1  varchar(15),
	@telefone2	varchar(15),
	@sexo		char(1),
	@endereco	varchar(100),
	@usuario	varchar(20),
	@senha		varchar(50),
	@status		int,
	@obs		varchar(200),
	@tipoUsuario int,	
	@cidade_id	int
)
as
begin
	insert into pessoas values (@nome,@cpf,@rg,@nascimento,@telefone1,@telefone2,@sexo,@endereco,@usuario,
											@senha,@status,@obs,@tipoUsuario,@cidade_id);
end
go

create procedure cadPaciente
(
	@pessoa_id  int,
	@convenio   int
)
as
begin
	insert into pacientes values (@pessoa_id,@convenio);
end
go

create procedure cadFuncionario
(
	@pessoa_id  int,
	@salario	decimal(15,2),
	@cargo		varchar(50)
)
as
begin	
	insert into funcionarios values(@pessoa_id,@salario,@cargo);
end
go

create procedure cadDentista
(
	@pessoa_id  int,
	@cro		varchar(20),
	@salario	decimal(15,2)
)
as
begin
	insert into dentistas values (@pessoa_id,@cro,@salario);
end
go

create procedure cadAvaliacao
(
	@data datetime,
	@dentista_id int,
	@paciente_id int,
	@status int
)
as
begin
	insert into avaliacoes values(@data,@dentista_id,@paciente_id,@status);
end
go

create procedure cadTratamento
(
	@avaliacao_id int,
	@status int,
	@dataInicial date,
	@dataFinal date,
	@total decimal(15,2)
)
as
begin
	insert into tratamentos values(@avaliacao_id,@status,@dataInicial,@dataFinal,@total);
end
go

create procedure cadProcedimento
(
	@descricao varchar(80)
)
as
begin
	insert into procedimentos values (@descricao);
end
go

create procedure cadItemTratamento
(
	@tratamento_id int,
	@procedimento_id int ,
	@qtd int,
	@valor decimal(15,2),
	@status int
)
as
begin
	insert into ItensTratamento values (@tratamento_id,@procedimento_id,@qtd,@valor,@status);
end
go

create procedure cadAtendimento
(
	@data datetime,
	@status int,
	@dentista_id int,
	@tratamento_id int
)
as
begin
	insert into Atendimentos values(@data,@status,@dentista_id,@tratamento_id);
end
go

create procedure cadItemAtendimento
(
	@atendimento_id int,
	@procedimento_id int,
	@qtd int
)
as
begin
	insert into ItensAtendimento values(@atendimento_id,@procedimento_id,@qtd);
end
go


-- ================================== PROCEDURES PARA ALTERAÇÃO DO REGISTRO!!!! ==========================================
-- =======================================================================================================================


create procedure alteraCidade
(
	@id		int,
	@nome	varchar(30),
	@uf		char(2)
)
as
begin
	update cidades set nome = @nome, uf = @uf where	id = @id;
end
go

create procedure alteraConvenio
(
	@id				int,
	@cnpj			varchar(20),
	@ie				varchar(20),
	@razao_social	varchar(100),
	@nome_fantasia	varchar(100)
)
as
begin
	update convenios set cnpj = @cnpj,ie = @ie,razao_social = @razao_social, nome_fantasia = @nome_fantasia
	where ( id = @id );
end
go

create procedure alteraPessoa
(
	@id			int,
	@nome		varchar(100),
	@cpf		varchar(15),
	@rg 		varchar(12),
	@nascimento	date,
	@telefone1  varchar(15),
	@telefone2	varchar(15),
	@sexo		char(1),
	@endereco	varchar(100),
	@usuario	varchar(20),
	@senha		varchar(50),
	@status		int,
	@obs		varchar(200),
	@tipoUsuario int,	
	@cidade_id	int
)
as
begin
	update pessoas set nome = @nome, cpf = @cpf, nascimento = @nascimento, telefone1 = @telefone1, telefone2 = @telefone2,
	sexo = @sexo, endereco = @endereco, usuario = @usuario, senha = @senha, status = @status, obs = @obs, tipoUsuario = @tipoUsuario,
	cidade_id = @cidade_id where ( id = @id );
end
go

create procedure alteraPaciente
(
	@pessoa_id	int,
	@convenio   int
)
as
begin
	update pacientes set convenio_id = @convenio where ( pessoa_id = @pessoa_id );
end
go

create procedure alteraFuncionario
(
	@pessoa_id	int,
	@salario	decimal(15,2),
	@cargo		varchar(50)
)
as
begin
	update funcionarios set salario = @salario , cargo = @cargo where ( pessoa_id = @pessoa_id );
end
go

create procedure alteraDentista
(
	@pessoa_id	int,
	@cro		varchar(20),
	@salario	decimal(15,2)
)
as
begin
	update dentistas set cro = @cro, salario = @salario where ( pessoa_id = @pessoa_id );
end
go

create procedure alteraAvaliacao
(
	@id int,
	@data datetime,
	@dentista_id int,
	@paciente_id int,
	@status int
)
as
begin
	update avaliacoes set data = @data, dentista_id = @dentista_id, paciente_id = @paciente_id, status = @status where ( id = @id );	
end
go

create procedure alteraTratamento
(
	@avaliacao_id int,
	@status int,
	@dataInicial date,
	@dataFinal date,
	@total decimal(15,2)
)
as
begin 
	update tratamentos set status = @status, dataInicial = @dataInicial, dataFinal = @dataFinal ,total = @total where ( avaliacao_id = @avaliacao_id );
end
go

create procedure alteraProcedimento
(
	@id int,
	@descricao varchar(80)
)
as
begin
	update procedimentos set descricao = @descricao where ( id = @id );
end
go

create procedure alteraItemTratamento
(
	@tratamento_id int,
	@procedimento_id int ,
	@qtd int,
	@valor decimal(15,2),
	@status int
)
as
begin
	update ItensTratamento set qtd = @qtd,valor = @valor,status = @status 
	where ( (tratamento_id = @tratamento_id) and (procedimento_id = @procedimento_id) );
end
go

create procedure alteraAtendimento
(
	@id int,
	@data datetime,
	@status int,
	@dentista_id int,
	@tratamento_id int
)
as
begin
	update atendimentos set data = @data, status = @status, dentista_id = @dentista_id, tratamento_id = @tratamento_id
	where ( id = @id );
end
go

create procedure alteraItemAtendimento
(
	@atendimento_id int,
	@procedimento_id int,
	@qtd int
)
as
begin
	update itensAtendimento set qtd = @qtd where ((atendimento_id = @atendimento_id) and (procedimento_id = @procedimento_id));
end
go

