USE [WebOdonto]
GO

INSERT INTO [dbo].[pessoas]
           ([nome]
           ,[cpf]
           ,[rg]
           ,[nascimento]
           ,[telefone1]
           ,[telefone2]
           ,[sexo]
           ,[endereco]
           ,[usuario]
           ,[senha]
           ,[status]
           ,[obs]
           ,[tipoUsuario]
           ,[cidade_id])
     VALUES
           (<nome, varchar(100),>
           ,<cpf, varchar(15),>
           ,<rg, varchar(12),>
           ,<nascimento, date,>
           ,<telefone1, varchar(15),>
           ,<telefone2, varchar(15),>
           ,<sexo, char(1),>
           ,<endereco, varchar(50),>
           ,<usuario, varchar(20),>
           ,<senha, varchar(50),>
           ,<status, int,>
           ,<obs, varchar(200),>
           ,<tipoUsuario, int,>
           ,<cidade_id, int,>)
GO


