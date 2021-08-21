


use SistemasIDB


select * from Productos
select * from Ventas

ALTER PROC sp_rptProductros
AS
BEGIN
    SET NOCOUNT ON;
    SELECT p.id,p.CodigoProducto,p.Nombre,p.Precio,c.Categoria,pv.Nombre as Proveedor FROM Productos p
    inner join Categorias c on c.id = p.IdCategoria
    inner join proveedores pv on pv.id = p.IdProveedor
END
GO

exec sp_rptProductros

/* proc dos*/
CREATE PROC sp_rptProductrosFiltro
@Proveedor nvarchar(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Productos pd
    inner join proveedores p on p.Id = pd.IdProveedor 
    where p.Nombre = @Proveedor
END
GO


select * from Productos

insert into Productos VALUES('COC02','Cocacola 2L','2 Litros',40,56,1,1,1,1)
