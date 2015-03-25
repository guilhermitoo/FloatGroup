--create database WebOdonto
--go

--use WebOdonto
--go

create table cidades
(
	codigo_ibge		int			not null	primary key identity,
	nome			varchar(30)	not null,
	uf				char(2)
)


create table convenios
(
	id				int			not null	primary key identity,
	cnpj			varchar(20) unique,
	ie				varchar(20),
	razao_social	varchar(100),
	nome_fantasia	varchar(100),
	logradouro		varchar(100),
	cidade_id		int			not null	references cidades --relacionamento
)

create table pessoas
(
	id			int         not null primary key identity,
	nome		varchar(100) not null,
	cpf			varchar(15) not null unique,
	rg 			varchar(12),
	nascimento	date,
	sexo		char(1),
	logradouro	varchar(100),
	usuario		varchar(20),
	senha		varchar(50),	
	cidade_id	int			not null	references cidades -- relacionamento	
)

create table pacientes
(
	pessoa_id	int		not null	primary key		references pessoas,
	convenio_id	int		not null	references convenios,
)

create table funcionarios
(
	pessoa_id	int		not null	primary key		references pessoas
)

create table dentistas
(
	pessoa_id	int		not null	primary key		references pessoas,
	cro			varchar(20) not null unique
)

create table telefones
(
	pessoa_id	int			not null,
	numero		varchar(20) not null,
	primary key(pessoa_id,numero)
)


create table medicamentos
(
	id				   int          not null primary key identity,
	nome           	   varchar(100) not null,
	classe_terapeutica varchar(50),
	tarja              varchar(50),
	posologia          varchar(50)
)

create table imagens
(
	paciente_id		int			not null	references pacientes,
	link			varchar(200)not null,
	primary key (paciente_id,link)
)


create table avaliacoes
(
	id			int		 not null	primary key	identity,
	data		datetime not null,
	dentista_id	int		 not null	references dentistas,
	paciente_id int		 not null	references pacientes
)

create table tratamentos
(
	avaliacao_id int	not null	primary key	references pacientes,
	status		char(1)	not null,
	total		decimal(15,2)
)

create table procedimentos
(
	id			int		not null		primary key		identity,
	descricao	varchar(80)
)

create table itensTratamento
(
	tratamento_id int not null references tratamentos,
	procedimento_id int not null references procedimentos,
	qtd int not null,
	valor decimal(15,2),
	status char(1) not null,
	primary key(tratamento_id,procedimento_id)
)

create table atendimentos
(
	id int not null primary key identity,
	data date not null,
	dentista_id int not null references dentistas,
	tratamento_id int not null references tratamentos
)