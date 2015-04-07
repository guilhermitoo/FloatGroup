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
-- exec cadCidade 'pindamonhangaba','SP'
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
-- exec cadMedicamento 'Dipirona','antitêrmico','amarela','10 gotas','30 ml'

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
-- exec cadConvenio '080.000.000/0000-01','1234321','UNIMED LTDA','UNIMED'

create procedure cadPaciente
(
	@nome		varchar(100),
	@cpf		varchar(15),
	@rg 		varchar(12),
	@nascimento	date,
	@sexo		char(1),
	@endereco	varchar(100),
	@usuario	varchar(20),
	@senha		varchar(50),
	@status		int,
	@obs		varchar(200),	
	@cidade_id	int,
	@convenio   int
)
as
begin
	insert into pessoas values (@nome,@cpf,@rg,@nascimento,@sexo,@endereco,@usuario,@senha,@status,@obs,@cidade_id);
	insert into pacientes values (@@IDENTITY,@convenio);
end

-- teste
-- exec cadPaciente 'Jairo Junio Tavares Pedro','123.123.321-22','123.123.123-1','24/06/1995','M','Rua de barro nº 2','jaja','juju',1,'',1


create procedure cadFuncionario
(
	@nome		varchar(100),
	@cpf		varchar(15),
	@rg 		varchar(12),
	@nascimento	date,
	@sexo		char(1),
	@endereco	varchar(100),
	@usuario	varchar(20),
	@senha		varchar(50),
	@status		int,
	@obs		varchar(200),	
	@cidade_id	int,
	@salario	decimal(15,2),
	@cargo		varchar(50)
)
as
begin
	insert into pessoas values(@nome,@cpf,@rg,@nascimento,@sexo,@endereco,@usuario,@senha,@status,@obs,@cidade_id);
	insert into funcionarios values(@@IDENTITY,@salario,@cargo);
end
