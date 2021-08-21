CREATE VIEW v_venta2
as
select v.CodigoFactura,
        c.Nombre as Cliente,
        cl.Nombre as Colaborador,
        p.Producto,
        dv.Cantidad,
        dv.PrecioVenta,
        dv.Cantidad*dv.PrecioVenta as Subtotal,
        v.FechaInicio 
from Ventas v
inner join DetallesVentas  dv on dv.IDVenta = v.ID
inner join Productos p on dv.IDProducto = p.ID
inner join Colaboradores cl on cl.DNI = v.IDColaborador
inner join Clientes c on c.DNI = v.IDCliente