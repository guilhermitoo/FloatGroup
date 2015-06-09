--select I.[Código Procedimento],I.[Código Tratamento],I.[Descrição Procedimento], I.qtd

create view v_detalheProcedimento
as
	select	A.data,
			I.procedimento_id ID, 
			P.descricao 'Descrição do Procedimento', 
			I.qtd
	from itensAtendimento I
	join procedimentos P on ( I.procedimento_id = P.id )
	join atendimentos A on ( A.id = I.atendimento_id )



select I.id,I.[Descrição do Procedimento],count(I.qtd) QTD from v_detalheProcedimento I
where I.data between '20/01/2000' 
and '20/12/2015'
group by I.ID, I.[Descrição do Procedimento]


where data between '20/01/2000' and '20/12/2015'

order by I.procedimento_id


select * from atendimentos
exec cadItemAtendimento 1003,3,2 

	select	A.data dataProc,
			I.procedimento_id idProc, 
			P.descricao descricaoProc, 
			PA.id idPaciente,
			PA.nome nomePaciente,
			DE.id idDentista,
			DE.nome nomeDentista,
			I.qtd
	from itensAtendimento I
	join procedimentos P on ( I.procedimento_id = P.id )
	join atendimentos A on ( A.id = I.atendimento_id )
	join avaliacoes AV on ( AV.id = A.tratamento_id )
	join pessoas PA on ( PA.id = AV.paciente_id )
	join pessoas DE on ( DE.id = A.dentista_id )