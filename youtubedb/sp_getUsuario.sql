

create proc sp_getUsuario
@NombreUsuario nvarchar(50)
as
select NombreUsuario, 
    Nombre,
    Apellido,
    Edad,
    FechaRegistro
from Usuarios
where NombreUsuario = @NombreUsuario
go




