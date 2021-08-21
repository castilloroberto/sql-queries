



alter TRIGGER updateProductoDevuelto  
ON Devoluciones   
AFTER INSERT, UPDATE   
AS 
    BEGIN
        insert into  Productos
        (Producto,Codigo,Existencias,IDCategoria,PrecioUnitario) 
        (select Producto,
                p.Codigo+'#usd',
                (select Cantidad from inserted),
                p.IDCategoria,
                p.PrecioUnitario 
        from Productos p 
        where ID =  (select IDProducto from inserted));
        
        -- actualizar los productos devueltos del detalle de venta
        update DetallesVentas
        set CantidadDevuelta = (select Cantidad from inserted)
        where IDVenta = (
            select v.ID 
            from Ventas v
            where CodigoFactura = (select i.CodigoFactura from inserted as i)
        );
    END
GO 


