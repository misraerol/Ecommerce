USE [ECommerce]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[Explanation] [nvarchar](max) NULL,
	[CountyId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[NameSurname] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminUserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Password] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ActivationCode] [nchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUser]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUser](
	[AppUserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](200) NULL,
	[Password] [nvarchar](max) NULL,
	[IsActivation] [bit] NOT NULL,
	[IsWantNotification] [bit] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[BirthDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ActivationCode] [nvarchar](50) NULL,
	[ParameterGenderId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserMapAddress]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserMapAddress](
	[AppUserMapAddress] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AppUserId] [int] NOT NULL,
 CONSTRAINT [PK__AppUserM__03B5086434A34711] PRIMARY KEY CLUSTERED 
(
	[AppUserMapAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppUserMapWish]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppUserMapWish](
	[AppUserMapWishId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AppUserMapWishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[TopCategoryId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[County]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[CountyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CityId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountKey]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountKey](
	[DiscountKeyId] [int] IDENTITY(1,1) NOT NULL,
	[Discount] [decimal](18, 0) NULL,
	[GuidKey] [nvarchar](100) NULL,
	[ExpiredDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[TotalAmount] [decimal](8, 2) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[DiscountKeyId] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddressId] [int] NOT NULL,
	[ParameterPaymentTypeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ParameterRequiredFieldsId] [int] NULL,
	[Quantity] [tinyint] NOT NULL,
	[Price] [decimal](8, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[ParameterId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[ParameterTypeId] [int] NOT NULL,
	[TypeValue] [int] NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ParameterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParameterType]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParameterType](
	[ParameterTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ParameterTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[ShortName] [nvarchar](150) NULL,
	[Explanation] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DiscountRate] [decimal](8, 2) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ParentId] [int] NULL,
	[IsShipperPay] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__Product__B40CC6CD46F9E29E] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMapComment]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMapComment](
	[ProductMapCommentId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AppUserId] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Star] [tinyint] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMapCommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMapImage]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMapImage](
	[ProductMapImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMapImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMapProperty]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMapProperty](
	[ProductMapPropertyId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[PropetyKey] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ParameterId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMapPropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMapRequiredFields]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMapRequiredFields](
	[ProductMapRequiredFieldsId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ParameterId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductMapRequiredFieldsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMapShippers]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMapShippers](
	[ProductMapShippersId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ShipperId] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK__ProductM__9AEE61C472670204] PRIMARY KEY CLUSTERED 
(
	[ProductMapShippersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductStoreWindow]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductStoreWindow](
	[ProductStoreWindowId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ExpiredDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductStoreWindowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shipper]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipper](
	[ShipperId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[SliderId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[ExpiredDate] [datetime] NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RedirectUrl] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserCart]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCart](
	[UserCartId] [int] IDENTITY(1,1) NOT NULL,
	[AppUserId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[ParameterProductRequiredTypesId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserCartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [Title], [Explanation], [CountyId], [CreateDate], [IsActive], [IsDeleted], [Phone], [NameSurname]) VALUES (2, N'test', N'test', 108, CAST(N'2020-04-28T19:22:39.000' AS DateTime), 1, 0, N'1231231231', N'test')
INSERT [dbo].[Address] ([AddressId], [Title], [Explanation], [CountyId], [CreateDate], [IsActive], [IsDeleted], [Phone], [NameSurname]) VALUES (3, N'Ev', N'Fasıl', 849, CAST(N'2020-04-28T23:56:55.353' AS DateTime), 1, 0, N'5548659198', N'Mısra Erol')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([AdminUserId], [Email], [Password], [CreateDate], [IsActive], [IsDeleted], [ActivationCode]) VALUES (5, N'furk4nyuksel@icloud.com', N'12345', CAST(N'2020-04-12T00:00:00.000' AS DateTime), 1, 0, NULL)
INSERT [dbo].[AdminUser] ([AdminUserId], [Email], [Password], [CreateDate], [IsActive], [IsDeleted], [ActivationCode]) VALUES (8, N'misraerol@gmail.com', N'12', CAST(N'2020-04-29T19:34:16.073' AS DateTime), 1, 0, N'591b90ce-3834-4cbd-9009-d720ec3fe734              ')
INSERT [dbo].[AdminUser] ([AdminUserId], [Email], [Password], [CreateDate], [IsActive], [IsDeleted], [ActivationCode]) VALUES (22, N'misraerol@hotmail.com', N'12', CAST(N'2020-05-04T02:00:27.513' AS DateTime), 1, 0, N'3a79cd37-88ae-44d8-9cab-37bb4320d78b              ')
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
SET IDENTITY_INSERT [dbo].[AppUser] ON 

INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (1, N'misraerol@hotmail.com', N'as', 1, 1, N'Mısra', N'Erol', CAST(N'2000-04-12T00:00:00.000' AS DateTime), CAST(N'2020-04-23T15:27:38.787' AS DateTime), 1, 0, N'c03300f0-f022-4a09-bfc0-06a4740f6398', 5)
INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (2, N'ibanez75612@gmail.com', N'123', 1, 1, N'Furkan', N'Yüksel', CAST(N'1998-12-15T00:00:00.000' AS DateTime), CAST(N'2020-04-25T12:46:01.593' AS DateTime), 1, 0, N'7e61479e-8681-4c54-ba75-2aa43549d34e', 4)
INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (3, N'hopoxak295@homedepinst.com', N'123', 1, 1, N'test', N'deneme', CAST(N'2000-04-25T00:00:00.000' AS DateTime), CAST(N'2020-04-25T12:52:08.520' AS DateTime), 1, 0, N'd18a91ae-d6fc-4c3c-8816-a4713d352b37', 4)
INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (4, N'lehij48785@2go-mail.com', N'123', 1, 1, N'aas', N'adada', CAST(N'2000-04-25T00:00:00.000' AS DateTime), CAST(N'2020-04-25T12:53:58.153' AS DateTime), 1, 0, N'e8a6e045-6d1f-44ef-b54b-cebd97115f47', 4)
INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (5, N'hijer14109@govdep5012.com', N'123', 1, 1, N'erewrew', N'ewrwerw', CAST(N'2000-04-25T00:00:00.000' AS DateTime), CAST(N'2020-04-25T13:16:14.753' AS DateTime), 1, 0, N'1bd2de00-b3e5-4da0-9a44-7a3c7b5918ac', 4)
INSERT [dbo].[AppUser] ([AppUserId], [Email], [Password], [IsActivation], [IsWantNotification], [FirstName], [LastName], [BirthDate], [CreateDate], [IsActive], [IsDeleted], [ActivationCode], [ParameterGenderId]) VALUES (6, N'rzrletxmiclwpclict@awdrt.org', N'123', 1, 0, N'test', N'test', CAST(N'2000-04-25T00:00:00.000' AS DateTime), CAST(N'2020-04-25T16:40:13.633' AS DateTime), 1, 0, N'552ee299-d534-499d-9c1c-0030541dec27', 4)
SET IDENTITY_INSERT [dbo].[AppUser] OFF
SET IDENTITY_INSERT [dbo].[AppUserMapAddress] ON 

INSERT [dbo].[AppUserMapAddress] ([AppUserMapAddress], [AddressId], [CreateDate], [IsActive], [IsDeleted], [AppUserId]) VALUES (1, 2, CAST(N'2020-04-28T19:22:39.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[AppUserMapAddress] ([AppUserMapAddress], [AddressId], [CreateDate], [IsActive], [IsDeleted], [AppUserId]) VALUES (2, 3, CAST(N'2020-04-28T23:56:55.353' AS DateTime), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[AppUserMapAddress] OFF
SET IDENTITY_INSERT [dbo].[AppUserMapWish] ON 

INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, 1, 3, CAST(N'2020-05-07T15:11:35.700' AS DateTime), 0, 0)
INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, 1, 4, CAST(N'2020-05-07T17:20:31.337' AS DateTime), 0, 0)
INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, 1, 5, CAST(N'2020-05-13T02:34:03.270' AS DateTime), 0, 0)
INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, 1, 6, CAST(N'2020-05-17T19:51:50.923' AS DateTime), 1, 0)
INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, 1, 3, CAST(N'2020-05-18T01:29:54.120' AS DateTime), 1, 0)
INSERT [dbo].[AppUserMapWish] ([AppUserMapWishId], [AppUserId], [ProductId], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, 1, 4, CAST(N'2020-05-18T01:30:12.407' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[AppUserMapWish] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, N'Elektronik', 0, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, N'Bilgisayar', 2, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, N'Telefon ve Aksesuar', 2, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, N'Diz üstü Bilgisayar', 3, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, N'Masaüstü Bilgisayar', 3, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, N'Bilgisayar Bileşenleri', 3, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, N'Yazılım Ürünleri', 3, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, N'Ev Telefonu', 7, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (13, N'Cep Telefonu', 7, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, N'Akıllı Saat', 7, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, N'PowerBank', 7, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, N'Disk', 10, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, N'SSD', 16, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, N'HDD', 16, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (19, N'Kozmetik, Kişisel Bakım', 0, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (20, N'Parfüm', 19, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (21, N'Kadın Parfüm', 20, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (22, N'Erkek Parfüm', 20, CAST(N'2020-04-20T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (23, N'Saç Bakım', 19, CAST(N'2020-04-22T22:51:41.817' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (24, N'Moda', 0, CAST(N'2020-04-22T23:05:44.440' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (25, N'Kadın', 24, CAST(N'2020-04-22T23:06:18.593' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (26, N'Erkek', 24, CAST(N'2020-04-22T23:06:27.997' AS DateTime), 1, 0)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (27, N'Test2', 0, CAST(N'2020-04-23T02:02:43.953' AS DateTime), 0, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [TopCategoryId], [CreateDate], [IsActive], [IsDeleted]) VALUES (28, N'Test', 0, CAST(N'2020-04-23T02:09:50.863' AS DateTime), 0, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, N'ADANA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, N'ADIYAMAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, N'AFYON', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, N'AĞRI', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, N'AMASYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, N'ANKARA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, N'ANTALYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, N'ARTVİN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, N'AYDIN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, N'BALIKESİR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, N'BİLECİK', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, N'BİNGÖL', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (13, N'BİTLİS', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, N'BOLU', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, N'BURDUR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, N'BURSA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, N'ÇANAKKALE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, N'ÇANKIRI', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (19, N'ÇORUM', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (20, N'DENİZLİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (21, N'DİYARBAKIR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (22, N'EDİRNE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (23, N'ELAZIĞ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (24, N'ERZİNCAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (25, N'ERZURUM', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (26, N'ESKİŞEHİR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (27, N'GAZİANTEP', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (28, N'GİRESUN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (29, N'GÜMÜŞHANE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (30, N'HAKKARİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (31, N'HATAY', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (32, N'ISPARTA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (33, N'İÇEL', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (34, N'İSTANBUL', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (35, N'İZMİR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (36, N'KARS', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (37, N'KASTAMONU', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (38, N'KAYSERİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (39, N'KIRKLARELİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (40, N'KIRŞEHİR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (41, N'KOCAELİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (42, N'KONYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (43, N'KÜTAHYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (44, N'MALATYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (45, N'MANİSA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (46, N'KAHRAMANMARAŞ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (47, N'MARDİN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (48, N'MUĞLA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (49, N'MUŞ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (50, N'NEVŞEHİR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (51, N'NİĞDE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (52, N'ORDU', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (53, N'RİZE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (54, N'SAKARYA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (55, N'SAMSUN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (56, N'SİİRT', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (57, N'SİNOP', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (58, N'SİVAS', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (59, N'TEKİRDAĞ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (60, N'TOKAT', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (61, N'TRABZON', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (62, N'TUNCELİ', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (63, N'ŞANLIURFA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (64, N'UŞAK', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (65, N'VAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (66, N'YOZGAT', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (67, N'ZONGULDAK', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (68, N'AKSARAY', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (69, N'BAYBURT', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (70, N'KARAMAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (71, N'KIRIKKALE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (72, N'BATMAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (73, N'ŞIRNAK', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (74, N'BARTIN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (75, N'ARDAHAN', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (76, N'IĞDIR', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (77, N'YALOVA', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (78, N'KARABÜK', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (79, N'KİLİS', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (80, N'OSMANİYE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[City] ([CityId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (81, N'DÜZCE', CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[County] ON 

INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (101, N'ARHAVİ', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (102, N'ARTVİN MERKEZ', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (103, N'BORÇKA', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (104, N'HOPA', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (105, N'ŞAVŞAT', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (106, N'YUSUFELİ', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (107, N'MURGUL', 8, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (108, N'AYDIN MERKEZ', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (109, N'BOZDOĞAN', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (110, N'ÇİNE', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (111, N'GERMENCİK', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (112, N'KARACASU', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (113, N'KOÇARLI', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (114, N'KUŞADASI', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (115, N'KUYUCAK', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (116, N'NAZİLLİ', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (117, N'SÖKE', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (118, N'SULTANHİSAR', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (119, N'YENİPAZAR', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (120, N'BUHARKENT', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (121, N'İNCİRLİOVA', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (122, N'KARPUZLU', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (123, N'KÖŞK', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (124, N'DCountyIdİM', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (125, N'AĞRI MERKEZ', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (126, N'DİYADİN', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (127, N'DOĞUBEYAZIT', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (128, N'ELEŞKİRT', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (129, N'HAMUR', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (130, N'PATNOS', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (131, N'TAŞLIÇAY', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (132, N'TUTAK', 4, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (133, N'AYVALIK', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (134, N'BALIKESİR MERKEZ', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (135, N'BALYA', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (136, N'BANDIRMA', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (137, N'BİGADİÇ', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (138, N'BURHANİYE', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (139, N'DURSUNBEY', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (140, N'EDREMİT', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (141, N'ERDEK', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (142, N'GÖNEN', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (143, N'HAVRAN', 9, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (144, N'İVRİNDİ', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (145, N'KEPSUT', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (146, N'MANYAS', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (147, N'SAVAŞTEPE', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (148, N'SINDIRGI', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (149, N'SUSURLUK', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (150, N'MARMARA', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (151, N'GÖMEÇ', 10, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (152, N'BARTIN MERKEZ', 74, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (153, N'KURUCAŞİLE', 74, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (154, N'ULUS', 74, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (155, N'AMASRA', 74, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (156, N'BATMAN MERKEZ', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (157, N'BEŞİRİ', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (158, N'GERCÜŞ', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (159, N'KOZLUK', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (160, N'SASON', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (161, N'HASANKEYF', 72, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (162, N'BAYBURT MERKEZ', 69, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (163, N'AYDINTEPE', 69, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (164, N'DEMİRÖZÜ', 69, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (165, N'BOLU MERKEZ', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (166, N'GEREDE', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (167, N'GÖYNÜK', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (168, N'KIBRISCIK', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (169, N'MENGEN', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (170, N'MUDURNU', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (171, N'SEBEN', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (172, N'DÖRTDİVAN', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (173, N'YENİÇAĞA', 14, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (174, N'AĞLASUN', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (175, N'BUCAK', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (176, N'BURDUR MERKEZ', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (177, N'GÖLHİSAR', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (178, N'TEFENNİ', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (179, N'YEŞİLOVA', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (180, N'KARAMANLI', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (181, N'KEMER', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (182, N'ALTINYAYLA', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (183, N'ÇAVDIR', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (184, N'ÇELTİKÇİ', 15, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (185, N'GEMLİK', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (186, N'İNEGÖL', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (187, N'İZNİK', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (188, N'KARACABEY', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (189, N'KELES', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (190, N'MUDANYA', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (191, N'MUSTAFA K. PAŞA', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (192, N'ORHANELİ', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (193, N'ORHANGAZİ', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (194, N'YENİŞEHİR', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (195, N'BÜYÜK ORHAN', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (196, N'HARMANCIK', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (197, N'NÜLİFER', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (198, N'OSMAN GAZİ', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (199, N'YILDIRIM', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (200, N'GÜRSU', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (201, N'KESTEL', 16, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (202, N'BİLECİK MERKEZ', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (203, N'BOZÜYÜK', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (204, N'GÖLPAZARI', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (205, N'OSMANELİ', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (206, N'PAZARYERİ', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (207, N'SÖĞÜT', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (208, N'YENİPAZAR', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (209, N'İNHİSAR', 11, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (210, N'BİNGÖL MERKEZ', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (211, N'GENÇ', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (212, N'KARLIOVA', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (213, N'KİGI', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (214, N'SOLHAN', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (215, N'ADAKLI', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (216, N'YAYLADERE', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (217, N'YEDİSU', 12, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (218, N'ADNameVAZ', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (219, N'AHLAT', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (220, N'BİTLİS MERKEZ', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (221, N'HİZAN', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (222, N'MUTKİ', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (223, N'TATVAN', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (224, N'GÜROYMAK', 13, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (225, N'DENİZLİ MERKEZ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (226, N'ACIPAYAM', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (227, N'BULDAN', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (228, N'ÇAL', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (229, N'ÇAMELİ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (230, N'ÇARDAK', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (231, N'ÇİVRİL', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (232, N'GÜNEY', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (233, N'KALE', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (234, N'SARAYKÖY', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (235, N'TAVAS', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (236, N'BABADAĞ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (237, N'BEKİLLİ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (238, N'HONAZ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (239, N'SERİNHİSAR', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (240, N'AKKÖY', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (241, N'BAKLAN', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (242, N'BEYAĞAÇ', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (243, N'BOZKURT', 20, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (244, N'DÜZCE MERKEZ', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (245, N'AKÇAKOCA', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (246, N'YIĞILCA', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (247, N'CUMAYERİ', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (248, N'GÖLYAKA', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (249, N'ÇİLİMLİ', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (250, N'GÜMÜŞOVA', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (251, N'KAYNAŞLI', 81, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (252, N'DİYARBAKIR MERKEZ', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (253, N'BİSMİL', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (254, N'ÇERMİK', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (255, N'ÇINAR', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (256, N'ÇÜNGÜŞ', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (257, N'DİCLE', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (258, N'ERGANİ', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (259, N'HANİ', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (260, N'HAZRO', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (261, N'KULP', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (262, N'LİCE', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (263, N'SİLVAN', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (264, N'EĞİL', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (265, N'KOCAKÖY', 21, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (266, N'EDİRNE MERKEZ', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (267, N'ENEZ', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (268, N'HAVSA', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (269, N'İPSALA', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (270, N'KEŞAN', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (271, N'LALAPAŞA', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (272, N'MERİÇ', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (273, N'UZUNKÖPRÜ', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (274, N'SÜLOĞLU', 22, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (275, N'ELAZIĞ MERKEZ', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (276, N'AĞIN', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (277, N'BASKİL', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (278, N'KARAKOÇAN', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (279, N'KEBAN', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (280, N'MADEN', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (281, N'PALU', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (282, N'SİVRİCE', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (283, N'ARICAK', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (284, N'KOVANCILAR', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (285, N'ALACAKAYA', 23, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (286, N'ERZURUM MERKEZ', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (287, N'PALANDÖKEN', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (288, N'AŞKALE', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (289, N'ÇAT', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (290, N'HINIS', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (291, N'HORASAN', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (292, N'OLTU', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (293, N'İSPİR', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (294, N'KARAYAZI', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (295, N'NARMAN', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (296, N'OLUR', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (297, N'PASİNLER', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (298, N'ŞENKAYA', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (299, N'TEKMAN', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (300, N'TORTUM', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (301, N'KARAÇOBAN', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (302, N'UZUNDERE', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (303, N'PAZARYOLU', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (304, N'ILICA', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (305, N'KÖPRÜKÖY', 25, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (306, N'ÇAYIRLI', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (307, N'ERZİNCAN MERKEZ', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (308, N'İLİÇ', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (309, N'KEMAH', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (310, N'KEMALİYE', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (311, N'REFAHİYE', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (312, N'TERCAN', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (313, N'OTLUKBELİ', 24, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (314, N'ESKİŞEHİR MERKEZ', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (315, N'ÇİFTELER', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (316, N'MAHMUDİYE', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (317, N'MİHALIÇLIK', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (318, N'SARICAKAYA', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (319, N'SEYİTGAZİ', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (320, N'SİVRİHİSAR', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (321, N'ALPU', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (322, N'BEYLİKOVA', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (323, N'İNÖNÜ', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (324, N'GÜNYÜZÜ', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (325, N'HAN', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (326, N'MİHALGAZİ', 26, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (327, N'ARABAN', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (328, N'İSLAHİYE', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (329, N'NİZİP', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (330, N'OĞUZELİ', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (331, N'YAVUZELİ', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (332, N'ŞAHİNBEY', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (333, N'ŞEHİT KAMİL', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (334, N'KARKAMIŞ', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (335, N'NURDAĞI', 27, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (336, N'GÜMÜŞHANE MERKEZ', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (337, N'KELKİT', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (338, N'ŞİRAN', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (339, N'TORUL', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (340, N'KÖSE', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (341, N'KÜRTÜN', 29, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (342, N'ALUCRA', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (343, N'BULANCAK', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (344, N'DERELİ', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (345, N'ESPİYE', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (346, N'EYNESİL', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (347, N'GİRESUN MERKEZ', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (348, N'GÖRELE', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (349, N'KEŞAP', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (350, N'ŞEBİNKARAHİSAR', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (351, N'TİREBOLU', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (352, N'PİPAZİZ', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (353, N'YAĞLCountyIdERE', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (354, N'ÇAMOLUK', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (355, N'ÇANAKÇI', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (356, N'DOĞANKENT', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (357, N'GÜCE', 28, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (358, N'HAKKARİ MERKEZ', 30, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (359, N'ÇUKURCA', 30, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (360, N'ŞEMDİNLİ', 30, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (361, N'YÜKSEKOVA', 30, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (362, N'ALTINÖZÜ', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (363, N'DÖRTYOL', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (364, N'HATAY MERKEZ', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (365, N'HASSA', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (366, N'İSKENDERUN', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (367, N'KIRIKHAN', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (368, N'REYHANLI', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (369, N'SAMANDAĞ', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (370, N'YAYLADAĞ', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (371, N'ERZİN', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (372, N'BELEN', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (373, N'KUMLU', 31, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (374, N'ISPARTA MERKEZ', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (375, N'ATABEY', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (376, N'KEÇİBORLU', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (377, N'EĞİRDİR', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (378, N'GELENDOST', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (379, N'SİNİRKENT', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (380, N'ULUBORLU', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (381, N'YALVAÇ', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (382, N'AKSU', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (383, N'GÖNEN', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (384, N'YENİŞAR BADEMLİ', 32, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (385, N'IĞDIR MERKEZ', 76, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (386, N'ARALIK', 76, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (387, N'TUZLUCA', 76, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (388, N'KARAKOYUNLU', 76, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (389, N'AFŞİN', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (390, N'ANDIRIN', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (391, N'ELBİSTAN', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (392, N'GÖKSUN', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (393, N'KAHRAMANMARAŞ MERKEZ', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (394, N'PAZARCIK', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (395, N'TÜRKOĞLU', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (396, N'ÇAĞLAYANCERİT', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (397, N'EKİNÖZÜ', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (398, N'NURHAK', 46, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (399, N'EFLANİ', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (400, N'ESKİPAZAR', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (401, N'KARABÜK MERKEZ', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (402, N'OVACIK', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (403, N'SAFRANBOLU', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (404, N'YENİCE', 78, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (405, N'ERMENEK', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (406, N'KARAMAN MERKEZ', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (407, N'AYRANCI', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (408, N'KAZIMKARABEKİR', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (409, N'BAŞYAYLA', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (410, N'SARIVELİLER', 70, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (411, N'KARS MERKEZ', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (412, N'ARPAÇAY', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (413, N'DİGOR', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (414, N'KAĞIZMAN', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (415, N'SARIKAMIŞ', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (416, N'SELİM', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (417, N'SUSUZ', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (418, N'AKYAKA', 36, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (419, N'ABANA', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (420, N'KASTAMONU MERKEZ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (421, N'ARAÇ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (422, N'AZDAVAY', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (423, N'BOZKURT', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (424, N'CCountyIdE', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (425, N'ÇATALZEYTİN', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (426, N'DADAY', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (427, N'DEVREKANİ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (428, N'İNEBOLU', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (429, N'KÜRE', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (430, N'TAŞKÖPRÜ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (431, N'TOSYA', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (432, N'İHSANGAZİ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (433, N'PINARBAŞI', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (434, N'ŞENPAZAR', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (435, N'AĞLI', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (436, N'DOĞANYURT', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (437, N'HANÖNÜ', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (438, N'SEYDİLER', 37, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (439, N'BÜNYAN', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (440, N'DEVELİ', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (441, N'FELAHİYE', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (442, N'İNCESU', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (443, N'PINARBAŞI', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (444, N'SARIOĞLAN', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (445, N'SARIZ', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (446, N'TOMARZA', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (447, N'YAHYALI', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (448, N'YEŞİLHİSAR', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (449, N'AKKIŞLA', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (450, N'TALAS', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (451, N'KOCASİNAN', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (452, N'MELİKGAZİ', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (453, N'HACILAR', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (454, N'ÖZVATAN', 38, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (455, N'DERİCE', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (456, N'KESKİN', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (457, N'KIRIKKALE MERKEZ', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (458, N'SALAK YURT', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (459, N'BAHŞİLİ', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (460, N'BALIŞEYH', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (461, N'ÇELEBİ', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (462, N'KARAKEÇİLİ', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (463, N'YAHŞİHAN', 71, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (464, N'KIRKKLARELİ MERKEZ', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (465, N'BABAESKİ', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (466, N'DEMİRKÖY', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (467, N'KOFÇAY', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (468, N'LÜLEBURGAZ', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (469, N'VİZE', 39, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (470, N'KIRŞEHİR MERKEZ', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (471, N'ÇİÇEKDAĞI', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (472, N'KAMAN', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (473, N'MUCUR', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (474, N'AKPINAR', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (475, N'AKÇAKENT', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (476, N'BOZTEPE', 40, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (477, N'KOCAELİ MERKEZ', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (478, N'GEBZE', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (479, N'GÖLCÜK', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (480, N'KANDIRA', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (481, N'KARAMÜRSEL', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (482, N'KÖRFEZ', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (483, N'DERİNCE', 41, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (484, N'KONYA MERKEZ', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (485, N'AKŞEHİR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (486, N'BEYŞEHİR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (487, N'BOZKIR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (488, N'CİHANBEYLİ', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (489, N'ÇUMRA', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (490, N'DOĞANHİSAR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (491, N'EREĞLİ', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (492, N'HADİM', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (493, N'ILGIN', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (494, N'KADINHANI', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (495, N'KARAPINAR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (496, N'KULU', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (497, N'SARAYÖNÜ', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (498, N'SEYDİŞEHİR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (499, N'YUNAK', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (500, N'AKÖREN', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (501, N'ALTINEKİN', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (502, N'DEREBUCAK', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (503, N'HÜYÜK', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (504, N'KARATAY', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (505, N'MERAM', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (506, N'SELÇUKLU', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (507, N'TAŞKENT', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (508, N'AHIRLI', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (509, N'ÇELTİK', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (510, N'DERBENT', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (511, N'EMİRGAZİ', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (512, N'GÜNEYSINIR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (513, N'HALKAPINAR', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (514, N'TUZLUKÇU', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (515, N'YALIHÜYÜK', 42, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (516, N'KÜTAHYA  MERKEZ', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (517, N'ALTINTAŞ', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (518, N'DOMANİÇ', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (519, N'EMET', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (520, N'GEDİZ', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (521, N'SİMAV', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (522, N'TAVŞANLI', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (523, N'ASLANAPA', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (524, N'DUMLUPINAR', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (525, N'HİSARCIK', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (526, N'ŞAPHANE', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (527, N'ÇAVDARHİSAR', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (528, N'PAZARLAR', 43, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (529, N'KİLİS MERKEZ', 79, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (530, N'ELBEYLİ', 79, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (531, N'MUSABEYLİ', 79, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (532, N'POLATELİ', 79, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (533, N'MALATYA MERKEZ', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (534, N'AKÇADAĞ', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (535, N'ARAPGİR', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (536, N'ARGUVAN', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (537, N'DARENDE', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (538, N'DOĞANŞEHİR', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (539, N'HEKİMHAN', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (540, N'PÜTÜRGE', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (541, N'YEŞİLYURT', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (542, N'BATTALGAZİ', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (543, N'DOĞANYOL', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (544, N'KALE', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (545, N'KULUNCAK', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (546, N'YAZIHAN', 44, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (547, N'AKHİSAR', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (548, N'ALAŞEHİR', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (549, N'DEMİRCİ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (550, N'GÖRDES', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (551, N'KIRKAĞAÇ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (552, N'KULA', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (553, N'MANİSA MERKEZ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (554, N'SALİHLİ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (555, N'SARIGÖL', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (556, N'SARUHANLI', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (557, N'SELENDİ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (558, N'SOMA', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (559, N'TURGUTLU', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (560, N'AHMETLİ', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (561, N'GÖLMARMARA', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (562, N'KÖPRÜBAŞI', 45, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (563, N'DERİK', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (564, N'KIZILTEPE', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (565, N'MARDİN MERKEZ', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (566, N'MAZCountyIdAĞI', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (567, N'MCountyIdYAT', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (568, N'NUSAYBİN', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (569, N'ÖMERLİ', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (570, N'SAVUR', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (571, N'YEŞİLLİ', 47, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (572, N'MERSİN MERKEZ', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (573, N'ANAMUR', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (574, N'ERDEMLİ', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (575, N'GÜLNAR', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (576, N'MUT', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (577, N'SİLİFKE', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (578, N'TARSUS', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (579, N'AYDINCIK', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (580, N'BOZYAZI', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (581, N'ÇAMLIYAYLA', 33, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (582, N'BODRUM', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (583, N'DATÇA', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (584, N'FETHİYE', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (585, N'KÖYCEĞİZ', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (586, N'MARMARİS', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (587, N'MİLAS', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (588, N'MUĞLA MERKEZ', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (589, N'ULA', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (590, N'YATAĞAN', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (591, N'DALAMAN', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (592, N'KAVAKLI DERE', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (593, N'ORTACA', 48, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (594, N'BULANIK', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (595, N'MALAZGİRT', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (596, N'MUŞ MERKEZ', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (597, N'VARTO', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (598, N'HASKÖY', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (599, N'KORKUT', 49, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (600, N'NEVŞEHİR MERKEZ', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (601, N'AVANOS', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (602, N'DERİNKUYU', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (603, N'GÜLŞEHİR', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (604, N'HACIBEKTAŞ', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (605, N'KOZAKLI', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (606, N'ÜRGÜP', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (607, N'ACIGÖL', 50, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (608, N'NİĞDE MERKEZ', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (609, N'BOR', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (610, N'ÇAMARDI', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (611, N'ULUKIŞLA', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (612, N'ALTUNHİSAR', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (613, N'ÇİFTLİK', 51, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (614, N'AKKUŞ', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (615, N'AYBASTI', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (616, N'FATSA', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (617, N'GÖLKÖY', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (618, N'KORGAN', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (619, N'KUMRU', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (620, N'MESUDİYE', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (621, N'ORDU MERKEZ', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (622, N'PERŞEMBE', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (623, N'ULUBEY', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (624, N'ÜNYE', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (625, N'GÜLYALI', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (626, N'GÜRGENTEPE', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (627, N'ÇAMAŞ', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (628, N'ÇATALPINAR', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (629, N'ÇAYBAŞI', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (630, N'İKİZCE', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (631, N'KABADÜZ', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (632, N'KABATAŞ', 52, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (633, N'BAHÇE', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (634, N'KADİRLİ', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (635, N'OSMANİYE MERKEZ', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (636, N'DÜZİÇİ', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (637, N'HASANBEYLİ', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (638, N'SUMBAŞ', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (639, N'TOPRAKKALE', 80, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (640, N'RİZE MERKEZ', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (641, N'ARDEŞEN', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (642, N'ÇAMLIHEMŞİN', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (643, N'ÇAYELİ', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (644, N'FINDIKLI', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (645, N'İKİZDERE', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (646, N'KALKANDERE', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (647, N'PAZAR', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (648, N'GÜNEYSU', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (649, N'DEREPAZARI', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (650, N'HEMŞİN', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (651, N'İYCountyIdERE', 53, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (652, N'AKYAZI', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (653, N'GEYVE', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (654, N'HENDEK', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (655, N'KARASU', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (656, N'KAYNARCA', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (657, N'SAKARYA MERKEZ', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (658, N'PAMUKOVA', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (659, N'TARAKLI', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (660, N'FERİZLİ', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (661, N'KARAPÜRÇEK', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (662, N'SÖĞÜTLÜ', 54, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (663, N'ALAÇAM', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (664, N'BAFRA', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (665, N'ÇARŞAMBA', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (666, N'HAVZA', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (667, N'KAVAK', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (668, N'LADİK', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (669, N'SAMSUN MERKEZ', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (670, N'TERME', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (671, N'VEZİRKÖPRÜ', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (672, N'ASARCIK', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (673, N'ONDOKUZMAYIS', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (674, N'SALIPAZARI', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (675, N'TEKKEKÖY', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (676, N'AYVACIK', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (677, N'YAKAKENT', 55, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (678, N'AYANCIK', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (679, N'BOYABAT', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (680, N'SİNOP MERKEZ', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (681, N'DURAĞAN', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (682, N'ERGELEK', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (683, N'GERZE', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (684, N'TÜRKELİ', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (685, N'DİKMEN', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (686, N'SARAYDÜZÜ', 57, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (687, N'DİVRİĞİ', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (688, N'GEMEREK', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (689, N'GÜRÜN', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (690, N'HAFİK', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (691, N'İMRANLI', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (692, N'KANGAL', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (693, N'KOYUL HİSAR', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (694, N'SİVAS MERKEZ', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (695, N'SU ŞEHRİ', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (696, N'ŞARKIŞLA', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (697, N'YILDIZELİ', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (698, N'ZARA', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (699, N'AKINCILAR', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (700, N'ALTINYAYLA', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (701, N'DOĞANŞAR', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (702, N'GÜLOVA', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (703, N'ULAŞ', 58, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (704, N'BAYKAN', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (705, N'ERUH', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (706, N'KURTALAN', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (707, N'PERVARİ', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (708, N'SİİRT MERKEZ', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (709, N'ŞİRVARİ', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (710, N'AYDINLAR', 56, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (711, N'TEKİRDAĞ MERKEZ', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (712, N'ÇERKEZKÖY', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (713, N'ÇORLU', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (714, N'HAYRABOLU', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (715, N'MALKARA', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (716, N'MURATLI', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (717, N'SARAY', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (718, N'ŞARKÖY', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (719, N'MARAMARAEREĞLİSİ', 59, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (720, N'ALMUS', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (721, N'ARTOVA', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (722, N'TOKAT MERKEZ', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (723, N'ERBAA', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (724, N'NİKSAR', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (725, N'REŞADİYE', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (726, N'TURHAL', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (727, N'ZİLE', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (728, N'PAZAR', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (729, N'YEŞİLYURT', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (730, N'BAŞÇİFTLİK', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (731, N'SULUSARAY', 60, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (732, N'TRABZON MERKEZ', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (733, N'AKÇAABAT', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (734, N'ARAKLI', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (735, N'ARŞİN', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (736, N'ÇAYKARA', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (737, N'MAÇKA', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (738, N'OF', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (739, N'SÜRMENE', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (740, N'TONYA', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (741, N'VAKFIKEBİR', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (742, N'YOMRA', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (743, N'BEŞİKDÜZÜ', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (744, N'ŞALPAZARI', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (745, N'ÇARŞIBAŞI', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (746, N'DERNEKPAZARI', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (747, N'DÜZKÖY', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (748, N'HAYRAT', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (749, N'KÖPRÜBAŞI', 61, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (750, N'TUNCELİ MERKEZ', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (751, N'ÇEMİŞGEZEK', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (752, N'HOZAT', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (753, N'MAZGİRT', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (754, N'NAZİMİYE', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (755, N'OVACIK', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (756, N'PERTEK', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (757, N'PÜLÜMÜR', 62, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (758, N'BANAZ', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (759, N'EŞME', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (760, N'KARAHALLI', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (761, N'SİVASLI', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (762, N'ULUBEY', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (763, N'UŞAK MERKEZ', 64, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (764, N'BAŞKALE', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (765, N'VAN MERKEZ', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (766, N'EDREMİT', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (767, N'ÇATAK', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (768, N'ERCİŞ', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (769, N'GEVAŞ', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (770, N'GÜRPINAR', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (771, N'MURADİYE', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (772, N'ÖZALP', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (773, N'BAHÇESARAY', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (774, N'ÇALDIRAN', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (775, N'SARAY', 65, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (776, N'YALOVA MERKEZ', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (777, N'ALTINOVA', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (778, N'ARMUTLU', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (779, N'ÇINARCIK', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (780, N'ÇİFTLİKKÖY', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (781, N'TERMAL', 77, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (782, N'AKDAĞMADENİ', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (783, N'BOĞAZLIYAN', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (784, N'YOZGAT MERKEZ', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (785, N'ÇAYIRALAN', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (786, N'ÇEKEREK', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (787, N'SARIKAYA', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (788, N'SORGUN', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (789, N'ŞEFAATLI', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (790, N'YERKÖY', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (791, N'KADIŞEHRİ', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (792, N'SARAYKENT', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (793, N'YENİFAKILI', 66, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (794, N'ÇAYCUMA', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (795, N'DEVREK', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (796, N'ZONGULDAK MERKEZ', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (797, N'EREĞLİ', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (798, N'ALAPLI', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (799, N'GÖKÇEBEY', 67, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (800, N'ÇANAKKALE MERKEZ', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (801, N'AYVACIK', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (802, N'BAYRAMİÇ', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (803, N'BİGA', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (804, N'BOZCAADA', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (805, N'ÇAN', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (806, N'ECEABAT', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (807, N'EZİNE', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (808, N'LAPSEKİ', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (809, N'YENİCE', 17, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (810, N'ÇANKIRI MERKEZ', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (811, N'ÇERKEŞ', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (812, N'ELDİVAN', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (813, N'ILGAZ', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (814, N'KURŞUNLU', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (815, N'ORTA', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (816, N'ŞABANÖZÜ', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (817, N'YAPRAKLI', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (818, N'ATKARACALAR', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (819, N'KIZILIRMAK', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (820, N'BAYRAMÖREN', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (821, N'KORGUN', 18, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (822, N'ALACA', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (823, N'BAYAT', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (824, N'ÇORUM MERKEZ', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (825, N'İKSİPLİ', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (826, N'KARGI', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (827, N'MECİTÖZÜ', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (828, N'ORTAKÖY', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (829, N'OSMANCIK', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (830, N'SUNGURLU', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (831, N'DODURGA', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (832, N'LAÇİN', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (833, N'OĞUZLAR', 19, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (834, N'ADALAR', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (835, N'BAKIRKÖY', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (836, N'BEŞİKTAŞ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (837, N'BEYKOZ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (838, N'BEYOĞLU', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (839, N'ÇATALCA', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (840, N'EMİNÖNÜ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (841, N'EYÜP', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (842, N'FATİH', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (843, N'GAZİOSMANPAŞA', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (844, N'KADIKÖY', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (845, N'KARTAL', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (846, N'SARIYER', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (847, N'SİLİVRİ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (848, N'ŞİLE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (849, N'ŞİŞLİ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (850, N'ÜSKÜDAR', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (851, N'ZEYTİNBURNU', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (852, N'BÜYÜKÇEKMECE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (853, N'KAĞITHANE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (854, N'KÜÇÜKÇEKMECE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (855, N'PENDİK', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (856, N'ÜMRANİYE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (857, N'BAYRAMPAŞA', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (858, N'AVCILAR', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (859, N'BAĞCILAR', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (860, N'BAHÇELİEVLER', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (861, N'GÜNGÖREN', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (862, N'MALTEPE', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (863, N'SULTANBEYLİ', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (864, N'TUZLA', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (865, N'ESENLER', 34, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (866, N'ALİAĞA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (867, N'BAYINDIR', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (868, N'BERGAMA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (869, N'BORNOVA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (870, N'ÇEŞME', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (871, N'DİKİLİ', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (872, N'FOÇA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (873, N'KARABURUN', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (874, N'KARŞIYAKA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (875, N'KEMALPAŞA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (876, N'KINIK', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (877, N'KİRAZ', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (878, N'MENEMEN', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (879, N'ÖDEMİŞ', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (880, N'SEFERİHİSAR', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (881, N'SELÇUK', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (882, N'TİRE', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (883, N'TORBALI', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (884, N'URLA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (885, N'BEYDAĞ', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (886, N'BUCA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (887, N'KONAK', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (888, N'MENDERES', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (889, N'BALÇOVA', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (890, N'ÇİGLİ', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (891, N'GAZİEMİR', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (892, N'NARLCountyIdERE', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (893, N'GÜZELBAHÇE', 35, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (894, N'ŞANLIURFA MERKEZ', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (895, N'AKÇAKALE', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (896, N'BİRECİK', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (897, N'BOZOVA', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (898, N'CEYLANPINAR', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (899, N'HALFETİ', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
GO
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (900, N'HİLVAN', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (901, N'SİVEREK', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (902, N'SURUÇ', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (903, N'VİRANŞEHİR', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (904, N'HARRAN', 63, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (905, N'BEYTÜŞŞEBAP', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (906, N'ŞIRNAK MERKEZ', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (907, N'CİZRE', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (908, N'CountyIdİL', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (909, N'SİLOPİ', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (910, N'ULUDERE', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[County] ([CountyId], [Name], [CityId], [CreateDate], [IsActive], [IsDeleted]) VALUES (911, N'GÜÇLÜKONAK', 73, CAST(N'1905-06-15T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[County] OFF
SET IDENTITY_INSERT [dbo].[DiscountKey] ON 

INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, CAST(20 AS Decimal(18, 0)), N'2ffa1d8d-74b7-4524-b0bb-40846221ecfc', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, CAST(20 AS Decimal(18, 0)), N'96b74959-3952-4cb6-afba-04bee32726fb', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, CAST(20 AS Decimal(18, 0)), N'1df4a5e0-4925-47e6-8b39-4b99c9b291f7', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, CAST(20 AS Decimal(18, 0)), N'58fab857-e19d-43a6-a65b-d5fd1b13be34', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, CAST(20 AS Decimal(18, 0)), N'b0b30a25-6c4a-4889-b2d1-bedc553c1b7d', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, CAST(20 AS Decimal(18, 0)), N'8cd38057-260f-44d3-b923-4a77a7997e17', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, CAST(20 AS Decimal(18, 0)), N'4394c834-d77d-4f12-a951-97099773e03d', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, CAST(20 AS Decimal(18, 0)), N'f17388b3-eff9-4631-afeb-549fc9c8ecbb', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, CAST(20 AS Decimal(18, 0)), N'0cb2cffc-d191-409b-9fd5-52a76be21b3d', CAST(N'2020-05-12T00:00:00.000' AS DateTime), CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, CAST(20 AS Decimal(18, 0)), N'e18af9d4-883d-4a69-8afe-acff61eefbb8', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, CAST(20 AS Decimal(18, 0)), N'e8412297-e566-4d30-8183-c9b2d7bbd7bf', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, CAST(20 AS Decimal(18, 0)), N'ffd8fa62-d467-4c30-8219-b926ad5772a0', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (13, CAST(20 AS Decimal(18, 0)), N'7ef84f03-1567-4e93-b5d9-9056bfc7ff8c', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, CAST(20 AS Decimal(18, 0)), N'b4984973-5ff5-4944-a16c-e06fcd779d4e', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, CAST(20 AS Decimal(18, 0)), N'3117cf19-5cef-43d3-940e-edb72b216006', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, CAST(20 AS Decimal(18, 0)), N'20cdd558-d2a6-40a9-baf9-74973c731f73', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, CAST(20 AS Decimal(18, 0)), N'c1d747c0-0b36-4110-8c6d-25dec6c7eacf', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, CAST(20 AS Decimal(18, 0)), N'73eedcb3-5142-4af7-b90f-cc8631d5e8dd', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (19, CAST(20 AS Decimal(18, 0)), N'10d53f66-9f51-43b0-ae0e-3e1a1580876a', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (20, CAST(20 AS Decimal(18, 0)), N'1edc706a-278b-4713-8b4c-c438c8c86a8c', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (21, CAST(20 AS Decimal(18, 0)), N'4b492f78-f20d-4df4-a59d-be74045f43b9', NULL, CAST(N'2020-05-01T17:42:12.683' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (22, CAST(10 AS Decimal(18, 0)), N'dabb8398-6692-4581-88af-e391fdb0147e', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (23, CAST(10 AS Decimal(18, 0)), N'3dcd06b8-a4ff-46cd-9b6b-6f25d157570a', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (24, CAST(10 AS Decimal(18, 0)), N'f803c8ea-f830-42d5-a32f-290625100217', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (25, CAST(10 AS Decimal(18, 0)), N'1f51eeb9-8991-44d6-a8b3-9ef2248bd64e', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (26, CAST(10 AS Decimal(18, 0)), N'16c30e52-ca59-45de-83dd-c5e9d3ebefd8', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (27, CAST(10 AS Decimal(18, 0)), N'19b76476-69da-49a1-b787-ec4220734dd7', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (28, CAST(10 AS Decimal(18, 0)), N'426fce23-a914-473f-95e6-d76d630a4ba9', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (29, CAST(10 AS Decimal(18, 0)), N'1d908e7c-18e6-44a7-8fba-5ba5046f2b2d', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (30, CAST(10 AS Decimal(18, 0)), N'7004a313-3aa4-489c-95fa-68c3862b8e34', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (31, CAST(10 AS Decimal(18, 0)), N'76e38f9c-8c95-4ebd-9e92-6fe0eacf8202', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (32, CAST(10 AS Decimal(18, 0)), N'cb1dece8-4d4c-4921-b554-aceff289cfc7', NULL, CAST(N'2020-05-01T23:17:26.400' AS DateTime), 0, 1)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (33, CAST(50 AS Decimal(18, 0)), N'baa08f6b-d8bd-4000-b877-e24571b25bfc', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (34, CAST(50 AS Decimal(18, 0)), N'f5c0e6d5-df88-49e8-a6fc-8b91906245db', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (35, CAST(50 AS Decimal(18, 0)), N'b8bf7c46-a03c-4881-8e00-7ed29b8aca9b', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (36, CAST(50 AS Decimal(18, 0)), N'450ff064-c1f7-4826-b418-f87e3aee8a04', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (37, CAST(50 AS Decimal(18, 0)), N'1ed0f4ba-8763-49a5-bcc4-67d8802e77ff', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
INSERT [dbo].[DiscountKey] ([DiscountKeyId], [Discount], [GuidKey], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (38, CAST(50 AS Decimal(18, 0)), N'dc716f40-578e-43fb-bd07-225753c7db95', CAST(N'2020-05-23T00:00:00.000' AS DateTime), CAST(N'2020-05-16T17:43:48.660' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[DiscountKey] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [TotalAmount], [AppUserId], [DiscountKeyId], [CreateDate], [IsActive], [IsDeleted], [AddressId], [ParameterPaymentTypeId]) VALUES (4, CAST(51513.61 AS Decimal(8, 2)), 1, NULL, CAST(N'2020-05-17T14:20:18.397' AS DateTime), 1, 0, 3, 29)
INSERT [dbo].[Order] ([OrderId], [TotalAmount], [AppUserId], [DiscountKeyId], [CreateDate], [IsActive], [IsDeleted], [AddressId], [ParameterPaymentTypeId]) VALUES (5, CAST(13226.99 AS Decimal(8, 2)), 1, NULL, CAST(N'2020-05-17T14:26:44.437' AS DateTime), 1, 0, 3, 29)
INSERT [dbo].[Order] ([OrderId], [TotalAmount], [AppUserId], [DiscountKeyId], [CreateDate], [IsActive], [IsDeleted], [AddressId], [ParameterPaymentTypeId]) VALUES (6, CAST(2499.99 AS Decimal(8, 2)), 1, 37, CAST(N'2020-05-17T14:30:15.647' AS DateTime), 1, 0, 3, 29)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, 4, 4, NULL, 5, CAST(24999.95 AS Decimal(8, 2)), CAST(N'2020-05-17T14:20:27.937' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, 4, 3, NULL, 2, CAST(26400.00 AS Decimal(8, 2)), CAST(N'2020-05-17T14:20:27.937' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, 4, 6, NULL, 2, CAST(53.98 AS Decimal(8, 2)), CAST(N'2020-05-17T14:20:27.937' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, 4, 5, NULL, 2, CAST(59.68 AS Decimal(8, 2)), CAST(N'2020-05-17T14:20:27.937' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, 5, 3, NULL, 1, CAST(13200.00 AS Decimal(8, 2)), CAST(N'2020-05-17T14:26:44.447' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, 5, 6, NULL, 1, CAST(26.99 AS Decimal(8, 2)), CAST(N'2020-05-17T14:26:44.447' AS DateTime), 1, 0)
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [ParameterRequiredFieldsId], [Quantity], [Price], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, 6, 4, 25, 1, CAST(4999.99 AS Decimal(8, 2)), CAST(N'2020-05-17T14:30:15.667' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Parameter] ON 

INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, N'İşlemci', 2, NULL, CAST(N'2020-04-23T16:10:48.640' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, N'Bellek', 2, NULL, CAST(N'2020-04-23T16:14:13.083' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, N'test', 2, NULL, CAST(N'2020-04-23T16:26:16.593' AS DateTime), 1, 1)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, N'Erkek', 3, NULL, CAST(N'2020-04-24T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, N'Kadın', 3, NULL, CAST(N'2020-04-25T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, N'Diğer', 3, NULL, CAST(N'2020-04-25T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, N'XL', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, N'L', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, N'M', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, N'33', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, N'34', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (13, N'35', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, N'36', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, N'37', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, N'38', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, N'39', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, N'40', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (19, N'41', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (20, N'42', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (21, N'43', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (22, N'44', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (23, N'45', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (24, N'32 GB', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (25, N'64 GB', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (26, N'128 GB', 4, NULL, CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (28, N'Kapıda Ödeme', 5, 1, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (29, N'Kredi Kartı İle Ödeme', 5, 2, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (30, N'Havale İle Ödeme', 5, 3, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (31, N'Hazırlanıyor', 6, 1, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (32, N'Kargoya Verilecek', 6, 2, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (33, N'Kargoya Verildi', 6, 3, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (34, N'Sipariş Tamamlandı', 6, 4, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[Parameter] ([ParameterId], [Name], [ParameterTypeId], [TypeValue], [CreateDate], [IsActive], [IsDeleted]) VALUES (35, N'İade Edildi', 6, 5, CAST(N'2020-05-15T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Parameter] OFF
SET IDENTITY_INSERT [dbo].[ParameterType] ON 

INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, N'CompanyInformation', CAST(N'2020-04-23T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, N'ProductProperty', CAST(N'2020-04-23T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, N'GenderType', CAST(N'2020-04-25T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, N'ProductRequiredTypes', CAST(N'2020-05-01T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, N'PaymentType', CAST(N'2020-05-14T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ParameterType] ([ParameterTypeId], [Name], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, N'OrderStatus', CAST(N'2020-05-14T00:00:00.000' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ParameterType] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, N'Apple iPhone 11', N'iPhone 11', NULL, CAST(15000.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(8, 2)), 13, NULL, 1, CAST(N'2020-05-02T19:03:29.113' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, N'Xiaomi Redmi Note 8 64 GB (Xiaomi Türkiye Garantili)', N'Redmi Note 8', N'<table>
	<tbody>
		<tr>
			<td>
			<p>Xiaomi Redmi Note 8 64 GB (Xiaomi T&uuml;rkiye Garantili)</p>

			<p><a href="http://www.hepsiburada.com/eskiyi-getir-yeniyi-gotur" rel="nofollow" target="_blank"><img alt="" src="https://images.hepsiburada.net/assets/ProductDescription/201806/9d6980f3-1b61-474a-b596-f38151865fe6.png" /></a></p>

			<p>&nbsp;</p>

			<h2>&nbsp;</h2>

			<p>&nbsp;</p>

			<p><img src="https://images.hepsiburada.net/assets/Telefon/ProductDesc/HB00000NBYGG.JPG" /></p>

			<h2>Xiaomi Redmi Note 8 64 GB &Ouml;zellikleri</h2>

			<p>&nbsp;</p>

			<p>D&uuml;nyanın en beğenilen teknoloji &uuml;reticileri arasında yer alan Xiaomi, en se&ccedil;kin akıllı telefon modellerinden biri olan Redmi Note 8 ile ezberleri bozuyor. &Uuml;st&uuml;n tasarımıyla tarzınıza zarif bir katkı sunan Xiaomi Redmi Note 8, birbirinden kullanışlı fonksiyonlarıyla da bir cep telefonundan beklentilerinizi fazlasıyla karşılamayı başarıyor. Y&uuml;ksek kapasitesi sayesinde her t&uuml;rl&uuml; uygulamayı kolayca ve maksimum kalitede &ccedil;alıştırabilmenize yardımcı olan &uuml;r&uuml;n, zengin renk se&ccedil;enekleri sayesinde her tarza ve zevke hitap etmeyi başarıyor. Kamera &ouml;zellikleri sayesinde istediğiniz t&uuml;m anları rahat&ccedil;a &ouml;l&uuml;ms&uuml;zleştirebilmenize olanak tanıyan cihazlar, geniş hafıza kapasiteleri ile de t&uuml;m kişisel verilerinizi g&uuml;venle depolayabilmenize olanak tanıyor.</p>

			<p><strong>Xiaomi Redmi Note 8 Avantajları</strong></p>

			<ul>
				<li>Arka ve &ouml;n y&uuml;z&uuml;nde toplam 5 farklı kamerası bulunan &uuml;r&uuml;n, size benzersiz bir fotoğraf deneyimi vadediyor.</li>
				<li>64 GB hafızası bulunan &uuml;r&uuml;n, dilerseniz 256 GB&#39;a kadar y&uuml;kseltilebiliyor.</li>
				<li>&Ccedil;izilmez ekranı sayesinde g&uuml;venli bir kullanım sunan &uuml;r&uuml;n, su sı&ccedil;ramalarına da dayanıklılık g&ouml;steriyor.</li>
				<li>Parmak izi ve y&uuml;z tanıma &ouml;zelliği bulunan cihaz, sahibini tanıyarak kişisel g&uuml;venliğinizi sağlıyor.</li>
				<li>Y&uuml;ksek batarya kapasitesine sahip olan model, g&uuml;n boyu şarj sorunu yaşamanızı &ouml;nl&uuml;yor.</li>
			</ul>

			<p><strong>Benzersiz Tasarım Anlayışıyla Tanışın</strong></p>

			<p>&Uuml;st segment telefon kullanıcıları i&ccedil;in &ouml;zenle tasarlanan model, se&ccedil;kin g&ouml;r&uuml;n&uuml;m&uuml; sayesinde g&ouml;z kamaştırarak stilinize &acirc;deta bir aksesuar katkısı sağlıyor. Beyaz, siyah ve mavi olmak &uuml;zere &uuml;&ccedil; farklı renk se&ccedil;eneğine sahip olan &uuml;r&uuml;n, 158 mm boyu ve 75,3 mm eni sayesinde hem geniş hem de kolay kullanılan bir tasarım sunuyor. Yalnızca 190 gram ağırlığında olması sayesinde ceplerinizde, &ccedil;antalarınızda ve c&uuml;zdanlarınızda rahatlıkla taşıyabileceğiniz model, 8,4 mm kalınlığı ile de kendi segmentinin en ince ve zarif telefonları arasında yer alıyor. Metal g&ouml;r&uuml;n&uuml;ml&uuml; plastik &ccedil;er&ccedil;evesi sayesinde hem hafif hem de g&uuml;venli bir deneyim sağlayan cihaz, dayanıklı tasarımıyla da kullanım esnasında yaşayabileceğiniz &ccedil;ok sayıdaki aksiliğe karşı b&uuml;y&uuml;k bir diren&ccedil; g&ouml;steriyor.</p>

			<p>Android 9.0 Pie s&uuml;r&uuml;m&uuml;yle &ccedil;alışan cihaz, en g&uuml;ncel teknolojiyi yakından takip edebilmenize olanak tanıyor. 4 GB RAM ve 8 &ccedil;ekirdekli CPU ile son derece y&uuml;ksek bir hızda &ccedil;alışan model, en geniş hacimli uygulamaları bile y&uuml;ksek bir performansta &ccedil;alıştırabiliyor. 64 GB dahili hafızası bulunan ve Micro SD Kart desteği sayesinde depolama alanı 256 GB&#39;a kadar y&uuml;kseltilebilen &uuml;r&uuml;n, ihtiya&ccedil; duyduğunuz t&uuml;m uygulamaları aynı anda telefonunuzda bulundurabilmenizi m&uuml;mk&uuml;n hale getirirken kişisel verileriniz i&ccedil;in de kusursuz bir alan sunuyor. Fotoğraf, video, m&uuml;zik, belge gibi pek &ccedil;ok kişisel verinizi rahat&ccedil;a depolayabileceğiniz model, dosyalarınız i&ccedil;in flash bellek ve harici hard disk kullanma ihtiyacınızı da ortadan kaldırarak yaşamınızı kolaylaştırıyor.</p>

			<p><strong>Kusursuz Fotoğraflar &Ccedil;ekin</strong></p>

			<p>Xiaomi Redmi Note 8 modelleri, benzersiz kamera &ouml;zellikleriyle kullanıcılarda b&uuml;y&uuml;k bir heyecan yaratıyor. &Ouml;n ve arka y&uuml;zlerinde toplam 5 farklı kamera bulunan modeller, y&uuml;ksek kaliteleri sayesinde profesyonele yakın &ccedil;ekimler ger&ccedil;ekleştirebilmenizi m&uuml;mk&uuml;n hale getiriyor. Arka kamerası tam 48 MP kalitesinde olan &uuml;r&uuml;n, bu sayede son derece detaylı, canlı ve &ccedil;arpıcı kareler yakalayabilmenize olanak tanıyor.&nbsp;&nbsp;8 MP kalitesinde bir, 2 MP kalitesinde 2 arka kamerası daha bulunan cihaz, &ouml;n panelinde ise 13 MP &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;kte bir kameraya yer veriyor ve bu sayede kusursuz selfie &ccedil;ekimleri yapabilmenizi sağlıyor. F1.75 ile F2.4 arasında değişen diyafram aralıkları sayesinde ışıktan en y&uuml;ksek seviyede verim alabilen modeller, en karanlık ortamda bile canlı ve parlak kareler &ccedil;ekebilmenize yardımcı oluyor.</p>

			<p>Xiaomi kalitesiyle tasarlanan &uuml;st&uuml;n &ouml;zellikli cihaz kameraları, birbirinden avantajlı fonksiyonları sayesinde eşsiz videolar da &ccedil;ekebilmenizi sağlıyor. Saniyede 30 kare kaydedebilen 30 fps &ouml;zellikli cihaz kameraları, 2160 p kalitesinde 4K video &ccedil;ekebilme &ouml;zellikleri sayesinde t&uuml;m anılarınızı m&uuml;mk&uuml;n olan en y&uuml;ksek kalitede filmleştirebilmenize yardımcı oluyor. Bu sayede adeta profesyonel bir kamera performansı g&ouml;steren cihazlar, 79,4&deg; a&ccedil;ıları sayesinde etkileyici bir alan derinliği de sağlıyor. Portre modu, panaromik &ccedil;ekim modu, hızlı odaklama gibi &ouml;zellikleri sayesinde her t&uuml;rl&uuml; &ccedil;ekimi aynı kalitede ger&ccedil;ekleştirebilmenize olanak tanıyan modeller, otomatik y&uuml;z ve sahne algılama avantajları ile de vakit kaybetmeden &ccedil;ekim yapabilmenizi m&uuml;mk&uuml;n hale getiriyor. HDR &ouml;zellikleriyle &uuml;&ccedil; farklı kareden tek ve kusursuz bir fotoğraf &ccedil;ıkarabilen modeller, HDR Real Time &ouml;zellikleriyle de bu işlemi son derece hızlı bir şekilde tamamlayarak &ccedil;ekim i&ccedil;in bekleyeceğiniz s&uuml;reyi minimuma indiriyor ve vaktinizi size bırakıyor.</p>

			<p><strong>Xiaomi Redmi Note 8: Benzersiz Bir Ekran Deneyimi&nbsp;</strong></p>

			<p>Kullanıcılardan tam not alan model, ekran kalitesiyle de adından sıklıkla s&ouml;z ettirmeyi başarıyor. Xiaomi Redmi Note 8 &ouml;zellikleri, size son derece y&uuml;ksek &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;kte ve son derece dayanıklı bir ekrandan faydalanma imkanı tanıyor. 6,3 in&ccedil; genişliğinde tasarlanan cihaz ekranı, doyurucu &ouml;l&ccedil;&uuml;leri ile geniş ekran seven kullanıcıların &ouml;vg&uuml;s&uuml;n&uuml; kazanırken cihazın %80&#39;inden fazlasını kaplıyor ve bu sayede ergonomik bir yapı sergiliyor.&nbsp;1080 x 2340 piksel &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğe sahip olan cihaz ekranı, t&uuml;m i&ccedil;erikleri FHD+ seviyesinde g&ouml;r&uuml;nt&uuml;leyebilmenize olanak tanıyor. Full HD Plus &ouml;zelliği ile her t&uuml;rl&uuml; film, dizi, video ve oyunu y&uuml;ksek kalitede &ccedil;alıştırabilen &uuml;r&uuml;n ekranı, 16 milyon renk algılayabilme kapasitesi ile de size benzersiz bir deneyimin kapılarını aralıyor.</p>

			<p>Dayanıklılık a&ccedil;ısından da b&uuml;y&uuml;k &ouml;vg&uuml; toplayan cihaz ekranı, Corning Gorilla Glass 5 &ouml;zellikli camı sayesinde her t&uuml;rl&uuml; darbeye ve d&uuml;şmeye karşı b&uuml;y&uuml;k bir diren&ccedil; g&ouml;steriyor. Su sı&ccedil;ramalarına karşı da dayanıklılık sağlayan ekran, kapasitif dokunmatik &ouml;zelliği ve Multi Touch sistemi sayesinde de aynı anda &ccedil;ok sayıda parmakla işlem ger&ccedil;ekleştirebilmenizi m&uuml;mk&uuml;n kılıyor. 2,5D &ouml;l&ccedil;&uuml;s&uuml;ndeki eğimi ile kullanım kolaylığı sağlayan ve g&ouml;z sağlığınızı koruyan cihaz ekranı, 1500:1 kontrast oranı ile t&uuml;m i&ccedil;eriklerde sinema kalitesinde bir performans g&ouml;steriyor. IPS LCD teknolojisiyle &uuml;retilen ekran, ayrıca 409 PPI piksel yoğunluğu sayesinde t&uuml;m g&ouml;r&uuml;nt&uuml;leri ayrı ayrı vurguluyor ve y&uuml;ksek yenilenme hızı sayesinde en yoğun oyunlarda ve en y&uuml;ksek &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;kl&uuml; videolarda bile g&ouml;r&uuml;nt&uuml;leme sorunuyla karşılaşmanızı engelliyor.</p>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			&nbsp;
			<p><img src="https://images.hepsiburada.net/assets/Telefon/ProductDesc/HB00000NBYGG-3.png" /></p>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			&nbsp;
			<p><img src="https://images.hepsiburada.net/assets/Telefon/ProductDesc/HB00000NBYGG-5.png" /></p>

			<p><strong>Y&uuml;ksek Kaliteyle D&uuml;nyaya Bağlanın</strong></p>

			<p>Xiaomi kalitesiyle &uuml;retilen modeller, birbirinden avantajlı bağlantı se&ccedil;enekleri sayesinde sevdiklerinizle ve d&uuml;nyayla kolayca iletişim kurabilmenize yardımcı oluyor. 2G, 3G, 4G ve 4,5G bağlantıları destekleyen modeller, dilediğiniz hızda internete girebilmenize olanak tanıyor. 850 MHz ile 2100 MHz arasında değişen frekans değerleri sayesinde her an her yerde d&uuml;nyayla kesintisiz bağlantı kurabilmenize yardımcı olan cihazlar, ayrıca Wi-Fi ve Wi-Fi Hotspot se&ccedil;enekleriyle de hayatınızı kolaylaştırıyor. Bluetooth ve Infra Red &ouml;zellikleri de bulunan &uuml;r&uuml;nler, bu sayede internete ihtiya&ccedil; duymadan farklı cihazlarla eşleşebiliyor ve kısa s&uuml;rede veri transferi ger&ccedil;ekleştirebiliyor. USB Type-C ve USB On-the-go se&ccedil;enekleri sayesinde farklı cihazlara doğrudan bağlanabilen ve veri aktarımında bulunabilen modeller, uygulamalar aracılığıyla g&ouml;r&uuml;nt&uuml;l&uuml; g&ouml;r&uuml;şme ger&ccedil;ekleştirebilmenize de olanak tanıyor.</p>

			<p>&Ccedil;ift hat kullanımını destekleyen Xiaomi marka cihazlar, aynı anda iki sim kartınızı da aktif halde tutabilmeleri sayesinde birden fazla hat kullananlar i&ccedil;in b&uuml;y&uuml;k bir kolaylık sağlıyor. İkinci hattınız i&ccedil;in ekstra cihaz satın alma zorunluluğunuzu ortadan kaldıran &uuml;r&uuml;nler, &uuml;&ccedil; slotlu yapıları sayesinde Micro SD Kart kullanımına da izin veriyor. Arka kapağında parmak izi okuyucusu da bulunan cihazlar, bu sayede telefonunuzu yalnızca sizin kullanabilmenizi sağlayarak kişisel verilerinizin g&uuml;venliğini maksimum seviyeye &ccedil;ıkarıyor. Y&uuml;z tanımlama fonksiyonu sayesinde de kullanıcısını tanıyan ve kişiselleştirilebilen modeller, d&uuml;ş&uuml;k SAR değerleriyle sağlığınızı da koruyor. Xiaomi Redmi Note 8 fiyatları ise &uuml;r&uuml;n&uuml;n y&uuml;ksek performansı ve &uuml;st&uuml;n &ouml;zellikleriyle kıyaslandığında son derece uygun olarak değerlendiriliyor. Dayanıklı yapısı ve uzun kullanım &ouml;mr&uuml; de hesaba katıldığında, Xiaomi imzası taşıyan cihazın kendi segmentindeki en ideal se&ccedil;enekler arasında yer aldığı a&ccedil;ık&ccedil;a ortaya &ccedil;ıkıyor. Bir cep telefonundan beklediğiniz her şeyi fazlasıyla karşılayan model, zengin fonksiyonları ve y&uuml;ksek kapasitesi sayesinde her zevke ve her yaşa hitap eden en başarılı akıllı telefon se&ccedil;enekleri arasında ilk sıralarda bulunuyor.&nbsp;</p>

			<p><strong>Xiaomi Redmi Note 8 Teknik &Ouml;zellikleri</strong></p>

			<ul>
				<li>Hafıza: 64 GB</li>
				<li>Bellek: 4 GB</li>
				<li>Kamera Sayısı: 5&nbsp;</li>
				<li>Kamera &Ouml;zellikleri: 48 MP (Arka Kamera), 12 MP (2. Arka Kamera), 2 MP (3. ve 4 . Arka Kamera), 13 MP (&Ouml;n Kamera)&nbsp;&nbsp;&nbsp;&nbsp;</li>
				<li>Ekran B&uuml;y&uuml;kl&uuml;ğ&uuml;: 6,3 in&ccedil;</li>
			</ul>

			<p><strong>Xiaomi Hakkında</strong></p>

			<p>D&uuml;nyanın 4. b&uuml;y&uuml;k akıllı telefon &uuml;reticisi konumunda bulunan Xiaomi, &Ccedil;in merkezli şirketler arasında yer alıyor. Benzersiz tasarım anlayışıyla kısa s&uuml;rede d&uuml;nya genelinde b&uuml;y&uuml;k pop&uuml;larite yakalayan marka, akıllı telefonlarındaki yenilik&ccedil;i ve kullanıcı dostu yaklaşımıyla b&uuml;y&uuml;k beğeni kazanıyor.</p>
			</td>
		</tr>
	</tbody>
</table>

<table>
	<tbody>
		<tr>
			<td>
			<table>
				<tbody>
					<tr>
						<td>&nbsp;</td>
					</tr>
				</tbody>
			</table>

			<table>
				<tbody>
					<tr>
						<td>
						<table>
							<caption>&nbsp;</caption>
							<tbody>
								<tr>
									<th>Ağırlık</th>
									<td>190 g</td>
								</tr>
								<tr>
									<th>Arttırılabilir Hafıza</th>
									<td>256 GB&#39;a kadar</td>
								</tr>
								<tr>
									<th>Assisted GPS (Baz İstasyon Destekli K&uuml;resel Konumlama Sistemi)</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Bağlantı Hızı</th>
									<td>42.2 Mbps</td>
								</tr>
								<tr>
									<th>Bekleme S&uuml;resi</th>
									<td>Bekleme s&uuml;resi ile ilgili kesin bir bilgi bulunmamaktadır, &uuml;r&uuml;n&uuml;n modeline g&ouml;re değişiklik g&ouml;sterebilmektedir.</td>
								</tr>
								<tr>
									<th>Bluetooth</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Boyutlar</th>
									<td>158.3 x 75.3 x 8.4 mm</td>
								</tr>
								<tr>
									<th>&Ccedil;ift Hatlı</th>
									<td>Var ( Tek İşlemcili )</td>
								</tr>
								<tr>
									<th>Dahili Hafıza</th>
									<td>64 GB</td>
								</tr>
								<tr>
									<th>Dahili Modem</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Dokunmatik Ekran</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Ekran Boyut Aralığı</th>
									<td>6 in&ccedil; ve &Uuml;zeri</td>
								</tr>
								<tr>
									<th>Ekran Boyutu</th>
									<td>6,3 in&ccedil;</td>
								</tr>
								<tr>
									<th>Ekran &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml;</th>
									<td>1080 x 2340</td>
								</tr>
								<tr>
									<th>Ekran Renk &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml;</th>
									<td>16 Milyon</td>
								</tr>
								<tr>
									<th>Ekran Tipi</th>
									<td>IPS LCD</td>
								</tr>
								<tr>
									<th>E-mail Desteği</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Entegre Flaş</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Entegre Kamera</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Garanti Tipi</th>
									<td>Resmi Distrib&uuml;t&ouml;r Garantili</td>
								</tr>
								<tr>
									<th>G&ouml;r&uuml;nt&uuml;l&uuml; Konuşma</th>
									<td>Var ( Uygulama ile data kullanır )</td>
								</tr>
								<tr>
									<th>G&ouml;z Taraması</th>
									<td>Yok</td>
								</tr>
								<tr>
									<th>GPS (K&uuml;resel Konumlama Sistemi)</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Hafıza Kartı Tipi</th>
									<td>Mini SD</td>
								</tr>
								<tr>
									<th>HandsFree (Eller Serbest)</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>İşlemci Kapasitesi</th>
									<td>2,0 GHz Quad Core + 1,8 GHz Quad Core</td>
								</tr>
								<tr>
									<th>İşletim Sistemi</th>
									<td>Android 9.0 (Pie)</td>
								</tr>
								<tr>
									<th>İşletim T&uuml;r&uuml;</th>
									<td>Android</td>
								</tr>
								<tr>
									<th>Kablosuz Şarj</th>
									<td>Yok</td>
								</tr>
								<tr>
									<th>Kamera &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml; Aralığı</th>
									<td>20 MP ve &Uuml;zeri</td>
								</tr>
								<tr>
									<th>Kamera &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml;</th>
									<td>48 MP + 8 MP + 2 MP + 2 MP</td>
								</tr>
								<tr>
									<th>Kamera Zoom (Yakınlaştırma)</th>
									<td>2x, Var</td>
								</tr>
								<tr>
									<th>Klavye</th>
									<td>Yok</td>
								</tr>
								<tr>
									<th>Konuşma S&uuml;resi</th>
									<td>Konuşma s&uuml;resi ile ilgili kesin bir bilgi bulunmamaktadır, &uuml;r&uuml;n&uuml;n modeline g&ouml;re değişiklik g&ouml;sterebilmektedir</td>
								</tr>
								<tr>
									<th>Mobil Bağlantı Hızı</th>
									<td>4.5G</td>
								</tr>
								<tr>
									<th>MP3 &Ccedil;alma</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>NFC (Yakın Alan İletişimi)</th>
									<td>Yok</td>
								</tr>
								<tr>
									<th>&Ouml;n (Selfie) Kamera Aralığı</th>
									<td>8 - 13,9 MP</td>
								</tr>
								<tr>
									<th>&Ouml;n (Selfie) Kamera</th>
									<td>13 MP</td>
								</tr>
								<tr>
									<th>Parmak İzi Okuyucu</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Pil G&uuml;c&uuml; Aralığı</th>
									<td>4000 - 4999 mAh</td>
								</tr>
								<tr>
									<th>Pil G&uuml;c&uuml;</th>
									<td>4000 mAh</td>
								</tr>
								<tr>
									<th>Pil T&uuml;r&uuml;</th>
									<td>Li-Po</td>
								</tr>
								<tr>
									<th>Radyo</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>RAM Kapasitesi</th>
									<td>4 GB RAM</td>
								</tr>
								<tr>
									<th>Ses Kayıt</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Şarj Girişi</th>
									<td>Type-C</td>
								</tr>
								<tr>
									<th>Şebeke</th>
									<td>800/850/900/1800/1900/2100/2300/2500/2600</td>
								</tr>
								<tr>
									<th>Telefon Hafızası</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Telefon Tipi</th>
									<td>Bar Tipi</td>
								</tr>
								<tr>
									<th>Video Kayıt</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Video Oynatma</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Wi-Fi</th>
									<td>802.11 a/b/g/n/ac</td>
								</tr>
								<tr>
									<th>Y&uuml;z Tanıma</th>
									<td>Var</td>
								</tr>
								<tr>
									<th>Zil Tipi</th>
									<td>Polifonik - MP3</td>
								</tr>
							</tbody>
						</table>

						<table>
							<caption>Diğer</caption>
							<tbody>
								<tr>
									<th>Garanti S&uuml;resi (Ay)</th>
									<td>24</td>
								</tr>
								<tr>
									<th>Yurt Dışı Satış</th>
									<td>Yok</td>
								</tr>
								<tr>
									<th>Stok Kodu</th>
									<td>HBV00000NBYGH</td>
								</tr>
							</tbody>
						</table>
						</td>
					</tr>
				</tbody>
			</table>
			</td>
		</tr>
	</tbody>
</table>
', CAST(4999.99 AS Decimal(18, 2)), CAST(0.00 AS Decimal(8, 2)), 13, NULL, 0, CAST(N'2020-05-03T13:22:17.577' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, N'Kahverengi Baskılı Basic Örme T-Shirt ', N'T-Shirt ', N'<ul>
	<li>15 g&uuml;n i&ccedil;inde &uuml;cretsiz iade.Detaylı bilgi i&ccedil;in&nbsp;<a href="javascript:void(0)">tıklayın</a></li>
	<li>24 saatte kargoda fırsatı iş g&uuml;nlerinde ge&ccedil;erlidir.</li>
	<li>Modelin &Ouml;l&ccedil;&uuml;leri: Boy: 1.78, G&ouml;ğ&uuml;s: 82 Bel: 62, Kal&ccedil;a:88</li>
	<li>Mankenin &uuml;zerindeki &uuml;r&uuml;n S/36 bedendir.</li>
	<li>%100 Pamuk, &Ouml;rme Kumaş</li>
	<li>Basic Kalıp</li>
	<li>#&Ouml;zel &Uuml;r&uuml;n: Konsept G&ouml;rsel</li>
</ul>
', CAST(29.84 AS Decimal(18, 2)), CAST(0.00 AS Decimal(8, 2)), 25, NULL, 1, CAST(N'2020-05-10T02:02:54.090' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, N'Çok Renkli Çiçek Desenli Kolları Volanlı Elbise', N'Elbise', NULL, CAST(29.99 AS Decimal(18, 2)), CAST(10.00 AS Decimal(8, 2)), 25, NULL, 0, CAST(N'2020-05-10T02:05:59.277' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, N'Kadın Siyah Ribana Paça Eşofman Altı Eşf0630 ', N'Eşofman Altı', NULL, CAST(55.50 AS Decimal(18, 2)), CAST(5.00 AS Decimal(8, 2)), 25, NULL, 1, CAST(N'2020-05-10T02:08:44.817' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, N'Adidas C77124 Beyaz Superstar Günlük Spor Ayakkabı', N'Adidas  Beyaz Superstar Günlük Spor Ayakkabı', NULL, CAST(429.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(8, 2)), 26, NULL, 0, CAST(N'2020-05-10T20:11:14.970' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, N'Kadın Beyaz V Yakalı Düğmeli Triko Hırka ', N'Hırka', NULL, CAST(62.95 AS Decimal(18, 2)), CAST(0.00 AS Decimal(8, 2)), 25, NULL, 0, CAST(N'2020-05-10T21:04:22.757' AS DateTime), 1, 0)
INSERT [dbo].[Product] ([ProductId], [Name], [ShortName], [Explanation], [Amount], [DiscountRate], [CategoryId], [ParentId], [IsShipperPay], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, N'Pull & Bear Kadın Lacivert Mavi Naylon Sırt Çantası', N' Çanta', N'<ul>
	<li>15 g&uuml;n i&ccedil;inde &uuml;cretsiz iade.Detaylı bilgi i&ccedil;in&nbsp;<a href="javascript:void(0)">tıklayın</a></li>
	<li>Bu &uuml;r&uuml;n&nbsp;Pull&amp;Bear&nbsp;tarafından g&ouml;nderilecektir.</li>
	<li>24 saatte kargoda fırsatı iş g&uuml;nlerinde ge&ccedil;erlidir.</li>
	<li>Ayarlanabilir omuz askılı, tutma saplı, i&ccedil; cepli, fermuarlı, &ouml;n cebi dikişli logolu, mavi naylon sırt &ccedil;antası.<br />
	<br />
	Y&uuml;kseklik x Genişlik x Derinlik: 40 x 30 x 11 cm.</li>
	<li>Kampanya fiyatından satılmak &uuml;zere 100 adetten fazla stok sunulmuştur.</li>
	<li>İncelemiş olduğunuz &uuml;r&uuml;n&uuml;n satış fiyatını satıcı belirlemektedir.</li>
</ul>
', CAST(119.95 AS Decimal(18, 2)), CAST(0.00 AS Decimal(8, 2)), 24, NULL, 0, CAST(N'2020-05-10T21:11:22.913' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductMapImage] ON 

INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, 3, N'65cefee6-8132329090267196740.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, 3, N'e67bc672-0132329090291089491.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, 3, N'ca81d22d-5132329090280095208.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, 4, N'7e009f97-5132329749437873591.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, 4, N'02955d40-b132329749437993673.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (7, 4, N'c2afede5-9132329749437943569.jpg', CAST(N'2020-05-03T00:00:00.000' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, 5, N'5b584874-b132335389740893871.jpg', CAST(N'2020-05-10T02:02:54.100' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, 5, N'0bda3038-1132335389740993602.jpg', CAST(N'2020-05-10T02:02:54.110' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, 5, N'6689bc4b-7132335389741083362.jpg', CAST(N'2020-05-10T02:02:54.113' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, 6, N'1168f7f0-5132335391592779183.jpg', CAST(N'2020-05-10T02:05:59.283' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, 6, N'9e1eb11c-5132335391592849005.jpg', CAST(N'2020-05-10T02:05:59.290' AS DateTime), 0, 1)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (13, 6, N'85597859-0132335391592908837.jpg', CAST(N'2020-05-10T02:05:59.303' AS DateTime), 0, 1)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (14, 7, N'dd5663d6-f132335393248158907.jpg', CAST(N'2020-05-10T02:08:44.823' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (15, 7, N'ba582162-1132335393248228729.jpg', CAST(N'2020-05-10T02:08:44.827' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (16, 7, N'f157ca5d-1132335393248278585.jpg', CAST(N'2020-05-10T02:08:44.840' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (17, 8, N'aa0c0a42-0132336042754740164.jpg', CAST(N'2020-05-10T20:11:15.480' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (18, 8, N'f8b44dcc-a132336042754810146.jpg', CAST(N'2020-05-10T20:11:15.487' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (19, 8, N'b320730c-e132336042754880119.jpg', CAST(N'2020-05-10T20:11:15.497' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (20, 8, N'fe43338b-f132336042754950105.jpg', CAST(N'2020-05-10T20:11:15.500' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (21, 9, N'48c84af5-b132336074627561574.jpg', CAST(N'2020-05-10T21:04:22.780' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (22, 9, N'8ec3ac19-a132336074627789773.jpg', CAST(N'2020-05-10T21:04:22.790' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (23, 9, N'5277ffab-f132336074627899812.jpg', CAST(N'2020-05-10T21:04:22.803' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (24, 10, N'9aae0c6b-e132336078829137335.jpg', CAST(N'2020-05-10T21:11:22.940' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (25, 10, N'dbd37127-e132336078829386126.jpg', CAST(N'2020-05-10T21:11:22.960' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (26, 10, N'14962e22-1132336078829607683.jpg', CAST(N'2020-05-10T21:11:22.987' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapImage] ([ProductMapImageId], [ProductId], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (27, 10, N'a9466f70-9132336078829874867.jpg', CAST(N'2020-05-10T21:11:23.070' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ProductMapImage] OFF
SET IDENTITY_INSERT [dbo].[ProductMapProperty] ON 

INSERT [dbo].[ProductMapProperty] ([ProductMapPropertyId], [ProductId], [PropetyKey], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (3, 3, N'4 GB RAM', CAST(N'2020-05-02T19:03:36.793' AS DateTime), 1, 0, 1)
INSERT [dbo].[ProductMapProperty] ([ProductMapPropertyId], [ProductId], [PropetyKey], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (4, 4, N'4 GB RAM', CAST(N'2020-05-03T13:22:23.787' AS DateTime), 1, 0, 1)
INSERT [dbo].[ProductMapProperty] ([ProductMapPropertyId], [ProductId], [PropetyKey], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (5, 4, N'2,0 GHz Quad Core + 1,8 GHz Quad Core1', CAST(N'2020-05-03T13:22:23.787' AS DateTime), 1, 0, 1)
SET IDENTITY_INSERT [dbo].[ProductMapProperty] OFF
SET IDENTITY_INSERT [dbo].[ProductMapRequiredFields] ON 

INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (1, 3, CAST(N'2020-05-02T19:03:43.430' AS DateTime), 1, 0, 26)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (2, 4, CAST(N'2020-05-03T13:22:23.787' AS DateTime), 1, 0, 24)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (3, 4, CAST(N'2020-05-03T13:22:23.787' AS DateTime), 1, 0, 25)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (4, 4, CAST(N'2020-05-03T13:22:23.787' AS DateTime), 1, 0, 26)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (5, 5, CAST(N'2020-05-10T14:55:46.800' AS DateTime), 1, 0, 9)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (6, 5, CAST(N'2020-05-10T14:55:46.800' AS DateTime), 1, 0, 8)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (7, 5, CAST(N'2020-05-10T14:55:46.800' AS DateTime), 1, 0, 10)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (8, 8, CAST(N'2020-05-10T20:11:15.473' AS DateTime), 1, 0, 19)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (9, 8, CAST(N'2020-05-10T20:11:15.473' AS DateTime), 1, 0, 20)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (10, 8, CAST(N'2020-05-10T20:11:15.473' AS DateTime), 1, 0, 21)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (11, 8, CAST(N'2020-05-10T20:11:15.473' AS DateTime), 1, 0, 22)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (12, 8, CAST(N'2020-05-10T20:11:15.473' AS DateTime), 1, 0, 23)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (13, 9, CAST(N'2020-05-10T21:04:22.757' AS DateTime), 1, 0, 9)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (14, 9, CAST(N'2020-05-10T21:04:22.757' AS DateTime), 1, 0, 8)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (15, 9, CAST(N'2020-05-10T21:04:22.757' AS DateTime), 1, 0, 10)
INSERT [dbo].[ProductMapRequiredFields] ([ProductMapRequiredFieldsId], [ProductId], [CreateDate], [IsActive], [IsDeleted], [ParameterId]) VALUES (16, 10, CAST(N'2020-05-10T21:11:22.913' AS DateTime), 1, 0, 10)
SET IDENTITY_INSERT [dbo].[ProductMapRequiredFields] OFF
SET IDENTITY_INSERT [dbo].[ProductMapShippers] ON 

INSERT [dbo].[ProductMapShippers] ([ProductMapShippersId], [ProductId], [ShipperId], [Amount], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, 5, 5, CAST(29.84 AS Decimal(18, 2)), CAST(N'2020-05-10T02:02:54.090' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapShippers] ([ProductMapShippersId], [ProductId], [ShipperId], [Amount], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, 7, 12, CAST(9.00 AS Decimal(18, 2)), CAST(N'2020-05-10T02:08:44.817' AS DateTime), 1, 0)
INSERT [dbo].[ProductMapShippers] ([ProductMapShippersId], [ProductId], [ShipperId], [Amount], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, 3, 5, CAST(10.00 AS Decimal(18, 2)), CAST(N'2020-05-10T21:20:34.573' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ProductMapShippers] OFF
SET IDENTITY_INSERT [dbo].[ProductStoreWindow] ON 

INSERT [dbo].[ProductStoreWindow] ([ProductStoreWindowId], [ProductId], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (1, 3, CAST(N'2020-05-19T00:00:00.000' AS DateTime), CAST(N'2020-05-09T21:36:16.373' AS DateTime), 1, 0)
INSERT [dbo].[ProductStoreWindow] ([ProductStoreWindowId], [ProductId], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (2, 4, CAST(N'2020-05-19T00:00:00.000' AS DateTime), CAST(N'2020-05-09T21:36:27.290' AS DateTime), 1, 0)
INSERT [dbo].[ProductStoreWindow] ([ProductStoreWindowId], [ProductId], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (3, 5, CAST(N'2020-05-26T00:00:00.000' AS DateTime), CAST(N'2020-05-10T02:25:06.700' AS DateTime), 1, 0)
INSERT [dbo].[ProductStoreWindow] ([ProductStoreWindowId], [ProductId], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted]) VALUES (4, 6, CAST(N'2020-05-10T00:00:00.000' AS DateTime), CAST(N'2020-05-10T02:25:06.707' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[ProductStoreWindow] OFF
SET IDENTITY_INSERT [dbo].[Shipper] ON 

INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (5, N'Aras', N'e874cd84-9132317109083400233.png', CAST(N'2020-04-18T22:15:07.627' AS DateTime), 1, 0)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (6, N'deneme', NULL, CAST(N'2020-04-18T19:28:55.593' AS DateTime), 0, 1)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (8, N'aa', NULL, CAST(N'2020-04-18T19:41:00.453' AS DateTime), 0, 1)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (9, N'bbb', NULL, CAST(N'2020-04-18T20:02:42.917' AS DateTime), 0, 1)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (10, N'hhhbbn', NULL, CAST(N'2020-04-18T22:09:28.600' AS DateTime), 1, 0)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (11, N'nnnn', NULL, CAST(N'2020-04-18T21:53:04.377' AS DateTime), 1, 0)
INSERT [dbo].[Shipper] ([ShipperId], [Name], [ImagePath], [CreateDate], [IsActive], [IsDeleted]) VALUES (12, N'Yurt içi', N'', CAST(N'2020-04-18T22:04:11.040' AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Shipper] OFF
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (5, N'test', N'b3979b82-f132317885431996836.jpg', CAST(N'2020-04-19T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime), 0, 1, N'https://www.trendyol.com/')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (6, N'test', N'be223c77-4132317888744668427.jpg', CAST(N'2020-04-19T00:00:00.000' AS DateTime), CAST(N'2020-04-19T00:00:00.000' AS DateTime), 1, 0, N'https://www.trendyol.com/')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (13, N'qweqweq', N'2350e2ac-1132317907057416895.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (14, N'qweqweq', N'a3031082-0132317907068868585.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (15, N'qweqweq', N'3fb8d449-c132317907071561377.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (16, N'qweqweq', N'6db18bd8-1132317907072608113.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (17, N'qweqweq', N'5a868e37-b132317907075250591.jpg', CAST(N'2020-01-08T00:00:00.000' AS DateTime), CAST(N'2020-04-02T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (25, N'qweqweq', N'5c04c489-2132317934739493908.jpg', CAST(N'2020-04-14T00:00:00.000' AS DateTime), CAST(N'2020-04-29T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (26, N'qweqweq', N'21267ffc-3132317934761523782.jpg', CAST(N'2020-04-14T00:00:00.000' AS DateTime), CAST(N'2020-04-29T00:00:00.000' AS DateTime), 0, 1, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (27, N'qweqweq', N'12cd1c8d-1132317934765408747.jpg', CAST(N'2021-01-13T00:00:00.000' AS DateTime), CAST(N'2020-08-04T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (28, N'qweqweq', N'e8b267f1-4132317934768210052.jpg', CAST(N'2020-04-14T00:00:00.000' AS DateTime), CAST(N'2020-04-29T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (29, N'qweqweq', N'9559af6c-e132317936474837213.jpg', CAST(N'2020-04-14T00:00:00.000' AS DateTime), CAST(N'2020-04-29T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (30, N'weqweqw', N'2edb9180-7132317958596678070.png', CAST(N'2020-01-04T00:00:00.000' AS DateTime), CAST(N'2020-09-04T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (31, N'qweqweq', N'aefb12cd-5132317959902323432.png', CAST(N'2020-06-04T00:00:00.000' AS DateTime), CAST(N'2020-08-04T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (32, N'qweqweq', N'360e2750-5132317960417333975.png', CAST(N'2020-05-04T00:00:00.000' AS DateTime), CAST(N'2020-12-04T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (33, N'qweqweq', N'c59eaa59-2132317965638836776.png', CAST(N'2020-04-08T00:00:00.000' AS DateTime), CAST(N'2019-01-09T00:00:00.000' AS DateTime), 1, 0, N'https://www.google.com/_/chrome/newtab?ie=UTF-8')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (34, N'test', N'db81f3f4-4132320684056892682.jpg', CAST(N'2020-04-30T00:00:00.000' AS DateTime), CAST(N'2020-04-23T00:00:00.000' AS DateTime), 1, 0, N'test')
INSERT [dbo].[Slider] ([SliderId], [Title], [ImagePath], [ExpiredDate], [CreateDate], [IsActive], [IsDeleted], [RedirectUrl]) VALUES (35, N'Test', N'6ffacc9b-0132320703511670491.jpg', CAST(N'2020-04-16T00:00:00.000' AS DateTime), CAST(N'2020-04-16T00:00:00.000' AS DateTime), 1, 0, N'www.dr.com.tr')
SET IDENTITY_INSERT [dbo].[Slider] OFF
SET IDENTITY_INSERT [dbo].[UserCart] ON 

INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (1, 1, 3, 2, CAST(N'2020-05-07T22:25:31.320' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (2, 1, 4, 11, CAST(N'2020-05-07T22:26:22.550' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (3, 1, 3, 2, CAST(N'2020-05-08T01:32:20.383' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (4, 1, 5, 11, CAST(N'2020-05-10T15:09:11.393' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (5, 1, 8, 1, CAST(N'2020-05-11T23:54:02.973' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (6, 1, 3, 11, CAST(N'2020-05-12T04:17:56.140' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (7, 1, 7, 11, CAST(N'2020-05-12T04:23:51.437' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (8, 1, 6, 23, CAST(N'2020-05-12T04:24:39.773' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (9, 1, 10, 11, CAST(N'2020-05-12T04:25:45.143' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (10, 1, 8, 2, CAST(N'2020-05-12T04:26:42.133' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (11, 1, 9, 2, CAST(N'2020-05-12T04:27:26.247' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (12, 2, 4, 3, CAST(N'2020-05-12T19:54:33.820' AS DateTime), 0, 1, 25)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (13, 2, 3, 3, CAST(N'2020-05-12T20:11:29.860' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (15, 1, 4, 1, CAST(N'2020-05-12T22:35:03.183' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (16, 1, 4, 5, CAST(N'2020-05-13T02:18:10.870' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (17, 1, 3, 2, CAST(N'2020-05-13T02:18:15.077' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (18, 1, 5, 3, CAST(N'2020-05-13T02:22:57.523' AS DateTime), 0, 1, 10)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (19, 1, 6, 2, CAST(N'2020-05-13T02:27:07.733' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (20, 1, 5, 2, CAST(N'2020-05-13T02:33:22.637' AS DateTime), 0, 1, 10)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (21, 1, 3, 1, CAST(N'2020-05-17T14:26:21.880' AS DateTime), 0, 1, 26)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (22, 1, 6, 1, CAST(N'2020-05-17T14:26:26.233' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (23, 1, 4, 1, CAST(N'2020-05-17T14:29:27.347' AS DateTime), 0, 1, 25)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (24, 1, 7, 1, CAST(N'2020-05-17T18:48:29.780' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (25, 1, 4, 2, CAST(N'2020-05-17T19:39:42.113' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (26, 1, 3, 1, CAST(N'2020-05-17T19:39:48.607' AS DateTime), 0, 1, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (27, 1, 5, 1, CAST(N'2020-05-17T19:54:04.573' AS DateTime), 1, 0, 10)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (28, 1, 6, 1, CAST(N'2020-05-17T19:54:10.973' AS DateTime), 1, 0, NULL)
INSERT [dbo].[UserCart] ([UserCartId], [AppUserId], [ProductId], [ProductCount], [CreateDate], [IsActive], [IsDeleted], [ParameterProductRequiredTypesId]) VALUES (29, 1, 3, 2, CAST(N'2020-05-17T19:54:14.943' AS DateTime), 1, 0, NULL)
SET IDENTITY_INSERT [dbo].[UserCart] OFF
ALTER TABLE [dbo].[AppUser] ADD  DEFAULT ((4)) FOR [ParameterGenderId]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_CreateDate]  DEFAULT (((2020)-(4))-(25)) FOR [CreateDate]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF_City_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_CreateDate]  DEFAULT (((2020)-(4))-(25)) FOR [CreateDate]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductMapProperty] ADD  DEFAULT ((1)) FOR [ParameterId]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD FOREIGN KEY([CountyId])
REFERENCES [dbo].[County] ([CountyId])
GO
ALTER TABLE [dbo].[AppUser]  WITH CHECK ADD FOREIGN KEY([ParameterGenderId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[AppUserMapAddress]  WITH CHECK ADD  CONSTRAINT [FK__AppUserMa__Addre__412EB0B6] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[AppUserMapAddress] CHECK CONSTRAINT [FK__AppUserMa__Addre__412EB0B6]
GO
ALTER TABLE [dbo].[AppUserMapAddress]  WITH CHECK ADD  CONSTRAINT [FK__AppUserMa__AppUs__2739D489] FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[AppUserMapAddress] CHECK CONSTRAINT [FK__AppUserMa__AppUs__2739D489]
GO
ALTER TABLE [dbo].[AppUserMapWish]  WITH CHECK ADD FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[AppUserMapWish]  WITH CHECK ADD  CONSTRAINT [FK__AppUserMa__Produ__6477ECF3] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[AppUserMapWish] CHECK CONSTRAINT [FK__AppUserMa__Produ__6477ECF3]
GO
ALTER TABLE [dbo].[County]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([AddressId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([DiscountKeyId])
REFERENCES [dbo].[DiscountKey] ([DiscountKeyId])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([ParameterPaymentTypeId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ParameterRequiredFieldsId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Parameter]  WITH CHECK ADD FOREIGN KEY([ParameterTypeId])
REFERENCES [dbo].[ParameterType] ([ParameterTypeId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__Categor__47DBAE45] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__Categor__47DBAE45]
GO
ALTER TABLE [dbo].[ProductMapComment]  WITH CHECK ADD FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[ProductMapComment]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Produ__5FB337D6] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMapComment] CHECK CONSTRAINT [FK__ProductMa__Produ__5FB337D6]
GO
ALTER TABLE [dbo].[ProductMapImage]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Produ__4AB81AF0] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMapImage] CHECK CONSTRAINT [FK__ProductMa__Produ__4AB81AF0]
GO
ALTER TABLE [dbo].[ProductMapProperty]  WITH CHECK ADD FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[ProductMapProperty]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Produ__59FA5E80] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMapProperty] CHECK CONSTRAINT [FK__ProductMa__Produ__59FA5E80]
GO
ALTER TABLE [dbo].[ProductMapRequiredFields]  WITH CHECK ADD FOREIGN KEY([ParameterId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[ProductMapRequiredFields]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Produ__5629CD9C] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMapRequiredFields] CHECK CONSTRAINT [FK__ProductMa__Produ__5629CD9C]
GO
ALTER TABLE [dbo].[ProductMapShippers]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Produ__4D94879B] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductMapShippers] CHECK CONSTRAINT [FK__ProductMa__Produ__4D94879B]
GO
ALTER TABLE [dbo].[ProductMapShippers]  WITH CHECK ADD  CONSTRAINT [FK__ProductMa__Shipp__4E88ABD4] FOREIGN KEY([ShipperId])
REFERENCES [dbo].[Shipper] ([ShipperId])
GO
ALTER TABLE [dbo].[ProductMapShippers] CHECK CONSTRAINT [FK__ProductMa__Shipp__4E88ABD4]
GO
ALTER TABLE [dbo].[ProductStoreWindow]  WITH CHECK ADD  CONSTRAINT [FK__ProductSt__Produ__756D6ECB] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductStoreWindow] CHECK CONSTRAINT [FK__ProductSt__Produ__756D6ECB]
GO
ALTER TABLE [dbo].[UserCart]  WITH CHECK ADD FOREIGN KEY([AppUserId])
REFERENCES [dbo].[AppUser] ([AppUserId])
GO
ALTER TABLE [dbo].[UserCart]  WITH CHECK ADD FOREIGN KEY([ParameterProductRequiredTypesId])
REFERENCES [dbo].[Parameter] ([ParameterId])
GO
ALTER TABLE [dbo].[UserCart]  WITH CHECK ADD  CONSTRAINT [FK__UserCart__Produc__68487DD7] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[UserCart] CHECK CONSTRAINT [FK__UserCart__Produc__68487DD7]
GO
/****** Object:  StoredProcedure [dbo].[GetParentCategoryId]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create   procedure [dbo].[GetParentCategoryId](@categoryId int)
 as
 WITH n AS 
       (SELECT f.CategoryId, f.TopCategoryId, ',' + cast(f.CategoryId as varchar(max)) + ',' levels
        FROM Category f where f.CategoryId = @categoryId
       UNION ALL

       SELECT n.CategoryId, nplus1.TopCategoryId,n.levels+ cast(n.TopCategoryId as varchar(max)) + ',' levels
        FROM Category as nplus1, n
            WHERE n.TopCategoryId = nplus1.CategoryId AND
            n.levels not like ('%,' + cast(nplus1.TopCategoryId as varchar(max)) + ',%')
       )

 SELECT Top 1 MAX(levels) levels FROM n  
GO
/****** Object:  StoredProcedure [dbo].[GetRecursiveChildCategory]    Script Date: 7/2/2020 6:58:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[GetRecursiveChildCategory]( @Id int)
as

;WITH ParentChildCTE
AS (
    SELECT CategoryId, TopCategoryId, Name        
    FROM Category
    WHERE CategoryId = @ID

    UNION ALL

    SELECT T1.CategoryId, T1.TopCategoryId, T1.Name        
    FROM Category T1
    INNER JOIN ParentChildCTE T ON T.CategoryId = T1.TopCategoryId
    WHERE T1.TopCategoryId IS NOT NULL
    )
SELECT *
FROM ParentChildCTE
GO
