
create database youtubeDB
go

use youtubeDB
go

create table Usuarios(

    Id INT PRIMARY KEY IDENTITY,
    NombreUsuario nvarchar(50) not null,
    Nombre nvarchar(50) not null,
    Apellido nvarchar(50) not null,
    Edad int,
    Clave nvarchar(255) not null,
    FechaRegistro date default getdate(),

)
go



INSERT INTO Usuarios 
values
('robert12','Roberto','Castillo',20,'1234',getdate()),
('roberto451','Roberto','Castellanos',20,'1234',getdate()),
('roberto41','Roberto','Rodriguez',19,'1234',getdate())