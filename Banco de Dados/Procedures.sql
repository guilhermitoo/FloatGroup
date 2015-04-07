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

-- TESTE
exec cadCidade 'pindamonhangaba','SP'


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

-- teste
exec cadMedicamento 'Dipirona','antitêrmico','amarela','10 gotas','30 ml'

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

-- teste
exec cadConvenio '080.000.000/0000-01','1234321','UNIMED LTDA','UNIMED'
select * from pessoas

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

-- teste
exec cadPaciente 'Jairo','123.123.321-22','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,1

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

-- teste
exec cadFuncionario 'Gui','123.123.321-23','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,560.33,'programador'


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

-- teste
exec cadDentista'Guiga','123.123.321-25','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,'32363'
select * from pessoas


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

-- teste --
exec cadImagem 1,'foto antes do tratamento',123123
select * from imagens


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

-- teste
exec cadAvaliacao '23/03/2015',4,1


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

-- teste
exec cadTratamento 2,1,233.55
select * from tratamentos