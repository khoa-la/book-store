USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 7/14/2021 11:07:03 AM ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BookManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookManagement] SET QUERY_STORE = OFF
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblCategory] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NULL,
	[productID] [int] NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
 CONSTRAINT [PK_tblOrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[email] [nvarchar](50) NULL,
	[userID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[totalMoney] [money] NULL,
	[orderDate] [date] NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[author] [nvarchar](50) NULL,
	[categoryID] [int] NULL,
	[price] [money] NULL,
	[quantity] [int] NULL,
	[statusID] [int] NULL,
	[createDate] [date] NULL,
	[image] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[statusID] [int] NOT NULL,
	[statusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/14/2021 11:07:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[createDate] [date] NULL,
	[roleID] [nvarchar](50) NULL,
	[statusID] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (1, N'Business & Investing')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (2, N'Cookbooks, Food & Wine')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (3, N'History
')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (4, N'Romance
')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (5, N'Teens & Young Adult')
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1, 1, 14, 2, 6.4000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (2, 1, 10, 1, 14.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (3, 2, 1, 8, 24.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1002, 1002, 23, 2, 9.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1003, 1002, 1, 2, 24.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1004, 1002, 2, 1, 14.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1005, 1002, 7, 1, 9.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1006, 1003, 12, 1, 10.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1007, 1003, 21, 4, 9.9900)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1008, 1004, 1, 1, 25.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1009, 1004, 6, 1, 17.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1010, 1005, 15, 1, 8.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1011, 1005, 19, 1, 10.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1012, 1006, 1, 1, 25.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1013, 1006, 2, 2, 15.0000)
INSERT [dbo].[tblOrderDetail] ([orderDetailID], [orderID], [productID], [quantity], [price]) VALUES (1014, 1006, 17, 1, 10.0000)
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1, N'duyen@gmail.com', N'user2', N'Ho Chi Minh', N'0154876825', 27.7900, CAST(N'2021-07-04' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (2, N'khoa@gmail.com', N'user1', N'HCM', N'0135487954', 199.9200, CAST(N'2021-07-04' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1002, N'adam@gmail.com', N'user6', N'Ho Chi Minh', N'0124588599', 94.9400, CAST(N'2021-07-05' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1003, N'haianh@gmail.com', N'user5', N'Ho Chi Minh', N'0455558888', 50.9500, CAST(N'2021-07-05' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1004, N'khoa@gmail.com', N'user1', N'7/6', N'0224578645', 42.0000, CAST(N'2021-07-06' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1005, N'khoa@gmail.com', N'user1', N'New York', N'1248765484', 18.0000, CAST(N'2021-07-07' AS Date), 1)
INSERT [dbo].[tblOrders] ([orderID], [email], [userID], [address], [phone], [totalMoney], [orderDate], [statusID]) VALUES (1006, N'diep@gmail.com', N'user7', N'hcm', N'0145687888', 65.0000, CAST(N'2021-07-14' AS Date), 1)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[tblProducts] ON 

INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (1, N'Rich Dad Poor Dad', N'Robert T. Kiyosaki', 1, 25.0000, 8, 1, CAST(N'2021-07-14' AS Date), N'rich-dad-poor-dad.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (2, N'We Should All Be Millionaires', N'Rachel Rodgers', 1, 15.0000, 8, 1, CAST(N'2021-07-14' AS Date), N'we-should -all-be-millionaires.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (3, N'Atomic Habits', N'James Clear', 1, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'atomic-habits.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (4, N'Maverick: A Biography of Thomas Sowell', N'Jason L Riley', 1, 18.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'maverick-a-biography-of-thomas-sowell.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (5, N'Rodney Scott''s World of BBQ', N' Rodney Scott', 2, 15.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'rodney-scotts-world-of-bbq.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (6, N'Eat Better, Feel Better', N'Giada De Laurentiis', 2, 17.0000, 9, 1, CAST(N'2021-07-06' AS Date), N'eat-better-feel-better.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (7, N'From Crook to Cook', N' Snoop Dogg', 2, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'from-crook-to-cook.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (8, N'A Promised Land', N'Barack Obam', 3, 18.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'a-promised-land.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (9, N'Killing the Mob', N'Bill O''Reilly', 3, 15.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'killing-the-mob.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (10, N'Frankly, We Did Win This Election', N'Michael C. Bender', 3, 15.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'frankly-we-did-win-this-election.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (11, N'Becoming', N'Michelle Obama', 3, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'becoming.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (12, N'Little Leaders', N'Vashti Harrison', 3, 11.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'little-leaders.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (13, N'People We Meet on Vacation', N'Emily Henry ', 4, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'people-we-meet-on-vacation.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (14, N'Beach Read', N'Emily Henry', 4, 7.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'beach-read.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (15, N'The Hating Game', N'Sally Thorne', 4, 8.0000, 9, 1, CAST(N'2021-07-07' AS Date), N'the-hating-game.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (16, N'Heartless', N'Gena Showalter', 4, 7.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'heartless.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (17, N'Harry Potter and the Sorcerer''s Stone, Book 1 ', N'J.K. Rowling', 5, 10.0000, 9, 1, CAST(N'2021-07-14' AS Date), N'harry-potter-and-the-sorcerers-stone-book-1.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (18, N'Harry Potter and the Chamber of Secrets, Book 2 ', N'J.K. Rowling', 5, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'harry-potter-and-the-chamber-of-secrets-book-2.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (19, N'Harry Potter and the Prisoner of Azkaban, Book 3', N'J.K. Rowling', 5, 10.0000, 9, 1, CAST(N'2021-07-07' AS Date), N'harry-potter-and-the-prisoner-of-azkaban-book-3.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (20, N'Harry Potter and the Goblet of Fire, Book 4', N'J.K. Rowling', 5, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'harry-potter-and-the-goblet-of-fire-book-4.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (21, N'Harry Potter and the Order of the Phoenix, Book 5', N'J.K. Rowling', 5, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'harry-potter-and-the-order-of-the-phoenix-book-5.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (22, N'Harry Potter and the Half-Blood Prince, Book 6', N'J.K. Rowling', 5, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'harry-potter-and-the-half-blood-prince-book-6.jpg')
INSERT [dbo].[tblProducts] ([productID], [productName], [author], [categoryID], [price], [quantity], [statusID], [createDate], [image]) VALUES (23, N'Harry Potter and the Deathly Hallows, Book 7', N'J.K. Rowling', 5, 10.0000, 10, 1, CAST(N'2021-07-06' AS Date), N'harry-potter-and-the-deathly-hallows-book-7.jpg')
SET IDENTITY_INSERT [dbo].[tblProducts] OFF
GO
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'AD', N'Admin')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'User')
GO
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (0, N'Not Available')
INSERT [dbo].[tblStatus] ([statusID], [statusName]) VALUES (1, N'Available')
GO
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'admin', N'Admin', N'1', N'0000000000', N'admin@gmail.com', CAST(N'2021-07-06' AS Date), N'AD', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user1', N'Le Anh Khoa', N'1', N'0373508844', N'khoa@gmail.com', CAST(N'2021-07-05' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user2', N'Trần Ngọc Duyên', N'1', N'0123456789', N'ngocduyenn@gmail.com', CAST(N'2021-07-05' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user3', N'Nguyễn Uy Bảo', N'1', N'0154876543', N'bao@gmail.com', CAST(N'2021-07-05' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user4', N'Đào Minh Thảo Vy', N'1', N'0454786154', N'thaovy@gmail.com', CAST(N'2021-07-05' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user5', N'Lương Hải Anh', N'1', N'0546879544', N'haianh@gmail.com', CAST(N'2021-07-05' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user6', N'Adam', N'1', N'0145587985', N'adam@gmail.com', CAST(N'2021-07-06' AS Date), N'US', 1)
INSERT [dbo].[tblUsers] ([userID], [name], [password], [phone], [email], [createDate], [roleID], [statusID]) VALUES (N'user7', N'Huyền Diệp', N'1', N'0145687888', N'diep@gmail.com', CAST(N'2021-07-14' AS Date), N'US', 1)
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblOrders]
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetail_tblProducts] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK_tblOrderDetail_tblProducts]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblStatus]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategory] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblCategory]
GO
ALTER TABLE [dbo].[tblProducts]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblProducts] CHECK CONSTRAINT [FK_tblProducts_tblStatus]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[tblStatus] ([statusID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
