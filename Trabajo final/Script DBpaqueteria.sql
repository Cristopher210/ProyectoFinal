USE [master]
GO
/****** Object:  Database [PaqueteData]    Script Date: 17/12/2022 7:30:14 p. m. ******/
CREATE DATABASE [PaqueteData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PaqueteData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PaqueteData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PaqueteData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\PaqueteData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PaqueteData] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PaqueteData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PaqueteData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PaqueteData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PaqueteData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PaqueteData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PaqueteData] SET ARITHABORT OFF 
GO
ALTER DATABASE [PaqueteData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PaqueteData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PaqueteData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PaqueteData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PaqueteData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PaqueteData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PaqueteData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PaqueteData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PaqueteData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PaqueteData] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PaqueteData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PaqueteData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PaqueteData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PaqueteData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PaqueteData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PaqueteData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PaqueteData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PaqueteData] SET RECOVERY FULL 
GO
ALTER DATABASE [PaqueteData] SET  MULTI_USER 
GO
ALTER DATABASE [PaqueteData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PaqueteData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PaqueteData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PaqueteData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PaqueteData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PaqueteData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PaqueteData', N'ON'
GO
ALTER DATABASE [PaqueteData] SET QUERY_STORE = OFF
GO
USE [PaqueteData]
GO
/****** Object:  Table [dbo].[Table_cliente]    Script Date: 17/12/2022 7:30:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_cliente](
	[ID_cliente] [int] NOT NULL,
	[Nombre_del_cliente] [varchar](100) NULL,
	[ID_pedido_del_cliente] [int] NOT NULL,
	[NIT_factura] [int] NOT NULL,
	[Nombre_del_pedido] [varchar](100) NULL,
 CONSTRAINT [PK_Table_cliente] PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Empleados]    Script Date: 17/12/2022 7:30:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Empleados](
	[ID_empleado] [int] NOT NULL,
	[Nombre_empleado] [varchar](100) NULL,
	[Puesto_empleado] [varchar](100) NULL,
	[Keys_para_hacceder_a_pedidos] [int] NULL,
 CONSTRAINT [PK_Table_Empleados] PRIMARY KEY CLUSTERED 
(
	[ID_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Factura]    Script Date: 17/12/2022 7:30:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Factura](
	[NIT_factura] [int] NOT NULL,
	[ID_pedido] [int] NOT NULL,
	[Nombre_del_pedido] [varchar](100) NULL,
	[ID_localidad_pedido] [int] NOT NULL,
	[ID_cliente] [int] NOT NULL,
	[Nombre_del_cliente] [varchar](100) NULL,
	[Precio_a_pagar_por_el_cervicio] [int] NOT NULL,
 CONSTRAINT [PK_Table_Factura] PRIMARY KEY CLUSTERED 
(
	[NIT_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Origen_de_exportaccion]    Script Date: 17/12/2022 7:30:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Origen_de_exportaccion](
	[ID_Localidad_pedido] [int] NOT NULL,
	[ID_pedido] [int] NOT NULL,
	[Nombre_del_pedido] [varchar](100) NULL,
	[Lugar_de_donde_viene] [varchar](100) NULL,
	[NIT_factura] [int] NOT NULL,
 CONSTRAINT [PK_Table_Origen_de_exportaccion] PRIMARY KEY CLUSTERED 
(
	[ID_Localidad_pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Table_Pedido]    Script Date: 17/12/2022 7:30:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table_Pedido](
	[ID_Pedido] [int] NOT NULL,
	[Nombre_Del_Pedido] [varchar](100) NULL,
	[Dueño_del_pedido] [varchar](100) NULL,
	[ID_Dueño_del_pedido] [int] NOT NULL,
	[NIT_faactura] [int] NOT NULL,
 CONSTRAINT [PK_Table_Pedido] PRIMARY KEY CLUSTERED 
(
	[ID_Pedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PaqueteData] SET  READ_WRITE 
GO
