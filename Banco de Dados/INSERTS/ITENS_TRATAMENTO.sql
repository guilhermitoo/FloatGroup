USE [WebOdonto]
GO

INSERT INTO [dbo].[itensTratamento]
           ([tratamento_id]
           ,[procedimento_id]
           ,[qtd]
           ,[valor]
           ,[status])
     VALUES
           (<tratamento_id, int,>
           ,<procedimento_id, int,>
           ,<qtd, int,>
           ,<valor, decimal(15,2),>
           ,<status, int,>)
GO


