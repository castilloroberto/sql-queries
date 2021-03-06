USE [master]
GO
/****** Object:  Database [FerreteriaM]    Script Date: 23/4/2020 16:39:20 ******/
CREATE DATABASE [FerreteriaM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FerreteriaM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FerreteriaM.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FerreteriaM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\FerreteriaM_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FerreteriaM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FerreteriaM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FerreteriaM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FerreteriaM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FerreteriaM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FerreteriaM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FerreteriaM] SET ARITHABORT OFF 
GO
ALTER DATABASE [FerreteriaM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FerreteriaM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FerreteriaM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FerreteriaM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FerreteriaM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FerreteriaM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FerreteriaM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FerreteriaM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FerreteriaM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FerreteriaM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FerreteriaM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FerreteriaM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FerreteriaM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FerreteriaM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FerreteriaM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FerreteriaM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FerreteriaM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FerreteriaM] SET RECOVERY FULL 
GO
ALTER DATABASE [FerreteriaM] SET  MULTI_USER 
GO
ALTER DATABASE [FerreteriaM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FerreteriaM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FerreteriaM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FerreteriaM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FerreteriaM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'FerreteriaM', N'ON'
GO
ALTER DATABASE [FerreteriaM] SET QUERY_STORE = OFF
GO
USE [FerreteriaM]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 23/4/2020 16:39:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [int] NOT NULL,
	[NomEmpleado] [varchar](50) NOT NULL,
	[ApellEmpleado] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL,
	[PuestoLaboral] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/4/2020 16:39:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[NomUsuario] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[IdEmpleado] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[NomUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_Usu_Emp]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Usu_Emp]
AS
SELECT dbo.Usuario.NomUsuario AS Usuario, dbo.Usuario.IdEmpleado AS Id, dbo.Empleados.NomEmpleado + ' ' + dbo.Empleados.ApellEmpleado AS Empleado, dbo.Empleados.PuestoLaboral AS Puesto
FROM   dbo.Usuario INNER JOIN
             dbo.Empleados ON dbo.Usuario.IdEmpleado = dbo.Empleados.IdEmpleado
GO
/****** Object:  Table [dbo].[Bitaco]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitaco](
	[IdBitacora] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [varchar](50) NULL,
	[Hora] [varchar](50) NULL,
	[Usuario] [varchar](50) NULL,
	[IdActividad] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[IdActividad] [varchar](50) NOT NULL,
	[Descripcion_Actividad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Actividades] PRIMARY KEY CLUSTERED 
(
	[IdActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Bitaco]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Bitaco]
AS
SELECT dbo.Bitaco.Fecha, dbo.Bitaco.Hora, dbo.Bitaco.Usuario, dbo.Actividades.Descripcion_Actividad
FROM   dbo.Bitaco INNER JOIN
             dbo.Actividades ON dbo.Bitaco.IdActividad = dbo.Actividades.IdActividad
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] NOT NULL,
	[NombCliente] [varchar](50) NOT NULL,
	[ApellCliente] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Cliente]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Cliente]
AS
SELECT IdCliente, NombCliente + ' ' + ApellCliente AS NombreCom, Telefono, Direccion
FROM   dbo.Clientes
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] NOT NULL,
	[Categoria] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[IdMarca] [int] NOT NULL,
	[Marca] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[IdMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] NOT NULL,
	[NombreProd] [varchar](50) NOT NULL,
	[Precio] [varchar](50) NOT NULL,
	[IdCategoria] [varchar](50) NOT NULL,
	[IdMarca] [varchar](50) NOT NULL,
	[IdProveedor] [varchar](50) NOT NULL,
	[IdSucursal] [varchar](50) NOT NULL,
	[Stock] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Producto]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Producto]
AS
SELECT dbo.Producto.IdProducto, dbo.Producto.NombreProd, dbo.Producto.Precio, dbo.Marca.Marca, dbo.Categoria.Categoria, dbo.Producto.Stock
FROM   dbo.Producto CROSS JOIN
             dbo.Marca CROSS JOIN
             dbo.Categoria
GO
/****** Object:  View [dbo].[View_Emplea]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Emplea]
AS
SELECT IdEmpleado, NomEmpleado + ' ' + ApellEmpleado AS NomEm, Direccion, Telefono, PuestoLaboral
FROM   dbo.Empleados
GO
/****** Object:  Table [dbo].[Detalle Venta]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle Venta](
	[IdVenta] [varchar](50) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Cantidad] [varchar](50) NOT NULL,
	[Total_Linea] [varchar](50) NOT NULL,
	[Total] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Detalle Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_DetaVenta]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DetaVenta]
AS
SELECT IdVenta, IdProducto, Fecha, Cantidad, Total_Linea, Total
FROM   dbo.[Detalle Venta]
GO
/****** Object:  Table [dbo].[DetalleCompra]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleCompra](
	[IdCompra] [varchar](50) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[Cantidad] [varchar](50) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Total] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DetalleCompra] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_DetaCom]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_DetaCom]
AS
SELECT IdCompra, IdProducto, Cantidad, Fecha, Total
FROM   dbo.DetalleCompra
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] NOT NULL,
	[NombProveedor] [varchar](50) NOT NULL,
	[ApellProveedor] [varchar](50) NOT NULL,
	[Telefono] [int] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Provee]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Provee]
AS
SELECT IdProveedor, NombProveedor + ' ' + ApellProveedor AS NomPro, Telefono
FROM   dbo.Proveedor
GO
/****** Object:  Table [dbo].[Compra]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compra](
	[IdCompra] [varchar](50) NOT NULL,
	[IdProveedor] [varchar](50) NOT NULL,
	[IdSucursal] [varchar](50) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[IdCategoria] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Compra]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Compra]
AS
SELECT IdCompra, IdSucursal, Fecha, IdCategoria, IdProveedor
FROM   dbo.Compra
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[IdBitacora] [varchar](50) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Hora] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[IdActividad] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[IdBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAI]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAI](
	[Cod_CAI] [varchar](50) NOT NULL,
	[CAI] [varchar](50) NOT NULL,
	[Fecha_Inicio] [varchar](50) NOT NULL,
	[Fecha_Final] [varchar](50) NOT NULL,
	[Rango_Inicio] [varchar](50) NOT NULL,
	[Rango_Final] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CAI] PRIMARY KEY CLUSTERED 
(
	[Cod_CAI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[IdCompra] [varchar](50) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[IdCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[NombreProd] [varchar](50) NOT NULL,
	[Precio] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdMarca] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] NOT NULL,
	[NombreSucursal] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Empresa] PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [varchar](50) NOT NULL,
	[Fecha] [varchar](50) NOT NULL,
	[Hora] [varchar](50) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdEmpleado] [int] NOT NULL,
	[Cod_CAI] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ActualizarCli', N'se actualizo los registros del cliente')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ActualizarEmp', N'se actualizo un registro de empleado')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ActualizarProd', N'Se actualizo un Producto')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'actualizarProve', N'Se actualizo un proveedor')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'actualizarSu', N'Se actualizo una sucursal')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Bitaco', N'Entro  Al formulario Bitacora')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BorrarCli', N'Se Borro un cliente')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BorrarEmp', N'Se borro el registro de un empleado')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BorrarProd', N'Se borrro un producto ')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BorrarProve', N'Se borro un proveedor')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'borrarSu', N'Se borro una sucursal')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BuscarBita', N'realizo una busqueda en La Bitacora')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BuscarDetCompra', N'Se hizo una busqueda de detalle de compra')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'BuscardetVen', N'Reailizo la busqueda de una venta')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'CAI', N'Entro Al formulario CAI')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Cliente', N'Formulario Principal clientes')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Compra', N'Entro al Formulario compra')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'DetCompra', N'Entro al Detalle de compra')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'DetVenta', N'Entro Al formulario detalle de venta')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Empleado', N'Entro al fromulario de Empleado')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevaCom', N'Realizo la compra de un producto')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevaSu', N'Se registro una nueva sucursal')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevaVen', N'Se registro una nueva venta')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevoCAI', N'Se registro un nuevo talonario')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevoCli', N'Registro de nuevo cliente')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevoEmp', N'Registro un nuevo empleado')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevoProducto', N'Se registro un nuevo producto')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'NuevoProveedor', N'Se registro un nuevo proveedor')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Producto', N'Entro al formulario producto')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Proveedor', N'Entro al Formulario de Proveedor')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportCli', N'se genero un reporte de clientes')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportCom', N'Se genero unreporte de Compra')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'reportdetcom', N'se genero un reporte de detalle de compra')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportdetVen', N'Se genero un reporte de Detalle de Venta')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'reportEmp', N'se genero un reporte de Empleado')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportProd', N'Se genero un reporte de productos')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportProve', N'Se genero un reporte de Proveedor')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'ReportVenta', N'se genero un reporte de Venta')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Sucursal ', N'Entro al formulario Sucursal')
INSERT [dbo].[Actividades] ([IdActividad], [Descripcion_Actividad]) VALUES (N'Venta', N'Entro al formulario Venta')
SET IDENTITY_INSERT [dbo].[Bitaco] ON 

INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (1, N'23/04/2020', N'05:28', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (2, N'23/04/2020', N'05:38', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (3, N'23/04/2020', N'05:38', N'admin', N'NuevoCli')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (4, N'23/04/2020', N'05:38', N'admin', N'ActualizarCli')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (5, N'23/04/2020', N'05:38', N'admin', N'BorarCli')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (6, N'23/04/2020', N'08:08', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (7, N'23/04/2020', N'08:08', N'admin', N'BuscarBita')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (8, N'23/04/2020', N'08:12', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (9, N'23/04/2020', N'08:12', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (10, N'23/04/2020', N'08:13', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (11, N'23/04/2020', N'08:28', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (12, N'23/04/2020', N'08:50', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (13, N'23/04/2020', N'09:02', N'admin', N'Sucursal')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (14, N'23/04/2020', N'09:06', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (15, N'23/04/2020', N'09:09', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (16, N'23/04/2020', N'09:11', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (17, N'23/04/2020', N'09:13', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (21, N'23/04/2020', N'09:44', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (22, N'23/04/2020', N'09:54', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (23, N'23/04/2020', N'09:54', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (24, N'23/04/2020', N'09:54', N'admin', N'ActualizarProd')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (25, N'23/04/2020', N'09:59', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (26, N'23/04/2020', N'10:06', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (34, N'23/04/2020', N'10:18', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (35, N'23/04/2020', N'10:18', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (36, N'23/04/2020', N'10:18', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (37, N'23/04/2020', N'10:18', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (38, N'23/04/2020', N'10:18', N'admin', N'Sucursal')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (39, N'23/04/2020', N'10:18', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (40, N'23/04/2020', N'10:21', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (41, N'23/04/2020', N'10:21', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (48, N'23/04/2020', N'10:44', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (62, N'23/04/2020', N'11:11', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (63, N'23/04/2020', N'11:12', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (64, N'23/04/2020', N'11:12', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (65, N'23/04/2020', N'11:12', N'admin', N'NuevaVen')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (66, N'23/04/2020', N'11:12', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (67, N'23/04/2020', N'11:12', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (71, N'23/04/2020', N'11:22', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (72, N'23/04/2020', N'11:26', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (73, N'23/04/2020', N'11:26', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (74, N'23/04/2020', N'11:35', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (75, N'23/04/2020', N'11:35', N'admin', N'NuevaCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (76, N'23/04/2020', N'11:35', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (77, N'23/04/2020', N'11:36', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (78, N'23/04/2020', N'11:39', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (81, N'23/04/2020', N'11:46', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (82, N'23/04/2020', N'11:46', N'admin', N'NuevaCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (83, N'23/04/2020', N'11:46', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (84, N'23/04/2020', N'11:53', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (85, N'23/04/2020', N'11:57', N'admin', N'CAI')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (86, N'23/04/2020', N'11:57', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (87, N'23/04/2020', N'11:57', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (88, N'23/04/2020', N'11:57', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (89, N'23/04/2020', N'11:57', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (113, N'23/04/2020', N'13:57', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (114, N'23/04/2020', N'13:57', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (115, N'23/04/2020', N'13:57', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (116, N'23/04/2020', N'13:57', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (117, N'23/04/2020', N'13:57', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (118, N'23/04/2020', N'15:03', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (119, N'23/04/2020', N'15:03', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (127, N'23/04/2020', N'15:55', N'Admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (128, N'23/04/2020', N'15:55', N'Admin', N'ReportCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (18, N'23/04/2020', N'09:40', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (42, N'23/04/2020', N'10:36', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (43, N'23/04/2020', N'10:37', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (44, N'23/04/2020', N'10:37', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (19, N'23/04/2020', N'09:40', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (20, N'23/04/2020', N'09:40', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (49, N'23/04/2020', N'10:47', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (50, N'23/04/2020', N'10:47', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (51, N'23/04/2020', N'10:49', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (52, N'23/04/2020', N'10:56', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (53, N'23/04/2020', N'10:56', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (54, N'23/04/2020', N'10:56', N'admin', N'NuevaCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (55, N'23/04/2020', N'10:56', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (56, N'23/04/2020', N'10:56', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (57, N'23/04/2020', N'10:58', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (58, N'23/04/2020', N'10:58', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (59, N'23/04/2020', N'10:58', N'admin', N'Empleado')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (60, N'23/04/2020', N'10:58', N'admin', N'NuevaVen')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (61, N'23/04/2020', N'10:58', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (79, N'23/04/2020', N'11:41', N'ggg', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (80, N'23/04/2020', N'11:41', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (27, N'23/04/2020', N'10:12', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (28, N'23/04/2020', N'10:12', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (29, N'23/04/2020', N'10:12', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (30, N'23/04/2020', N'10:12', N'admin', N'ActualizarProd')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (31, N'23/04/2020', N'10:13', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (32, N'23/04/2020', N'10:13', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (33, N'23/04/2020', N'10:13', N'admin', N'Empleado')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (45, N'23/04/2020', N'10:38', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (46, N'23/04/2020', N'10:38', N'admin', N'Sucursal')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (47, N'23/04/2020', N'10:40', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (68, N'23/04/2020', N'11:13', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (69, N'23/04/2020', N'11:15', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (70, N'23/04/2020', N'11:15', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (90, N'23/04/2020', N'12:12', N'admin', N'Venta')
GO
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (91, N'23/04/2020', N'12:12', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (92, N'23/04/2020', N'12:12', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (93, N'23/04/2020', N'12:12', N'admin', N'ReportCli')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (94, N'23/04/2020', N'12:12', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (95, N'23/04/2020', N'12:12', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (96, N'23/04/2020', N'12:12', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (97, N'23/04/2020', N'12:31', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (98, N'23/04/2020', N'12:31', N'admin', N'Empleado')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (99, N'23/04/2020', N'12:31', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (100, N'23/04/2020', N'12:31', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (101, N'23/04/2020', N'12:31', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (102, N'23/04/2020', N'12:31', N'admin', N'Reportdetcom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (103, N'23/04/2020', N'12:31', N'admin', N'Sucursal')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (104, N'23/04/2020', N'12:31', N'admin', N'CAI')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (105, N'23/04/2020', N'12:40', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (106, N'23/04/2020', N'12:40', N'admin', N'NuevoCli')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (107, N'23/04/2020', N'12:40', N'admin', N'Empleado')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (108, N'23/04/2020', N'12:40', N'admin', N'NuevoEmp')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (109, N'23/04/2020', N'12:40', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (110, N'23/04/2020', N'12:40', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (111, N'23/04/2020', N'12:40', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (112, N'23/04/2020', N'12:44', N'admin', N'Bitaco')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (120, N'23/04/2020', N'15:03', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (121, N'23/04/2020', N'15:03', N'admin', N'NuevaCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (122, N'23/04/2020', N'15:03', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (123, N'23/04/2020', N'15:03', N'admin', N'Reportdetcom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (124, N'23/04/2020', N'15:03', N'admin', N'Reportdetcom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (125, N'23/04/2020', N'15:03', N'admin', N'Reportdetcom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (126, N'23/04/2020', N'15:03', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (129, N'23/04/2020', N'16:07', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (130, N'23/04/2020', N'16:07', N'admin', N'Empleado')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (131, N'23/04/2020', N'16:07', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (132, N'23/04/2020', N'16:07', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (133, N'23/04/2020', N'16:07', N'admin', N'NuevaVen')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (134, N'23/04/2020', N'16:07', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (135, N'23/04/2020', N'16:07', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (136, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (137, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (138, N'23/04/2020', N'16:07', N'admin', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (139, N'23/04/2020', N'16:07', N'admin', N'Cliente')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (140, N'23/04/2020', N'16:07', N'admin', N'NuevaVen')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (141, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (142, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (143, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (144, N'23/04/2020', N'16:07', N'admin', N'ReportVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (145, N'23/04/2020', N'16:07', N'admin', N'DetVenta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (146, N'23/04/2020', N'16:07', N'admin', N'ReportdetVen')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (147, N'23/04/2020', N'16:07', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (148, N'23/04/2020', N'16:07', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (149, N'23/04/2020', N'16:07', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (150, N'23/04/2020', N'16:07', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (151, N'23/04/2020', N'16:07', N'admin', N'Producto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (152, N'23/04/2020', N'16:07', N'admin', N'Compra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (153, N'23/04/2020', N'16:07', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (154, N'23/04/2020', N'16:07', N'admin', N'NuevoProducto')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (155, N'23/04/2020', N'16:07', N'admin', N'NuevaCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (156, N'23/04/2020', N'16:07', N'admin', N'ReportCom')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (157, N'23/04/2020', N'16:07', N'admin', N'DetCompra')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (158, N'23/04/2020', N'16:07', N'ggg', N'Venta')
INSERT [dbo].[Bitaco] ([IdBitacora], [Fecha], [Hora], [Usuario], [IdActividad]) VALUES (159, N'23/04/2020', N'16:37', N'admin', N'DetCompra')
SET IDENTITY_INSERT [dbo].[Bitaco] OFF
INSERT [dbo].[CAI] ([Cod_CAI], [CAI], [Fecha_Inicio], [Fecha_Final], [Rango_Inicio], [Rango_Final]) VALUES (N'1', N'124567890', N'01/04/2020', N'31/12/2020', N'00000', N'00999')
INSERT [dbo].[Categoria] ([IdCategoria], [Categoria]) VALUES (1, N'Pesada')
INSERT [dbo].[Categoria] ([IdCategoria], [Categoria]) VALUES (2, N'Pinturas')
INSERT [dbo].[Categoria] ([IdCategoria], [Categoria]) VALUES (3, N'Herramientas de Mano')
INSERT [dbo].[Categoria] ([IdCategoria], [Categoria]) VALUES (4, N'Electricas')
INSERT [dbo].[Clientes] ([IdCliente], [NombCliente], [ApellCliente], [Direccion], [Telefono]) VALUES (1, N'Gerson', N'escoto', N'Cofradia', 98126534)
INSERT [dbo].[Clientes] ([IdCliente], [NombCliente], [ApellCliente], [Direccion], [Telefono]) VALUES (2, N'oscar', N'guillen', N'Cofradia', 99998866)
INSERT [dbo].[Clientes] ([IdCliente], [NombCliente], [ApellCliente], [Direccion], [Telefono]) VALUES (3, N'Nahun', N'Escoto', N'Col. Rodas', 8887777)
INSERT [dbo].[Clientes] ([IdCliente], [NombCliente], [ApellCliente], [Direccion], [Telefono]) VALUES (4, N'hhh', N'hhh', N'hhh', 888)
INSERT [dbo].[Clientes] ([IdCliente], [NombCliente], [ApellCliente], [Direccion], [Telefono]) VALUES (5, N'Gabriela', N'Gonzales', N'llll', 91283948)
INSERT [dbo].[Compra] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'1', N'ggg', N'ManiDanli', N'23/4/2020', N'Pesada')
INSERT [dbo].[Compra] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'2', N'Oscar', N'Mani El Paraiso', N'23/4/2020', N'Pinturas')
INSERT [dbo].[Compra] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'3', N'ggg', N'ManiDanli', N'23/4/2020', N'Pesada')
INSERT [dbo].[Compra] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'4', N'ggg', N'ManiDanli', N'23/4/2020', N'Herramientas de Mano')
INSERT [dbo].[Compra] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'5', N'Oscar', N'ManiDanli', N'23/4/2020', N'Herramientas de Mano')
INSERT [dbo].[Compras] ([IdCompra], [IdProveedor], [IdSucursal], [Fecha], [IdCategoria]) VALUES (N'1', 1, 1, N'31/3/2020', 1)
INSERT [dbo].[Detalle Venta] ([IdVenta], [IdProducto], [Fecha], [Cantidad], [Total_Linea], [Total]) VALUES (N'1', 2, N'2/4/2020', N'6', N'900', N'1035')
INSERT [dbo].[Detalle Venta] ([IdVenta], [IdProducto], [Fecha], [Cantidad], [Total_Linea], [Total]) VALUES (N'2', 1, N'23/4/2020', N'5', N'500', N'575')
INSERT [dbo].[Detalle Venta] ([IdVenta], [IdProducto], [Fecha], [Cantidad], [Total_Linea], [Total]) VALUES (N'3', 1, N'23/4/2020', N'5', N'500', N'575')
INSERT [dbo].[Detalle Venta] ([IdVenta], [IdProducto], [Fecha], [Cantidad], [Total_Linea], [Total]) VALUES (N'4', 3, N'23/4/2020', N'5', N'1000', N'1150')
INSERT [dbo].[Detalle Venta] ([IdVenta], [IdProducto], [Fecha], [Cantidad], [Total_Linea], [Total]) VALUES (N'5', 3, N'23/4/2020', N'5', N'1000', N'1840')
INSERT [dbo].[DetalleCompra] ([IdCompra], [IdProducto], [Cantidad], [Fecha], [Total]) VALUES (N'4', 3, N'100', N'23/4/2020', N'18400')
INSERT [dbo].[DetalleCompra] ([IdCompra], [IdProducto], [Cantidad], [Fecha], [Total]) VALUES (N'5', 4, N'50', N'23/4/2020', N'4830')
INSERT [dbo].[Empleados] ([IdEmpleado], [NomEmpleado], [ApellEmpleado], [Direccion], [Telefono], [PuestoLaboral]) VALUES (1, N'Gabriel', N'Guillen', N'Esperanza', 87655609, N'Administrador')
INSERT [dbo].[Empleados] ([IdEmpleado], [NomEmpleado], [ApellEmpleado], [Direccion], [Telefono], [PuestoLaboral]) VALUES (2, N'GGG', N'hshbdha', N'bbyby', 98789798, N'Vendedor')
INSERT [dbo].[Empleados] ([IdEmpleado], [NomEmpleado], [ApellEmpleado], [Direccion], [Telefono], [PuestoLaboral]) VALUES (4, N'Leana', N'Escoto', N'Cofradia', 98777654, N'Vendedor')
INSERT [dbo].[Empleados] ([IdEmpleado], [NomEmpleado], [ApellEmpleado], [Direccion], [Telefono], [PuestoLaboral]) VALUES (5, N'Oscar ', N'Guillen', N'h', 111, N'Vendedor')
INSERT [dbo].[Empleados] ([IdEmpleado], [NomEmpleado], [ApellEmpleado], [Direccion], [Telefono], [PuestoLaboral]) VALUES (6, N'Juan', N'Perez', N'bhhj', 7827271, N'Administrador')
INSERT [dbo].[Marca] ([IdMarca], [Marca]) VALUES (1, N'Truper')
INSERT [dbo].[Marca] ([IdMarca], [Marca]) VALUES (2, N'CAT')
INSERT [dbo].[Producto] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (1, N'Martillo', N'100', N'Pesada', N'CAT', N'ggg', N'ManiDanli', 50)
INSERT [dbo].[Producto] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (2, N'Pintura', N'120', N'Pinturas', N'CAT', N'Oscar', N'Mani El Paraiso', 45)
INSERT [dbo].[Producto] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (3, N'Pala', N'200', N'Herramientas de Mano', N'Truper', N'ggg', N'ManiDanli', 90)
INSERT [dbo].[Producto] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (4, N'carreta', N'100', N'Herramientas de Mano', N'CAT', N'ggg', N'ManiDanli', 50)
INSERT [dbo].[Producto] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (5, N'Tornillos', N'5', N'Herramientas de Mano', N'Truper', N'Oscar', N'ManiDanli', 50)
INSERT [dbo].[Productos] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (1, N'Martillos', N'100', 1, 1, 1, 1, 90)
INSERT [dbo].[Productos] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (2, N'Pala', N'150', 1, 1, 1, 1, 74)
INSERT [dbo].[Productos] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (3, N'Tenaza', N'50', 1, 2, 1, 1, 0)
INSERT [dbo].[Productos] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (4, N'Tornillo', N'5', 1, 1, 1, 1, 0)
INSERT [dbo].[Productos] ([IdProducto], [NombreProd], [Precio], [IdCategoria], [IdMarca], [IdProveedor], [IdSucursal], [Stock]) VALUES (5, N'Disco', N'25', 4, 1, 1, 1, 0)
INSERT [dbo].[Proveedor] ([IdProveedor], [NombProveedor], [ApellProveedor], [Telefono]) VALUES (1, N'Oscar', N'hhh', 9988)
INSERT [dbo].[Proveedor] ([IdProveedor], [NombProveedor], [ApellProveedor], [Telefono]) VALUES (2, N'ggg', N'gjhgjgj', 890890)
INSERT [dbo].[Sucursal] ([IdSucursal], [NombreSucursal]) VALUES (1, N'ManiDanli')
INSERT [dbo].[Sucursal] ([IdSucursal], [NombreSucursal]) VALUES (2, N'Mani El Paraiso')
INSERT [dbo].[Usuario] ([NomUsuario], [Contraseña], [IdEmpleado]) VALUES (N'Admin', N'1234', 1)
INSERT [dbo].[Usuario] ([NomUsuario], [Contraseña], [IdEmpleado]) VALUES (N'ggg', N'1234', 2)
INSERT [dbo].[Venta] ([IdVenta], [Fecha], [Hora], [IdCliente], [IdEmpleado], [Cod_CAI]) VALUES (N'1', N'2/4/2020', N'15:02:23', 2, 1, N'1')
INSERT [dbo].[Venta] ([IdVenta], [Fecha], [Hora], [IdCliente], [IdEmpleado], [Cod_CAI]) VALUES (N'2', N'23/4/2020', N'10:58', 2, 1, N'1')
INSERT [dbo].[Venta] ([IdVenta], [Fecha], [Hora], [IdCliente], [IdEmpleado], [Cod_CAI]) VALUES (N'3', N'23/4/2020', N'11:12', 3, 1, N'1')
INSERT [dbo].[Venta] ([IdVenta], [Fecha], [Hora], [IdCliente], [IdEmpleado], [Cod_CAI]) VALUES (N'4', N'23/4/2020', N'16:09', 5, 1, N'1')
INSERT [dbo].[Venta] ([IdVenta], [Fecha], [Hora], [IdCliente], [IdEmpleado], [Cod_CAI]) VALUES (N'5', N'23/4/2020', N'16:12', 5, 1, N'1')
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Actividades] FOREIGN KEY([IdActividad])
REFERENCES [dbo].[Actividades] ([IdActividad])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Actividades]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Usuario] FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([NomUsuario])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Usuario]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Categoria]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_Compras_Empresa] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_Compras_Empresa]
GO
ALTER TABLE [dbo].[Detalle Venta]  WITH CHECK ADD  CONSTRAINT [FK_Detalle Venta_Venta1] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[Detalle Venta] CHECK CONSTRAINT [FK_Detalle Venta_Venta1]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Compra] FOREIGN KEY([IdCompra])
REFERENCES [dbo].[Compra] ([IdCompra])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Compra]
GO
ALTER TABLE [dbo].[DetalleCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleCompra_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleCompra] CHECK CONSTRAINT [FK_DetalleCompra_Producto]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categoria] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([IdCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categoria]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marca] FOREIGN KEY([IdMarca])
REFERENCES [dbo].[Marca] ([IdMarca])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marca]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Sucursal]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Empleados]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_CAI] FOREIGN KEY([Cod_CAI])
REFERENCES [dbo].[CAI] ([Cod_CAI])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_CAI]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Clientes1] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Clientes1]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleados] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleados]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCliente]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarCliente]
@IdCliente int,
@NombreCliente varchar(50),
@ApellidoCliente varchar (50),
@Direccion varchar (50),
@Telefono int

as
update Clientes set NombCliente = @NombreCliente, ApellCliente=@ApellidoCliente, Direccion=@Direccion, Telefono=@Telefono
where IdCliente = @IdCliente
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEmpleado]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarEmpleado]
@IdEmpleado int,
@NombreEmpleado varchar(50),
@ApellidoEmpleado varchar (50),
@Direccion varchar (50),
@Telefono int,
@Puesto varchar (50)

as
update Empleados
set NomEmpleado=@NombreEmpleado, ApellEmpleado=@ApellidoEmpleado,Direccion=@Direccion,Telefono=@Telefono,PuestoLaboral=@Puesto
where IdEmpleado=@IdEmpleado
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProd]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[ActualizarProd]
@IdProducto int,
@NombreProducto varchar(50),
@Precio varchar (50),
@IdCategoria varchar(50),
@IdMarca varchar(50) , 
@IdProveedor varchar(50),
@IdSucursal	varchar(50),
@Stock int

as
update Producto set NombreProd=@NombreProducto,Precio=@Precio,IdCategoria=@IdCategoria,IdMarca=@IdMarca,IdProveedor=@IdProveedor,IdSucursal=@IdSucursal,Stock=@Stock
where IdProducto = @IdProducto
GO
/****** Object:  StoredProcedure [dbo].[ActualizarProveedor]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[ActualizarProveedor]
  @IdProveedor int,
 @NombreProveedor varchar(50),
 @ApellidoProveedor varchar(50),
 @Telefono int

 as
 update Proveedor
 set NombProveedor=@NombreProveedor, ApellProveedor=@ApellidoProveedor,Telefono=@Telefono
 where IdProveedor=@IdProveedor
GO
/****** Object:  StoredProcedure [dbo].[AtualizarProd]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[AtualizarProd]
@IdProducto int,
@NombreProducto varchar(50),
@Precio varchar (50),
@IdCategoria varchar(50),
@IdMarca varchar(50) , 
@IdProveedor varchar(50),
@IdSucursal	varchar(50),
@Stock int

as
update Producto set NombreProd=@NombreProducto,Precio=@Precio,IdCategoria=@IdCategoria,IdMarca=@IdMarca,IdProveedor=@IdProveedor,IdSucursal=@IdSucursal,Stock=@Stock
where IdProducto = @IdProducto
GO
/****** Object:  StoredProcedure [dbo].[FacturaVentas]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[FacturaVentas]
@id int
as
begin
SELECT Venta.IdVenta, Venta.Fecha, Venta.Hora, Venta.Cod_CAI, Clientes.IdCliente, Clientes.NombCliente + ' ' + Clientes.ApellCliente AS NombreCliente, Empleados.IdEmpleado,Empleados.NomEmpleado + ' ' +Empleados.ApellEmpleado AS NombreEmpleados, [Detalle Venta].Cantidad, 
                  [Detalle Venta].Total_Linea, [Detalle Venta].Total, Productos.IdProducto, Productos.NombreProd, Productos.Precio
FROM     Venta INNER JOIN
                  Clientes ON Venta.IdCliente = Clientes.IdCliente INNER JOIN
                  Empleados ON Venta.IdEmpleado = Empleados.IdEmpleado INNER JOIN
                  [Detalle Venta] ON Venta.IdVenta = [Detalle Venta].IdVenta INNER JOIN
                  Productos ON [Detalle Venta].IdProducto = Productos.IdProducto
WHERE Venta.IdVenta=@id
end
GO
/****** Object:  StoredProcedure [dbo].[RegistroCliente]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegistroCliente]
@IdCliente int,
@NombreCliente varchar(50),
@ApellidoCliente varchar (50),
@Direccion varchar (50),
@Telefono int

as
insert into Clientes(IdCliente,NombCliente,ApellCliente,Direccion,Telefono) 
Values (@IdCliente,@NombreCliente,@ApellidoCliente,@Direccion,@Telefono)
GO
/****** Object:  StoredProcedure [dbo].[RegistroEmpleado]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegistroEmpleado]
@IdEmpleado int,
@NombreEmpleado varchar(50),
@ApellidoEmpleado varchar (50),
@Direccion varchar (50),
@Telefono int,
@Puesto varchar (50)

as
insert into Empleados(IdEmpleado,NomEmpleado,ApellEmpleado,Direccion,Telefono,PuestoLaboral) 
Values (@IdEmpleado,@NombreEmpleado,@ApellidoEmpleado,@Direccion,@Telefono,@Puesto)
GO
/****** Object:  StoredProcedure [dbo].[RegistroProd]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	Create proc [dbo].[RegistroProd]
@IdProducto int,
@NombreProducto varchar(50),
@Precio varchar (50),
@IdCategoria varchar(50),
@IdMarca varchar(50) , 
@IdProveedor varchar(50),
@IdSucursal	varchar(50),
@Stock int

as
 insert into Producto(IdProducto,NombreProd,Precio,IdCategoria,IdMarca,IdProveedor,IdSucursal,Stock)
 values (@IdProducto,@NombreProducto,@Precio,@IdCategoria,@IdMarca,@IdProveedor,@IdSucursal,@Stock)
GO
/****** Object:  StoredProcedure [dbo].[RegistroProducts]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[RegistroProducts]
@IdProducto int,
@NombreProducto varchar(50),
@Precio varchar (50),
@IdCategoria varchar(50),
@IdMarca varchar(50) , 
@IdProveedor varchar(50),
@IdSucursal	varchar(50),
@Stock int

as
 insert into Producto(IdProducto,NombreProd,Precio,IdCategoria,IdMarca,IdProveedor,IdSucursal,Stock)
 values (@IdProducto,@NombreProducto,@Precio,@IdCategoria,@IdMarca,@IdProveedor,@IdSucursal,@Stock)
GO
/****** Object:  StoredProcedure [dbo].[RegistroProveedor]    Script Date: 23/4/2020 16:39:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[RegistroProveedor]
 @IdProveedor int,
 @NombreProveedor varchar(50),
 @ApellidoProveedor varchar(50),
 @Telefono int

 as

 insert into Proveedor(IdProveedor,NombProveedor,ApellProveedor,Telefono)
 values (@IdProveedor,@NombreProveedor,@ApellidoProveedor,@Telefono)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuario"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 179
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Empleados"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Usu_Emp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'V_Usu_Emp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Bitaco"
            Begin Extent = 
               Top = 12
               Left = 437
               Bottom = 209
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Actividades"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 152
               Right = 334
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Bitaco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Bitaco'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Clientes"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 2120
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Cliente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Compra"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Compra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Compra'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetalleCompra"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DetaCom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DetaCom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Detalle Venta"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DetaVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_DetaVenta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Empleados"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 281
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Emplea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Emplea'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Producto"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Marca"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 152
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categoria"
            Begin Extent = 
               Top = 9
               Left = 615
               Bottom = 152
               Right = 837
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Proveedor"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 294
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
         Width = 1000
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Provee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Provee'
GO
USE [master]
GO
ALTER DATABASE [FerreteriaM] SET  READ_WRITE 
GO
