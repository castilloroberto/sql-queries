


create view v_VentasCredito
as
select CodigoFactura,
        c.Nombre [Cliente],
        Prima,
        Cuotas,
        FechaInicio [Fecha], 
        FechaFin [FechaVencimiento],
        (dv.PrecioVenta) [TotalVenta],
        p.Producto,
        cl.Nombre [Colaborador]
from Ventas v
inner join DetallesVentas dv on dv.IDVenta = v.ID
inner join Productos p on p.ID = dv.IDProducto
inner join Clientes c on c.DNI = v.IDCliente
inner join Colaboradores cl on cl.DNI = v.IDColaborador
where v.IDTipoVenta = 2 and Cuotas > 0
go









