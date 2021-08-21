


create view v_venta1
AS
    select v.CodigoFactura,
            p.Producto,
            dv.Cantidad,
            dv.PrecioVenta,
            dv.Cantidad*dv.PrecioVenta as Subtotal,
            v.FechaInicio 
    from Ventas v
    inner join DetallesVentas  dv on dv.IDVenta = v.ID
    inner join Productos p on dv.IDProducto = p.ID