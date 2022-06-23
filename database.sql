USE [store]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 19.06.2022 17:44:34 ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 19.06.2022 17:44:34 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 19.06.2022 17:44:34 ******/
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

INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (1, N'ginger228           ', 1, N'asdasdsad                                                                                           ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (2, N'ginger228           ', 1, N'i wanna                                                                                          ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (3, N'ginger228           ', 4, N' me pls                                                                                        ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (4, N'ginger228           ', 4, N'wwww                                                                                                ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (5, N'ginger228           ', 1, N'i wanna                                                                                          ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (6, N'ginger228           ', 1, N'asdasdsad                                                                                           ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (7, N'ginger228           ', 3, N' me pls                                                                                        ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (8, N'ginger228           ', 4, N' me pls                                                                                        ')
INSERT [dbo].[Orders] ([order_id], [login], [good_id], [comment]) VALUES (11, N'idiot               ', 6, N'22ww                                                                                                ')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'123                 ', N'qqqq                ', N'ass                 ', N'gfds                                                                                                ', N'54212               ', N'email@gmail.com                                   ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'dsad                ', N'sadasd              ', N'dasd                ', N'asd                                                                                                 ', N'asdasd              ', N'sdaasd                                            ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'ginger228           ', N'1234                ', N'qqq                 ', N'wwwwwww                                                                                             ', N'213213              ', N'email@gmail.com                                   ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'ginger2283          ', N'1234                ', N'sadasd              ', N'asdasd                                                                                              ', N'asdasd              ', N'dsfdf                                             ')
INSERT [dbo].[Users] ([login], [password], [user_name], [address], [phone], [email]) VALUES (N'idiot               ', N'4321                ', N'jojo                ', N'Mozart 58                                                                                           ', N'54234               ', N'idk@gmail.com                                     ')
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
