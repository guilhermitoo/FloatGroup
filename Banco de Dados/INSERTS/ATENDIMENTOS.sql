USE [WebOdonto]
GO

INSERT INTO [dbo].[atendimentos]
           ([data]
           ,[status]
           ,[dentista_id]
           ,[tratamento_id])
     VALUES
           (<data, datetime,>
           ,<status, int,>
           ,<dentista_id, int,>
           ,<tratamento_id, int,>)
GO


