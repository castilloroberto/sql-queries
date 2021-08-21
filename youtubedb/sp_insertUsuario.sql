

create proc sp_insertUsuario
@NombreUsuario nvarchar(50),
@Nombre nvarchar(50),
@Apellido nvarchar(50),
@Edad int,
@Clave nvarchar(255)
as
insert into Usuarios(NombreUsuario,Nombre,Apellido,Edad,Clave) 
values(
  @NombreUsuario,
  @Nombre,
  @Apellido,
  @Edad,
  @Clave  
)
go

