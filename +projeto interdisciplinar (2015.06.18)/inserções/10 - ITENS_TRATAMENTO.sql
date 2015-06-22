USE [WebOdonto]
GO

INSERT INTO [dbo].[itensTratamento]
           ([tratamento_id]
           ,[procedimento_id]
           ,[qtd]
           ,[valor]
           ,[status])
     VALUES
           (1
           ,1
           ,1
           ,100.00
           ,1)
GO

INSERT INTO [dbo].[itensTratamento]
           ([tratamento_id]
           ,[procedimento_id]
           ,[qtd]
           ,[valor]
           ,[status])
     VALUES
           (2
           ,2
           ,1
           ,50.00
           ,1)
GO

INSERT INTO [dbo].[itensTratamento]
           ([tratamento_id]
           ,[procedimento_id]
           ,[qtd]
           ,[valor]
           ,[status])
     VALUES
           (3
           ,3
           ,1
           ,150.00
           ,2)
GO