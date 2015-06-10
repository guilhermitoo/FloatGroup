USE [WebOdonto]
GO

INSERT INTO [dbo].[avaliacoes]
           ([data]
           ,[dentista_id]
           ,[paciente_id]
           ,[status])
     VALUES
           (<data, datetime,>
           ,<dentista_id, int,>
           ,<paciente_id, int,>
           ,<status, int,>)
GO


