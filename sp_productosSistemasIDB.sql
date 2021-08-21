

create proc sp_productos
as
set NOCOUNT ON; 
Select p.Id,
        CodigoProducto,
        p.Nombre as Producto,
        p.Descripcion,
        Precio,
        Existencias,
        p.IdCategoria,
        c.Categoria,
        p.IdMarca,
        m.Marca,
        p.IdProveedor,
        pv.Nombre as Proveedor,
        p.Estado
        from productos p
        inner join Categorias c on c.Id = p.IdCategoria
        inner join Marcas m on m.Id = p.IdMarca
        inner join proveedores pv on pv.Id = p.IdProveedor
go 