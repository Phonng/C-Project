USE [PRN292_Project]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/26/2018 11:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maker]    Script Date: 7/26/2018 11:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maker](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](150) NOT NULL,
	[Website] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Maker] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/26/2018 11:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[DeliveredDate] [date] NULL,
	[DueDate] [date] NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Pay]    Script Date: 7/26/2018 11:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Pay](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[PaymentStatus] [bit] NOT NULL,
	[AccountNumber] [nvarchar](15) NULL,
 CONSTRAINT [PK_Order_Pay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/26/2018 11:06:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Total] [float] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentMethod]    Script Date: 7/26/2018 11:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/26/2018 11:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[DateImported] [date] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[TotalSold] [int] NOT NULL,
	[TotalLeft] [int] NOT NULL,
	[Image] [nvarchar](350) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[MakerID] [int] NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 7/26/2018 11:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/26/2018 11:06:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[FullName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Category]) VALUES (1, N'Guitar')
INSERT [dbo].[Category] ([ID], [Category]) VALUES (2, N'Phụ kiện')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Maker] ON 

INSERT [dbo].[Maker] ([ID], [Name], [Description], [Website]) VALUES (3, N'Alice', N'Nothing', N'www.guitar.alice.net')
INSERT [dbo].[Maker] ([ID], [Name], [Description], [Website]) VALUES (4, N'Elixir', N'Famous brand', N'abc.xyz')
SET IDENTITY_INSERT [dbo].[Maker] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (4, 1, CAST(N'2018-07-20' AS Date), CAST(N'2018-07-30' AS Date), CAST(N'2018-07-20' AS Date), 30000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (5, 2, CAST(N'2018-10-10' AS Date), CAST(N'2018-11-11' AS Date), CAST(N'2018-10-10' AS Date), 40000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (6, 1, CAST(N'2010-10-10' AS Date), CAST(N'2011-11-11' AS Date), CAST(N'2012-11-11' AS Date), 25000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (7, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (8, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (9, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (10, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (11, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (12, 2, CAST(N'2018-07-25' AS Date), NULL, NULL, 5600000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (13, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 2000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (14, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 2000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (15, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 8000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (16, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 9000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (17, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 6000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (18, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 4000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (19, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 4000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (20, 2, CAST(N'2018-07-26' AS Date), NULL, NULL, 2000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (21, 3, CAST(N'2018-07-26' AS Date), NULL, NULL, 3000000)
INSERT [dbo].[Order] ([ID], [UserID], [OrderDate], [DeliveredDate], [DueDate], [Total]) VALUES (22, 3, CAST(N'2018-07-26' AS Date), NULL, NULL, 1000000)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Order_Pay] ON 

INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (2, 4, 1, 0, NULL)
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (3, 5, 2, 0, NULL)
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (4, 6, 1, 1, NULL)
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (5, 5, 2, 0, N'0393939393993')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (6, 11, 2, 0, N'3030303030033')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (7, 12, 2, 0, N'938893483948')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (9, 14, 2, 0, N'3043909403493')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (10, 15, 1, 0, NULL)
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (11, 16, 2, 0, N'3943849384348')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (12, 17, 2, 0, N'223232323232')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (13, 18, 2, 0, N'2323232323232')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (14, 19, 2, 1, N'231132321323232')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (15, 20, 2, 0, N'')
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (16, 21, 1, 0, NULL)
INSERT [dbo].[Order_Pay] ([ID], [OrderID], [PaymentMethodID], [PaymentStatus], [AccountNumber]) VALUES (17, 22, 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[Order_Pay] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (1, 5, 1, 3, 5600000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (2, 5, 1, 3, 5600000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (3, 11, 1, 3, 5600000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (4, 12, 1, 3, 5600000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (5, 13, 1, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (6, 14, 1, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (7, 15, 1, 8, 8000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (8, 16, 1, 4, 4000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (9, 16, 2, 1, 1000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (10, 16, 4, 4, 4000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (11, 17, 1, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (12, 17, 5, 2, 4000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (13, 18, 1, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (14, 18, 2, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (15, 19, 1, 4, 4000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (16, 20, 2, 2, 2000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (17, 21, 2, 3, 3000000)
INSERT [dbo].[OrderDetail] ([ID], [OrderID], [ProductID], [Quantity], [Total]) VALUES (18, 22, 2, 1, 1000000)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[PaymentMethod] ON 

INSERT [dbo].[PaymentMethod] ([ID], [PaymentMethod]) VALUES (1, N'Cash On Delivery')
INSERT [dbo].[PaymentMethod] ([ID], [PaymentMethod]) VALUES (2, N'Credit Card')
INSERT [dbo].[PaymentMethod] ([ID], [PaymentMethod]) VALUES (3, N'Bank Transfer')
SET IDENTITY_INSERT [dbo].[PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (1, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (2, N'Guitar Classic Station CL-370', CAST(N'2018-01-01' AS Date), N'Toàn bộ gỗ nguyên miếng (full solid), sử dụng càng lâu âm thanh càng hay, đó là đặc điểm "ăn tiền" của gỗ nguyên miếng.CL-370 là dòng đàn chuyên dùng cho các bạn chơi solo cổ điển, thích âm thanh trầm ấm của guitar classic. CL-370 âm thanh vang sáng, tiếng ấm vừa đủ, treb thanh.Sản phẩm được bảo hành 1 năm, bảo trì trọn đời.', 10, 1, N'https://guitar.station.vn/wp-content/uploads/2018/03/dan-guitar-classic-cong-cuom.jpg', 1, 4, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (3, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (4, N'Guitar Classic Station CL-370', CAST(N'2018-01-01' AS Date), N'Toàn bộ gỗ nguyên miếng (full solid), sử dụng càng lâu âm thanh càng hay, đó là đặc điểm "ăn tiền" của gỗ nguyên miếng.CL-370 là dòng đàn chuyên dùng cho các bạn chơi solo cổ điển, thích âm thanh trầm ấm của guitar classic. CL-370 âm thanh vang sáng, tiếng ấm vừa đủ, treb thanh.Sản phẩm được bảo hành 1 năm, bảo trì trọn đời.', 10, 1, N'https://guitar.station.vn/wp-content/uploads/2018/03/dan-guitar-classic-cong-cuom.jpg', 1, 4, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (5, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (6, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (7, N'Equalizer ID 7', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://image.dhgate.com/0x0/f2/albu/g5/M00/93/F9/rBVaJFkk9S-ASqUOAAGOZUsd0ho079.jpg', 6, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (8, N'Pickup ID 8', CAST(N'2018-07-15' AS Date), N'Specifications:

Feature:
- Tone and volume control.
- With phase and tuner function, built-in reverb, delay, chrous and wide effects.
- Installed on the acoustic instruments (such as folk guitar, classical guitar, etc.) for PA, the original sound into acoustic.
- The volume is enlarged, and the effect can be used together with the effect device to enrich the sound of the instrument.
- The product is easy to install and high fidelity to the original sound.
- The use of simple, easy to understand the function.

Input Impedance: 10M

Frequency Response: 20Hz - 20KHz

Control Range: Low: +/ -12dB at 100Hz; Middle: +/ -12dB at 800Hz; High: +/ -12dB at 3KHz

Low Battery Check: LED

Power Supply: 9V Alkaline Battery (not included)

Pick-up: Piezo ceramic pick-up

Dimension: 80 * 55 * 50mm

Item Weight: 129g

Note:
- Please allow 1-5mm error due to manual measurement and make sure you do not mind before ordering.
- The batteries are not included.

Package Weight : 166(g) / 5.86(oz)

Package Dimensions(Length*Width*High) : 200(mm)*145(mm)*50(mm) / 7.87(in)*5.71(in)*1.97(in)

Retail Packaging: No, No Packing

TOP_MIA_23O

Package Include:

1 * EQ

1 * Battery box

1 * Pickup line

6 * Mounting Screws', 10, 10, N'https://cdn.shopify.com/s/files/1/1013/8813/products/ibeam-acoustic-guitar-pickup-slide3_grande.jpeg?v=1452986037', 7, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (9, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (10, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (11, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (12, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (13, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (14, N'Guitar Classic Station CL-370', CAST(N'2018-01-01' AS Date), N'Toàn bộ gỗ nguyên miếng (full solid), sử dụng càng lâu âm thanh càng hay, đó là đặc điểm "ăn tiền" của gỗ nguyên miếng.CL-370 là dòng đàn chuyên dùng cho các bạn chơi solo cổ điển, thích âm thanh trầm ấm của guitar classic. CL-370 âm thanh vang sáng, tiếng ấm vừa đủ, treb thanh.Sản phẩm được bảo hành 1 năm, bảo trì trọn đời.', 10, 1, N'https://guitar.station.vn/wp-content/uploads/2018/03/dan-guitar-classic-cong-cuom.jpg', 1, 4, 1000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (15, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (16, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (17, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 4, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (18, N'Đàn Guitar Acoustic FENDER – FA-100', CAST(N'2018-07-15' AS Date), N'Nổi bật trong tầm giá dưới 3 triệu
Dòng đàn bất hủ của FENDER, FA-100 luôn là lựa chọn hàng đầu của những người mới tập chơi muốn sử dụng thương hiệu FENDER. FA-100 là lựa chọn cơ bản, mức giá thấp nhất và cây này xứng đáng được gọi là cây đàn dành cho người mới tập chơi, là món ngon mà người mới chơi không nên bỏ qua.

Thế mạnh nổi bật nhất của FA-100 đó là sự gia công chi tiết, tỉ mỉ được làm bằng máy với sự chính xác gần như tuyệt đối. Phím của FA-100 được gia công rất tốt và rất mượt, trơn láng, rất khó bị rè dây so với các dòng đàn cùng tầm giá của Việt Nam.

Chất lượng âm thanh, vẻ đẹp gia công, độ bền sản phẩm rất tốt. Thiết kế dáng D mạnh mẽ, lớp sơn bóng mượt, dàn phím chuẩn vì được hoàn thiện 100% bằng máy với độ chính xác cao. Âm thanh vang sáng, phù hợp chơi đệm hát từ cơ bản đến nâng cao.

Sản phẩm chính hãng 100%. Sản phẩm được bảo hành 1 năm & bảo trì trọn đời. ', 10, 10, N'https://guitar.station.vn/wp-content/uploads/2018/06/Fender-FA-100-Dreadnought-Acoustic-Guitar-with-Gig-Bag-Natural-0-360x360.jpg', 2, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (19, N'Equalizer ID 19', CAST(N'2018-07-15' AS Date), N'Specifications:

Feature:
- Tone and volume control.
- With phase and tuner function, built-in reverb, delay, chrous and wide effects.
- Installed on the acoustic instruments (such as folk guitar, classical guitar, etc.) for PA, the original sound into acoustic.
- The volume is enlarged, and the effect can be used together with the effect device to enrich the sound of the instrument.
- The product is easy to install and high fidelity to the original sound.
- The use of simple, easy to understand the function.

Input Impedance: 10M

Frequency Response: 20Hz - 20KHz

Control Range: Low: +/ -12dB at 100Hz; Middle: +/ -12dB at 800Hz; High: +/ -12dB at 3KHz

Low Battery Check: LED

Power Supply: 9V Alkaline Battery (not included)

Pick-up: Piezo ceramic pick-up

Dimension: 80 * 55 * 50mm

Item Weight: 129g

Note:
- Please allow 1-5mm error due to manual measurement and make sure you do not mind before ordering.
- The batteries are not included.

Package Weight : 166(g) / 5.86(oz)

Package Dimensions(Length*Width*High) : 200(mm)*145(mm)*50(mm) / 7.87(in)*5.71(in)*1.97(in)

Retail Packaging: No, No Packing

TOP_MIA_23O

Package Include:

1 * EQ

1 * Battery box

1 * Pickup line

6 * Mounting Screws', 10, 10, N'https://image.dhgate.com/0x0/f2/albu/g5/M00/93/F9/rBVaJFkk9S-ASqUOAAGOZUsd0ho079.jpg', 6, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (20, N'Equalizer ID 20', CAST(N'2018-07-15' AS Date), N'Specifications:

Feature:
- Tone and volume control.
- With phase and tuner function, built-in reverb, delay, chrous and wide effects.
- Installed on the acoustic instruments (such as folk guitar, classical guitar, etc.) for PA, the original sound into acoustic.
- The volume is enlarged, and the effect can be used together with the effect device to enrich the sound of the instrument.
- The product is easy to install and high fidelity to the original sound.
- The use of simple, easy to understand the function.

Input Impedance: 10M

Frequency Response: 20Hz - 20KHz

Control Range: Low: +/ -12dB at 100Hz; Middle: +/ -12dB at 800Hz; High: +/ -12dB at 3KHz

Low Battery Check: LED

Power Supply: 9V Alkaline Battery (not included)

Pick-up: Piezo ceramic pick-up

Dimension: 80 * 55 * 50mm

Item Weight: 129g

Note:
- Please allow 1-5mm error due to manual measurement and make sure you do not mind before ordering.
- The batteries are not included.

Package Weight : 166(g) / 5.86(oz)

Package Dimensions(Length*Width*High) : 200(mm)*145(mm)*50(mm) / 7.87(in)*5.71(in)*1.97(in)

Retail Packaging: No, No Packing

TOP_MIA_23O

Package Include:

1 * EQ

1 * Battery box

1 * Pickup line

6 * Mounting Screws', 10, 10, N'https://image.dhgate.com/0x0/f2/albu/g5/M00/93/F9/rBVaJFkk9S-ASqUOAAGOZUsd0ho079.jpg', 7, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (21, N'Pickup ID 21', CAST(N'2018-07-15' AS Date), N'Specifications:

Feature:
- Tone and volume control.
- With phase and tuner function, built-in reverb, delay, chrous and wide effects.
- Installed on the acoustic instruments (such as folk guitar, classical guitar, etc.) for PA, the original sound into acoustic.
- The volume is enlarged, and the effect can be used together with the effect device to enrich the sound of the instrument.
- The product is easy to install and high fidelity to the original sound.
- The use of simple, easy to understand the function.

Input Impedance: 10M

Frequency Response: 20Hz - 20KHz

Control Range: Low: +/ -12dB at 100Hz; Middle: +/ -12dB at 800Hz; High: +/ -12dB at 3KHz

Low Battery Check: LED

Power Supply: 9V Alkaline Battery (not included)

Pick-up: Piezo ceramic pick-up

Dimension: 80 * 55 * 50mm

Item Weight: 129g

Note:
- Please allow 1-5mm error due to manual measurement and make sure you do not mind before ordering.
- The batteries are not included.

Package Weight : 166(g) / 5.86(oz)

Package Dimensions(Length*Width*High) : 200(mm)*145(mm)*50(mm) / 7.87(in)*5.71(in)*1.97(in)

Retail Packaging: No, No Packing

TOP_MIA_23O

Package Include:

1 * EQ

1 * Battery box

1 * Pickup line

6 * Mounting Screws', 10, 10, N'https://cdn.shopify.com/s/files/1/1013/8813/products/ibeam-acoustic-guitar-pickup-slide3_grande.jpeg?v=1452986037', 8, 3, 2000000)
INSERT [dbo].[Product] ([ID], [Name], [DateImported], [Description], [TotalSold], [TotalLeft], [Image], [SubCategoryID], [MakerID], [Price]) VALUES (22, N'Capo', CAST(N'2018-07-15' AS Date), N'Specifications:

Feature:
- Tone and volume control.
- With phase and tuner function, built-in reverb, delay, chrous and wide effects.
- Installed on the acoustic instruments (such as folk guitar, classical guitar, etc.) for PA, the original sound into acoustic.
- The volume is enlarged, and the effect can be used together with the effect device to enrich the sound of the instrument.
- The product is easy to install and high fidelity to the original sound.
- The use of simple, easy to understand the function.

Input Impedance: 10M

Frequency Response: 20Hz - 20KHz

Control Range: Low: +/ -12dB at 100Hz; Middle: +/ -12dB at 800Hz; High: +/ -12dB at 3KHz

Low Battery Check: LED

Power Supply: 9V Alkaline Battery (not included)

Pick-up: Piezo ceramic pick-up

Dimension: 80 * 55 * 50mm

Item Weight: 129g

Note:
- Please allow 1-5mm error due to manual measurement and make sure you do not mind before ordering.
- The batteries are not included.

Package Weight : 166(g) / 5.86(oz)

Package Dimensions(Length*Width*High) : 200(mm)*145(mm)*50(mm) / 7.87(in)*5.71(in)*1.97(in)

Retail Packaging: No, No Packing

TOP_MIA_23O

Package Include:

1 * EQ

1 * Battery box

1 * Pickup line

6 * Mounting Screws', 10, 10, N'https://images-na.ssl-images-amazon.com/images/I/61j6MhgvxIL._SX425_.jpg', 6, 3, 2000000)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[SubCategory] ON 

INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (1, 1, N'Classic')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (2, 1, N'Accoustic')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (3, 1, N'Ukulele')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (4, 1, N'Ghita điện')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (5, 1, N'Ghita bass')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (6, 2, N'Dây')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (7, 2, N'Capo')
INSERT [dbo].[SubCategory] ([ID], [CategoryID], [Name]) VALUES (8, 2, N'Equalizer/ Pickup')
SET IDENTITY_INSERT [dbo].[SubCategory] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [IsAdmin], [Address], [Phone], [Email], [FullName]) VALUES (1, N'mien', N'mien', 1, N'Hatinh', N'0123456789', N'hongmienft98@gmail.com', N'Mien')
INSERT [dbo].[User] ([ID], [UserName], [Password], [IsAdmin], [Address], [Phone], [Email], [FullName]) VALUES (2, N'tunganh', N'tunganh', 0, N'Quangninh', N'122333', N'tunganhabc.xyz@gmail.com', N'Pham Tung Anh')
INSERT [dbo].[User] ([ID], [UserName], [Password], [IsAdmin], [Address], [Phone], [Email], [FullName]) VALUES (3, N'son', N'son', 0, N'Langson', N'321456', N'sonhlt@gmail.com', N'Son')
INSERT [dbo].[User] ([ID], [UserName], [Password], [IsAdmin], [Address], [Phone], [Email], [FullName]) VALUES (4, N'phong', N'phong', 1, N'Haiphong', N'12345', N'phongvh@gmail.co', N'Vu Hai Phong')
INSERT [dbo].[User] ([ID], [UserName], [Password], [IsAdmin], [Address], [Phone], [Email], [FullName]) VALUES (6, N'huy', N'huy', 0, N'Hanoi', N'012345', N'huyng@gmail.com', N'Nguyen Gia Huy')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Order_Pay] ADD  CONSTRAINT [DF_Order_Pay_PaymentStatus]  DEFAULT ((0)) FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[Order_Pay]  WITH CHECK ADD  CONSTRAINT [FK_Order_Pay_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[Order_Pay] CHECK CONSTRAINT [FK_Order_Pay_Order]
GO
ALTER TABLE [dbo].[Order_Pay]  WITH CHECK ADD  CONSTRAINT [FK_Order_Pay_PaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[Order_Pay] CHECK CONSTRAINT [FK_Order_Pay_PaymentMethod]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Maker] FOREIGN KEY([MakerID])
REFERENCES [dbo].[Maker] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Maker]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
