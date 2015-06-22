USE [WebOdonto]
GO

INSERT INTO [dbo].[tratamentos]
           ([avaliacao_id]
           ,[status]
           ,[dataInicial]
           ,[dataFinal]
           ,[total])
     VALUES
           (1
           ,1
           ,null
           ,null
           ,100.00)
GO

INSERT INTO [dbo].[tratamentos]
           ([avaliacao_id]
           ,[status]
           ,[dataInicial]
           ,[dataFinal]
           ,[total])
     VALUES
           (2
           ,2
           ,'10/06/2015'
           ,null
           ,50.00)
GO

INSERT INTO [dbo].[tratamentos]
           ([avaliacao_id]
           ,[status]
           ,[dataInicial]
           ,[dataFinal]
           ,[total])
     VALUES
           (3
           ,3
           ,'10/06/2015'
           ,'11/07/2015'
           ,150.00)
GO