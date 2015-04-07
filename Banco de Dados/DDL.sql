create database WebOdonto
go

use WebOdonto
go

create table cidades
(
	id		int			not null	primary key identity,
	nome			varchar(30)	not null,
	uf				char(2)
)
go

create table convenios
(
	id				int			not null	primary key identity,
	cnpj			varchar(20) unique,
	ie				varchar(20),
	razao_social	varchar(100),
	nome_fantasia	varchar(100)
)
go

create table pessoas
(
	id			int         not null primary key identity,
	nome		varchar(100) not null,
	cpf			varchar(15) not null unique,
	rg 			varchar(12),
	nascimento	date,
	sexo		char(1),
	endereco	varchar(100),
	usuario		varchar(20),
	senha		varchar(50),
	status		int,
	obs		varchar(200),	
	cidade_id	int			not null	references cidades -- relacionamento	
)
go

create table pacientes
(
	pessoa_id	int	not null primary key references pessoas,
	convenio_id	int	references convenios,
)
go

create table funcionarios
(
	pessoa_id	int		not null	primary key		references pessoas,
	salario		decimal(15,2),
	cargo		varchar(50)
)
go

create table dentistas
(
	pessoa_id	int		not null	primary key		references pessoas,
	cro			varchar(20) not null unique
)
go

create table telefones
(
	pessoa_id	int			not null,
	numero		varchar(20) not null,
	tipo		varchar(20),
	primary key(pessoa_id,numero)
)
go


create table medicamentos
(
	id				   int          not null primary key identity,
	nome           	   varchar(100) not null,
	classe_terapeutica varchar(50),
	tarja              varchar(50),
	posologia          varchar(50),
	unidade			   varchar(10)
)
go

create table imagens
(
	id				int			   not null,
	paciente_id		int			   not null	references pacientes,
	arquivo			varbinary(max) not null,
	descricao		varchar(50),
	primary key		(id,paciente_id)
)
go

create table avaliacoes
(
	id			int		 not null	primary key	identity,
	data		datetime not null,
	dentista_id	int		 not null	references dentistas,
	paciente_id int		 not null	references pacientes
)
go

create table tratamentos
(
	avaliacao_id int not null primary key references avaliacoes,
	status int		 not null,
	total decimal(15,2)
)
go

create table procedimentos
(
	id int not null	primary key identity,
	descricao varchar(80)
)
go

create table itensTratamento
(
	tratamento_id int not null references tratamentos,
	procedimento_id int not null references procedimentos,
	qtd int not null,
	valor decimal(15,2),
	status int not null,
	primary key(tratamento_id,procedimento_id)
)
go

create table atendimentos
(
	id int not null primary key identity,
	data date not null,
	status int,
	dentista_id int not null references dentistas,
	tratamento_id int not null references tratamentos
)
go

create table itensAtendimento
(
	atendimento_id int not null references atendimentos,
	procedimento_id int not null references procedimentos,
	qtd int not null,
	primary key(atendimento_id,procedimento_id)
)
go

create table receitas
(
	id int not null primary key identity,
	descricao varchar(200),
	atendimento_id int not null references atendimentos
)
go

create table itensReceita
(
	receita_id int not null references receitas,
	procedimento_id int not null references procedimentos,
	dose varchar(10) not null,
	obs varchar(100),
	periodo varchar(50)
)
go
