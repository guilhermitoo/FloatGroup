--View para todas tabelas

create view v_cidades
as
	select c.id   C�digo,
		   c.nome Cidade,
		   c.uf   UF
	from cidades c
go

create view v_convenios
as
	select c.id            C�digo,
		   c.cnpj          CNPJ,
		   c.ie			   IE,
		   c.razao_social  'Raz�o Social',
		   c.nome_fantasia 'Nome Fantasia'
	from convenios c
go

create view v_pessoas
as	
	select p.id			 C�digo,
		   p.nome		 Nome,
		   p.cpf		 CPF,
		   p.rg			 RG,
		   p.nascimento  'Data de Nascimento',
		   p.telefone1   'Telefone 1',
		   p.telefone2   'Telefone 2',
		   p.sexo		 Sexo,
		   p.endereco	 Endere�o,
		   p.usuario	 Usu�rio,
		   p.senha		 Senha,
		   p.status		 'Status',
		   p.obs		 Obs,
		   p.tipousuario 'Tipo Usu�rio'
	from pessoas p
go

create view v_pacientes
as
	select p.*,
		   c.razao_social as 'Conv�nio'
	from pacientes pa
	join v_pessoas p on (p.C�digo = pa.pessoa_id)
	left join convenios c on (pa.convenio_id = c.id)
go

create view v_funcionarios
as
	select p.*,
		   pf.salario Sal�rio,
		   pf.cargo   Cargo
	from funcionarios pf
	join v_pessoas p on (p.C�digo = pf.pessoa_id)
go
	
create view v_dentistas
as
	select p.*,
		   pd.cro  CRO
	from dentistas pd
	join v_pessoas p on (p.C�digo = pd.pessoa_id)
go	    

create view v_avaliacoes
as
	select a.id   C�digo,
		   a.data Data,
		   d.Nome Dentista,
		   p.Nome Paciente
	from avaliacoes a
	join v_dentistas d on (a.dentista_id = d.C�digo)
	join v_pacientes p on (a.paciente_id = p.C�digo)
go

create view v_tratamentos
as
	select a.C�digo,
		   t.status Status,
		   t.dataInicial 'Data Inicial',
		   t.dataFinal 'Data Final',
		   t.total  Total
	from tratamentos t
	join v_avaliacoes a on (t.avaliacao_id = a.C�digo)
go

create view v_procedimentos
as
	select p.id		   C�digo,
		   p.descricao Descri��o
	from procedimentos p
go

create view v_itensTratamento
as
	select t.C�digo  'C�digo Tratamento',
		   p.C�digo  'C�digo Procedimento',
		   p.Descri��o,
		   it.qtd    Quantidade,
		   it.status Status,
		   it.valor  Valor
	from itensTratamento it
	join v_tratamentos   t on (it.tratamento_id   = t.C�digo)
	join v_procedimentos p on (it.procedimento_id = p.C�digo)
go

create view v_atendimento
as
	select a.id     C�digo,
		   a.data   Data,
		   a.status Status,
		   d.Nome   Dentista,
		   t.C�digo 'C�digo Tratamento'
	from atendimentos a
	join v_dentistas   d on (a.dentista_id = d.C�digo)
	join v_tratamentos t on (a.tratamento_id = t.C�digo)
go

create view v_itensAtendimento
as
	select 	p.C�digo 'C�digo Procedimento',
		a.C�digo 'C�digo Atendimento',
		a.[C�digo Tratamento],
		p.Descri��o           'Descri��o Procedimento',
		ia.qtd
	from itensAtendimento ia
	join v_atendimento   a on (ia.atendimento_id = a.C�digo)
	join v_procedimentos p on (ia.procedimento_id = p.C�digo)
go

--View de Jun��es

-- view da agenda
create view v_agenda
as
select	'AV' tipo,
		a.id,
		a.data,
		a.dentista_id dentista,		
		d.nome nomeDentista,
		a.paciente_id paciente,
		p.nome nomePaciente,
		a.status
	from avaliacoes a
	join pessoas d on ( d.id = a.dentista_id )
	join pessoas p on ( p.id = a.paciente_id )

	union	

	select	'AT' tipo,
			at.id,
			at.data,
			at.dentista_id dentista,
			d.nome nomeDentista,
			av.paciente_id paciente,
			p.nome nomePaciente,
			at.status
	from atendimentos at
	join avaliacoes av on (av.id = at.tratamento_id)
	join pessoas d on ( d.id = at.dentista_id )
	join pessoas p on ( p.id = av.paciente_id )
go