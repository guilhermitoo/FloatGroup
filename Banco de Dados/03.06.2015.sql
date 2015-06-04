create procedure verificaItemAtendimento
( -- procedure que recebe o itemAtendimento e verifica se o mesmo no tratamento já foi totalmente realizado
	@idAtendimento int,
	@idProcedimento int
)
as
begin			
	declare @idTratamento int
	declare @qtdRealizada int
	declare @qtdPendente int
	-- busca o id do tratamento
	set @idTratamento =	(	select T.tratamento_id 
							from atendimentos T 
							where T.id = @idAtendimento	)
	-- traz a qtd já realizada nos atendimentos anteriores desse tratamento
	set @qtdRealizada = (select count(*) from itensAtendimento it
						join atendimentos at on (it.atendimento_id = at.id)
						where at.tratamento_id = @idTratamento
						and it.procedimento_id = @idProcedimento
						and at.status = 2)
	-- qtdPendente é: (total daquele item no tratamento) (-) (quantidade já realizada nos atendimentos) 
	set @qtdPendente = (select qtd from itensTratamento
						where tratamento_id = @idTratamento
						and procedimento_id = @idProcedimento) - @qtdRealizada
	
	if ( @qtdPendente = 0 )
		update itensTratamento set status = 2 
			where tratamento_id = @idTratamento
			and procedimento_id = @idProcedimento
end


create procedure removeItemAtendimento
(
	@atendimento_id int,
	@procedimento_id int
)
as 
begin
	delete from itensAtendimento
	where atendimento_id = @atendimento_id 
	and procedimento_id = @procedimento_id
end
go