--View para todas tabelas

create view v_cidades
as
	select c.id   C�digo,
		   c.nome Cidade,
		   c.uf   UF
	from cidades c

select * from v_cidades

create view v_convenios
as
	select c.id            C�digo,
		   c.cnpj          CNPJ,
		   c.ie			   IE,
		   c.razao_social  'Raz�o Social',
		   c.nome_fantasia 'Nome Fantasia'
	from convenios c

select * from v_convenios


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

select * from v_pessoas

create view v_pacientes
as
	select p.*,
		   c.razao_social as 'Conv�nio'
	from pacientes pa
	join v_pessoas p on (p.C�digo = pa.pessoa_id)
	left join convenios c on (pa.convenio_id = c.id)

select * from v_pacientes

create view v_funcionarios
as
	select p.*,
		   pf.salario Sal�rio,
		   pf.cargo   Cargo
	from funcionarios pf
	join v_pessoas p on (p.C�digo = pf.pessoa_id)

select * from v_funcionarios
	
create view v_dentistas
as
	select p.*,
		   pd.cro  CRO
	from dentistas pd
	join v_pessoas p on (p.C�digo = pd.pessoa_id)

select * from v_dentistas

create view v_medicamentos
as
	select m.id                  C�digo,
		   m.nome                Medicamento,
		   m.classe_terapeutica  'Classe Terapeutica',
		   m.tarja               Tarja,
		   m.posologia           Posologia,
		   m.unidade             Unidade
	from medicamentos m	

select * from v_medicamentos


create view v_imagens
as
	select i.id        C�digo,
		   p.Nome      Paciente,
		   i.descricao Descri��o,
		   i.arquivo   Arquivo
	from imagens i
	join v_pacientes p on (i.paciente_id = p.C�digo)
	
 
select * from v_imagens		    

create view v_avaliacoes
as
	select a.id   C�digo,
		   a.data Data,
		   d.Nome Dentista,
		   p.Nome Paciente
	from avaliacoes a
	join v_dentistas d on (a.dentista_id = d.C�digo)
	join v_pacientes p on (a.paciente_id = p.C�digo)

select * from v_avaliacoes

create view v_tratamentos
as
	select a.C�digo,
		   t.status Status,
		   t.dataInicial 'Data Inicial',
		   t.dataFinal 'Data Final',
		   t.total  Total
	from tratamentos t
	join v_avaliacoes a on (t.avaliacao_id = a.C�digo)

select * from v_tratamentos

create view v_procedimentos
as
	select p.id		   C�digo,
		   p.descricao Descri��o
	from procedimentos p

select * from v_procedimentos

create view v_itensTratamento
as
	select t.C�digo  'C�digo Tratamento',
		   p.C�digo  'C�digo Procedimento',
		   it.qtd    Quantidade,
		   it.status Status,
		   it.valor  Valor
	from itensTratamento it
	join v_tratamentos   t on (it.tratamento_id   = t.C�digo)
	join v_procedimentos p on (it.procedimento_id = p.C�digo)

select * from v_itensTratamento

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

select * from v_atendimento

create view v_itensAtendimento
as
	select a.[C�digo Tratamento],
		   p.Descri��o           'Descri��o Procedimento',
		   ia.qtd
	from itensAtendimento ia
	join v_atendimento   a on (ia.atendimento_id = a.C�digo)
	join v_procedimentos p on (ia.procedimento_id = p.C�digo)

select * from v_itensAtendimento

create view v_receitas
as
	select r.id                  C�digo,
		   r.descricao           Descri��o,
		   a.[C�digo Tratamento] 'C�digo Tratamento'
	from receitas r
	join v_atendimento a on (r.atendimento_id = a.C�digo)

select * from receitas

create view v_itensReceita
as
	select r.C�digo      'C�digo receita',
		   m.Medicamento,
		   ir.dose       Dose,
		   ir.periodo    Per�odo,
		   ir.obs        Observa��o
	from itensReceita ir
	join v_receitas     r on (ir.receita_id = r.C�digo)
	join v_medicamentos m on (ir.medicamento_id = m.C�digo)

select * from v_itensReceita

--View de Jun��es

-- view da agenda
create view v_agenda
as
	select	a.id ID,
			a.data Data,
			a.dentista_id Dentista,		
			d.nome 'Nome Dentista',
			a.paciente_id Paciente,
			p.nome 'Nome Paciente',
			a.status Status
	from avaliacoes a
	join pessoas d on ( d.id = a.dentista_id )
	join pessoas p on ( p.id = a.paciente_id )


	union	

	select	at.id ID,
			at.data Data,
			at.dentista_id Dentista,
			d.nome 'Nome Dentista',
			av.paciente_id Paciente,
			p.nome 'Nome Paciente',
			at.status Status
	from atendimentos at
	join avaliacoes av on (av.id = at.id)
	join pessoas d on ( d.id = at.dentista_id )
	join pessoas p on ( p.id = av.paciente_id )