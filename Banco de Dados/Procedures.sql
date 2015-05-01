-- CRIAÇÃO DE PROCEDURES --
use WebOdonto
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

create procedure alteraMedicamento
(
	@id					int,
	@nome				varchar(100),
	@classe_terapeutica varchar(50),
	@tarja              varchar(50),
	@posologia          varchar(50),
	@unidade			varchar(10)
)
as
begin
	update medicamentos set nome = @nome, classe_terapeutica = @classe_terapeutica, tarja = @tarja, posologia = @posologia,
	unidade = @unidade where ( id = @id );
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

create procedure alteraImagem
(
	@id int,
	@paciente_id int,
	@descricao varchar(50),
	@arquivo varbinary(max)
)
as
begin
	update imagens set descricao = @descricao, arquivo = @arquivo where ( (paciente_id = @paciente_id ) and ( id = @id ) );
end
go

create procedure alteraAvaliacao
(
	@id int,
	@data datetime,
	@dentista_id int,
	@paciente_id int
)
as
begin
	update avaliacoes set data = @data, dentista_id = @dentista_id, paciente_id = @paciente_id where ( id = @id );	
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
	@data date,
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

create procedure alteraReceita
(
	@id int,
	@descricao varchar(200),
	@atendimento_id int
)
as
begin
	update receitas set descricao = @descricao, atendimento_id = @atendimento_id where (id = @id);
end
go

create procedure alteraItemReceita
(
	@receita_id int,
	@medicamento_id int,
	@dose varchar(10),
	@obs varchar(100),
	@periodo varchar(50)
)
as
begin
	update itensReceita set dose = @dose, obs = @obs, periodo = @periodo
	where ((receita_id = @receita_id) and (medicamento_id = @medicamento_id));
end
go

--============================= TESTE PROCEDURES CADASTRO ========================================================================
exec cadCidade 'pindamonhangaba','SP'
go
exec cadMedicamento 'Dipirona','antitêrmico','amarela','10 gotas','30 ml'
go
exec cadConvenio '080.000.000/0000-01','1234321','UNIMED LTDA','UNIMED'
go
exec cadPaciente 'Jairo','123.123.321-22','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,1
go
exec cadFuncionario 'Gui','123.123.321-23','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,560.33,'programador'
go
exec cadDentista 'Guiga','123.123.321-25','123.123.123-1','24/06/1995','1732323232','12323232123','M','Rua de barro nº 2','jaja','juju',1,'',1,1,'32363',1200
go
exec cadImagem 1,'foto antes do tratamento',123123
go
exec cadAvaliacao '23/03/2015',4,1
go
exec cadTratamento 2,1,233.55
go
exec cadProcedimento 'CANAL'
go
exec cadItenTratamento 2,2,33,123.55,1
go
exec cadAtendimento '02/05/2015',1,4,2
go
exec cadItemAtendimento 6,1,1
go
exec cadReceita 'receita de tratamento bucal',6
go
exec cadItemReceita 1,1,'100 ml','','de 6 em 6 horas durante 2 semanas'
go

-- TESTE PROCEDURES ALTERAÇÃO

exec alteraCidade 1,'piracicaba 2','SP'
go
exec alteraMedicamento 1,'teste','','','',''
go
exec alteraConvenio 1,1323123,321321, 'UNIMEDI','UNIMÉDI'
go
exec alteraPaciente 1,'KKKKKK','12312','333','12/12/12','(17)1212-1212','','M','rua dos bobos','abej','123',1,'',1,1,1
go
exec alteraFuncionario 3,'nome','123.123.123-30','12.123.123-2','12/12/12','(18)123-123','','M','endereco','usuario','senha',1,'',1,1,2390,'analista'
go
exec alteraDentista 4,'nomed','','','','','','M','','','',1,'',1,1,'123',1300
go
exec alteraImagem 3,1,'foto2',0x0001E0F3
go
exec alteraAvaliacao 2, '2/12/2015',4,1
go
exec alteraTratamento 2,2,233.55
go
exec alteraProcedimento 1, 'limpeza'
go
exec alteraItemTratamento 2,2,44,100,2
go
exec alteraAtendimento 6,'02/06/2015',1,4,2
go
exec alteraItemAtendimento 6,1,122
go
exec alteraReceita 1,'receita de tratamento',6
go
exec alteraItemReceita 1,1,'200 ml','obs','de 8 em 8 horas'
go

