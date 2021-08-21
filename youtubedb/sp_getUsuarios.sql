
create proc sp_getUsuarios
as
select NombreUsuario, 
    Nombre,
    Apellido,
    Edad,
    FechaRegistro
from Usuarios
go
