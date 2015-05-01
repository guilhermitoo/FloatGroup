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

create table convenios
(
	id		int not null primary key identity,
	cnpj		varchar(20) not null unique,
	ie		varchar(20),
	razao_social	varchar(100),
	nome_fantasia	varchar(100)
)
go



create table pessoas
(
	id		int not null primary key identity,
	nome		varchar(100) not null,
	cpf		varchar(15) not null unique,
	rg 		varchar(12),
	nascimento	date,
	telefone1	varchar(15),
	telefone2	varchar(15),
	sexo		char(1), -- 'M' masculino, 'F' feminino
	endereco	varchar(50),	
	usuario		varchar(20),
	senha		varchar(50),
	status		int check (status in (1,2)) not null, -- 1 = ativo, 2 = inativo
	obs		varchar(200),
	tipoUsuario int check(tipoUsuario in (1,2)), -- 1 = normal, 2 = administrador
	cidade_id	int references cidades -- relacionamento	
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
	pessoa_id	int not null primary key		references pessoas,
	salario		decimal(15,2) not null,
	cargo		varchar(50) not null
)
go

create table dentistas
(
	pessoa_id	int		not null	primary key		references pessoas,
	cro			varchar(20) not null unique,
	salario decimal(15,2) not null
)
go

create table imagens
(
	id				int			   not null identity,
	paciente_id		int			   not null	references pacientes,
	descricao		varchar(50),	
	arquivo			varbinary(max) not null,
	primary key		(id,paciente_id)
)
go

create table avaliacoes
(
	id			int	not null	primary key	identity,
	data		datetime 	not null,
	dentista_id	int		not null	references dentistas,
	paciente_id int		 	not null	references pacientes
)
go

create table tratamentos
(
	avaliacao_id int not null primary key references avaliacoes,
	status int check(status in (1,2,3)) not null, -- 1 = Em Orçameto, 2 = Em Andamento, 3 = Concluído
	dataInicial date,
	dataFinal date,
	total decimal(15,2)
)
go

create table procedimentos
(
	id int not null	primary key identity,
	descricao varchar(80) not null,
)
go

create table itensTratamento
(
	tratamento_id int not null references tratamentos,
	procedimento_id int not null references procedimentos,
	qtd int not null,
	valor decimal(15,2),
	status int check(status in (1,2)) not null, -- 1 = pendente, 2 = concluído
	primary key(tratamento_id,procedimento_id)
)
go

create table atendimentos
(
	id int not null primary key identity,
	data date not null,
	status int check(status in (1,2,3)) not null, -- 1 = Pendente, 2 = Cancelado, 3 = Concluído
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
	descricao varchar(200) not null,
	atendimento_id int not null references atendimentos
)
go

create table itensReceita
(
	receita_id int not null references receitas,
	medicamento_id int not null references medicamentos,
	dose varchar(10) not null,
	obs varchar(100),
	periodo varchar(50),
	primary key (receita_id,medicamento_id)
)
go

