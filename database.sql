USE [master]
GO
/****** Object:  Database [store]    Script Date: 24.06.2022 11:55:28 ******/
CREATE DATABASE [store]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\store_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [store] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store] SET ARITHABORT OFF 
GO
ALTER DATABASE [store] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [store] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store] SET  DISABLE_BROKER 
GO
ALTER DATABASE [store] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store] SET RECOVERY FULL 
GO
ALTER DATABASE [store] SET  MULTI_USER 
GO
ALTER DATABASE [store] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [store] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'store', N'ON'
GO
ALTER DATABASE [store] SET QUERY_STORE = OFF
GO
USE [store]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 24.06.2022 11:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[good_id] [int] IDENTITY(1,1) NOT NULL,
	[good_name] [nchar](20) NOT NULL,
	[description] [nchar](30) NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[good_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24.06.2022 11:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[login] [nchar](20) NOT NULL,
	[good_id] [int] NOT NULL,
	[comment] [nchar](100) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 24.06.2022 11:55:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[login] [nchar](20) NOT NULL,
	[password] [nchar](20) NOT NULL,
	[user_name] [nchar](20) NOT NULL,
	[address] [nchar](100) NOT NULL,
	[phone] [nchar](20) NOT NULL,
	[email] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([good_id], [good_name], [description], [price]) VALUES (1, N'Car                 ', N'Vehicle                       ', 5000)
INSERT [dbo].[Goods] ([good_id], [good_name], [description], [price]) VALUES (2, N'Phone               ', N'Device                        ', 300)
INSERT [dbo].[Goods] ([good_id], [good_name], [description], [price]) VALUES (3, N'Milk                ', N'Beverage                      ', 5)
INSERT [dbo].[Goods] ([good_id], [good_name], [description], [price]) VALUES (4, N'Toy                 ', N'For Kids                      ', 10)
INSERT [dbo].[Goods] ([good_id], [good_name], [description], [price]) VALUES (6, N'Cigarettes          ', N'Can be smoked                 ', 3)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (2, N'ginger228           ', 1, N'aaaaa                                                                                               ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (3, N'ginger228           ', 4, N'good 4                                                                                              ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (4, N'ginger228           ', 4, N'good 4 again                                                                                        ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (5, N'ginger228           ', 1, N'and good 1                                                                                          ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (6, N'ginger228           ', 1, N'another good 1                                                                                      ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (7, N'ginger228           ', 3, N'good 3 pls                                                                                          ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (8, N'ginger228           ', 4, N'good 4                                                                                              ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (11, N'chiot               ', 6, N'good 6 for me                                                                                       ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'123                 ', N'qqqq                ', N'ass                 ', N'gfds                                                                                                ', N'54212               ', N'email@gmail.com                                   ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'dsad                ', N'sadasd              ', N'dasd                ', N'asd                                                                                                 ', N'asdasd              ', N'sdaasd                                            ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'ginger228           ', N'1234                ', N'name                ', N'address                                                                                             ', N'12345               ', N'idk@gmail.com                                     ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'ginger2283          ', N'1234                ', N'sadasd              ', N'asdasd                                                                                              ', N'asdasd              ', N'dsfdf                                             ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'chiot               ', N'4321                ', N'jojo                ', N'Mozart 58                                                                                           ', N'54234               ', N'idk@gmail.com                                     ')
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Goods] FOREIGN KEY([good_id])
REFERENCES [dbo].[Goods] ([good_id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Goods]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([login])
REFERENCES [dbo].[Users] ([login])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users] FOREIGN KEY([login])
REFERENCES [dbo].[Users] ([login])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Users]
GO
USE [master]
GO
ALTER DATABASE [store] SET  READ_WRITE 
GO
