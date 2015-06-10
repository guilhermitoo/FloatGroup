USE [WebOdonto]
GO

INSERT INTO [dbo].[tratamentos]
           ([avaliacao_id]
           ,[status]
           ,[dataInicial]
           ,[dataFinal]
           ,[total])
     VALUES
           (<avaliacao_id, int,>
           ,<status, int,>
           ,<dataInicial, date,>
           ,<dataFinal, date,>
           ,<total, decimal(15,2),>)
GO


