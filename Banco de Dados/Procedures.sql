-- CRIAÇÃO DE PROCEDURES --

-- procedure para cadastrar cidade
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

-- TESTE
exec cadCidade 'pindamonhangaba','SP'
go

create procedure cadMedicamento
(
	@nome	varchar(100),
	@classe_terapeutica varchar(50),
	@tarja              varchar(50),
	@posologia          varchar(50),
	@unidade			varchar(10)
)
as
begin
	insert into medicamentos values (@nome,@classe_terapeutica,@tarja,@posologia,@unidade);
end
go

-- teste
exec cadMedicamento 'Dipirona','antitêrmico','amarela','10 gotas','30 ml'
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

-- teste
exec cadConvenio '080.000.000/0000-01','1234321','UNIMED LTDA','UNIMED'
go
-- select * from pessoas

create procedure cadPaciente
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
	@cidade_id	int,
	@convenio   int
)
as
begin
	insert into pessoas values (@nome,@cpf,@rg,@nascimento,@telefone1,@telefone2,@sexo,@endereco,@usuario,
											@senha,@status,@obs,@tipoUsuario,@cidade_id);
	insert into pacientes values (@@IDENTITY,@convenio);
end
go

-- teste
exec cadPaciente 'Jairo','123.123.321-22','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,1
go

create procedure cadFuncionario
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
	@cidade_id	int,
	@salario	decimal(15,2),
	@cargo		varchar(50)
)
as
begin
	insert into pessoas values (@nome,@cpf,@rg,@nascimento,@telefone1,@telefone2,@sexo,@endereco,
							@usuario,@senha,@status,@obs,@tipoUsuario,@cidade_id);
insert into funcionarios values(@@IDENTITY,@salario,@cargo);
end
go

-- teste
exec cadFuncionario 'Gui','123.123.321-23','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,560.33,'programador'
go

create procedure cadDentista
(
	@nome		varchar(100),
	@cpf		varchar(15),
	@rg 		varchar(13),  
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
	@cidade_id	int,
	@cro		varchar(20)
)
as
begin
	insert into pessoas values (@nome,@cpf,@rg,@nascimento,@telefone1,@telefone2,@sexo,@endereco,
							@usuario,@senha,@status,@obs,@tipoUsuario,@cidade_id);
	insert into dentistas values (@@IDENTITY,@cro);
end
go

-- teste
exec cadDentista'Guiga','123.123.321-25','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,'32363'
go
--select * from pessoas


create procedure cadImagem
(
	@paciente_id int,
	@descricao varchar(50),
	@arquivo varbinary(max)
)
as
begin
	insert into imagens values (@paciente_id,@descricao,@arquivo);
end
go

-- teste --
exec cadImagem 1,'foto antes do tratamento',123123
go
--select * from imagens


create procedure cadAvaliacao
(
	@data datetime,
	@dentista_id int,
	@paciente_id int
)
as
begin
	insert into avaliacoes values(@data,@dentista_id,@paciente_id);
end
go

-- teste
exec cadAvaliacao '23/03/2015',4,1
go

create procedure cadTratamento
(
	@avaliacao_id int,
	@status int,
	@total decimal(15,2)
)
as
begin
	insert into tratamentos values(@avaliacao_id,@status,@total);
end
go

-- teste
exec cadTratamento 2,1,233.55
go
--select * from tratamentos


create procedure cadProcedimento
(
	@descricao varchar(80)
)
as
begin
	insert into procedimentos values (@descricao);
end
go

-- TESTE
exec cadProcedimento 'CANAL'
go
--select * from procedimentos

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

--select * from tratamentos
-- TESTE
exec cadItenTratamento 2,2,33,123.55,1
go
--select * from itensTratamento


create procedure cadAtendimento
(
	@data date,
	@status int,
	@dentista_id int,
	@tratamento_id int
)
as
begin
	insert into Atendimentos values(@data,@status,@dentista_id,@tratamento_id);
end
go

-- TESTE
exec cadAtendimento '02/05/2015',1,4,2
go
--select * from atendimentos


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

-- TESTE
exec cadItemAtendimento 6,1,1
go
--select * from itensAtendimento


create procedure cadReceita
(
	@descricao varchar(200),
	@atendimento_id int
)
as
begin
	insert into receitas values(@descricao,@atendimento_id);
end
go

-- TESTE
exec cadReceita 'receita de tratamento bucal',6
go
--select * from receitas


create procedure cadItemReceita
(
	@receita_id int,
	@medicamento_id int,
	@dose varchar(10),
	@obs varchar(100),
	@periodo varchar(50)
)
as
begin
	insert into itensReceita values(@receita_id,@medicamento_id,@dose,@obs,@periodo);
end
go

--TESTE
exec cadItemReceita 1,1,'100 ml','','de 6 em 6 horas durante 2 semanas'
go
--select * from itensReceita


