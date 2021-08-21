

create view VentasView
as
select v.ID as IDVenta,
        v.CodigoFactura,
        v.Prima,
        v.Cuotas,
        v.FechaInicio, 
        v.FechaFin,
        v.IDTipoVenta,
        tv.Tipo as TipoVenta,
        v.IDCliente,
        c.Nombre as Cliente,
        v.IDColaborador,
        cl.Nombre as Colaborador,
        dv.IDProducto,   
        p.Producto,
        ct.ID as IDCategoria,
        ct.Categoria,
        dv.Cantidad,   
        dv.PrecioVenta,      
        dv.CantidadDevuelta   
from Ventas v
inner join Clientes c on c.dni = v.IDCliente
inner join Colaboradores cl on cl.DNI = v.IDColaborador
inner join TiposVentas tv on tv.ID = v.IDTipoVenta
inner join DetallesVentas dv on dv.IDVenta = v.ID
inner join Productos p on p.id = dv.IDProducto
inner join Categorias ct on ct.ID = p.IDCategoria
go

