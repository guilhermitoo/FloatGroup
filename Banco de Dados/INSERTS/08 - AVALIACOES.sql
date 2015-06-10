USE [WebOdonto]
GO

INSERT INTO [dbo].[avaliacoes]
           ([data]
           ,[dentista_id]
           ,[paciente_id]
           ,[status])
     VALUES
           ('20/10/2015 10:00:00'
           ,7
           ,4
           ,2)
GO

INSERT INTO [dbo].[avaliacoes]
           ([data]
           ,[dentista_id]
           ,[paciente_id]
           ,[status])
     VALUES
           (<data, datetime,>
           ,8
           ,5
           ,2)
GO

INSERT INTO [dbo].[avaliacoes]
           ([data]
           ,[dentista_id]
           ,[paciente_id]
           ,[status])
     VALUES
           (<data, datetime,>
           ,9
           ,6
           ,2)
GO

