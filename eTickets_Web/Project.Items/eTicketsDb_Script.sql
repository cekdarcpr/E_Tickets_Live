USE [master]
GO
/****** Object:  Database [eTicketsDb]    Script Date: 9.01.2024 07:19:12 ******/
CREATE DATABASE [eTicketsDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eTicketsDb', FILENAME = N'C:\ProjectData\eTicketsDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eTicketsDb_log', FILENAME = N'C:\ProjectData\eTicketsDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eTicketsDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eTicketsDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eTicketsDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eTicketsDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eTicketsDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eTicketsDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eTicketsDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [eTicketsDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eTicketsDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eTicketsDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eTicketsDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eTicketsDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eTicketsDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eTicketsDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eTicketsDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eTicketsDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eTicketsDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [eTicketsDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eTicketsDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eTicketsDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eTicketsDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eTicketsDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eTicketsDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [eTicketsDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eTicketsDb] SET RECOVERY FULL 
GO
ALTER DATABASE [eTicketsDb] SET  MULTI_USER 
GO
ALTER DATABASE [eTicketsDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eTicketsDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eTicketsDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eTicketsDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eTicketsDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eTicketsDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eTicketsDb', N'ON'
GO
ALTER DATABASE [eTicketsDb] SET QUERY_STORE = OFF
GO
USE [eTicketsDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureURL] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors_Movies]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors_Movies](
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_Actors_Movies] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC,
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cinemas]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cinemas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logo] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cinemas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[ImageURL] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[MovieCategory] [int] NOT NULL,
	[CinemaId] [int] NOT NULL,
	[ProducerId] [int] NOT NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 9.01.2024 07:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProfilePictureURL] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Bio] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230523040208_Initial', N'6.0.16')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230601002633_Identity_Added', N'6.0.16')
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1, N'http://dotnethow.net/images/actors/actor-1.jpeg', N'Actor 1', N'This is the Bio of the first actor')
INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (2, N'http://dotnethow.net/images/actors/actor-2.jpeg', N'Actor 2', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (3, N'http://dotnethow.net/images/actors/actor-3.jpeg', N'Angelina Jolly', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (4, N'http://dotnethow.net/images/actors/actor-4.jpeg', N'Actor 4', N'This is the Bio of the second actor')
INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (5, N'http://dotnethow.net/images/actors/actor-5.jpeg', N'Will Smith', N'Hem şarkıcı hem artist - Independence Day')
INSERT [dbo].[Actors] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1003, N'http://dotnethow.net/images/actors/actor-1.jpeg', N'Robert De Niro', N'Bio')
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (2, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (2, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 1)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (3, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (4, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 2)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (5, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (6, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1004, 3)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1004, 4)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1004, 5)
INSERT [dbo].[Actors_Movies] ([MovieId], [ActorId]) VALUES (1004, 1003)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'2296e055-9a9b-4fdf-8cb0-256105b7697a', N'Admin', N'ADMIN', N'48aa8b9b-5b41-4b67-8f9b-784693594fcc')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'26ca9a9b-c23f-4482-95ee-1411a646313f', N'User', N'USER', N'8a8f113c-51ce-4f3b-b594-60eb66e3330e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6b3bc20b-06d0-4cc2-be5e-5c1bdf80ca44', N'2296e055-9a9b-4fdf-8cb0-256105b7697a')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2cf88c6f-d203-4b91-807a-e395ad42c48f', N'26ca9a9b-c23f-4482-95ee-1411a646313f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'30264d88-ed3a-40b0-827e-aa10a5a200a6', N'26ca9a9b-c23f-4482-95ee-1411a646313f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5257cca8-4317-49e9-a0d0-f19257051a17', N'26ca9a9b-c23f-4482-95ee-1411a646313f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'658d3e5b-2772-4b80-b91a-6a6b06f352b3', N'26ca9a9b-c23f-4482-95ee-1411a646313f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'2cf88c6f-d203-4b91-807a-e395ad42c48f', N'Application User', N'app-user', N'APP-USER', N'user@etickets.com', N'USER@ETICKETS.COM', 1, N'AQAAAAEAACcQAAAAEKILrK8YFdbjxKPeI201eKRPy1YgWNCA3CL0/iewK5vmqqNEadf2/MEiHnLr8dTalA==', N'EJBCUVWNORTS3MTLDMSLFALJ46APISAH', N'8af93850-2ea7-4305-8779-75d32d3bf5e3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'30264d88-ed3a-40b0-827e-aa10a5a200a6', N'ÜMİT KARAÇİVİ', N'uk@etickets.com', N'UK@ETICKETS.COM', N'uk@etickets.com', N'UK@ETICKETS.COM', 1, N'AQAAAAEAACcQAAAAEPjRVuK1+zP3fflESyJi1ImJW5+m+YAZYUTvaoEisOfOqBJKD5uEplITu/4/m91Vfg==', N'WS3ZEBCLKIXCQJNIKTS2P6UW3WBLUSSR', N'94b1298b-5af8-4c81-9196-c7f5bc3221bd', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5257cca8-4317-49e9-a0d0-f19257051a17', N'ÜMİT KARAÇİVİ', N'uksmusic@outlook.com', N'UKSMUSIC@OUTLOOK.COM', N'uksmusic@outlook.com', N'UKSMUSIC@OUTLOOK.COM', 1, N'AQAAAAEAACcQAAAAEOEHO1DAFO9dadm6tSxc0YjKEiC5v1zbBjMSiIeHv8U/5FCgfThn3C/QT5Z2nhPLXw==', N'GZHWSI76B7EBVPOUAMFZCCB3OPQVZ4I6', N'6aad9343-2b7b-42dd-890a-d7128ffc6c61', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'658d3e5b-2772-4b80-b91a-6a6b06f352b3', N'ÜMİT KARAÇİVİ', N'unicercom@outlook.com', N'UNICERCOM@OUTLOOK.COM', N'unicercom@outlook.com', N'UNICERCOM@OUTLOOK.COM', 0, N'AQAAAAEAACcQAAAAEBO4JZ4O99mBi6mqWtykGA0T5BnDt2wAMELtnfjRUzzMjgvvxfAaKaeHDJpPoLH6dQ==', N'4OFS3RYTVLP7N7AD3ZY2PXNHZETIBMFA', N'f3da2fb4-c105-4fe3-a1dc-45ad6adc21b8', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6b3bc20b-06d0-4cc2-be5e-5c1bdf80ca44', N'Admin User', N'admin-user', N'ADMIN-USER', N'admin@etickets.com', N'ADMIN@ETICKETS.COM', 1, N'AQAAAAEAACcQAAAAECOh1ujOC0YTtWV7kjfa+tYZAStnepnwhgvh7A1p7Q3XF7V6t1NXl+ZC0VL6KZ9AMQ==', N'ZBCYDWRCATEMMGASLBROBQTTPRC7F52W', N'9627ef2d-55e9-43d9-9055-93b666cc8885', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Cinemas] ON 

INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (1, N'http://dotnethow.net/images/cinemas/cinema-1.jpeg', N'Cinema 1', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (2, N'http://dotnethow.net/images/cinemas/cinema-2.jpeg', N'Cinema 2', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (3, N'http://dotnethow.net/images/cinemas/cinema-3.jpeg', N'Cinema 3', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (4, N'http://dotnethow.net/images/cinemas/cinema-4.jpeg', N'Cinema 4', N'This is the description of the first cinema')
INSERT [dbo].[Cinemas] ([Id], [Logo], [Name], [Description]) VALUES (5, N'http://dotnethow.net/images/cinemas/cinema-5.jpeg', N'Cinema 5', N'This is the description of the first cinema')
SET IDENTITY_INSERT [dbo].[Cinemas] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (1, N'Life', N'This is the Life movie description', 39.5, N'http://dotnethow.net/images/movies/movie-3.jpeg', CAST(N'2023-05-13T07:22:04.5785428' AS DateTime2), CAST(N'2023-06-02T07:22:04.6013739' AS DateTime2), 4, 3, 3)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (2, N'The Shawshank Redemption', N'This is the Shawshank Redemption description', 29.5, N'http://dotnethow.net/images/movies/movie-1.jpeg', CAST(N'2023-05-23T07:22:04.6279475' AS DateTime2), CAST(N'2023-05-26T07:22:04.6380056' AS DateTime2), 1, 1, 1)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (3, N'Ghost', N'This is the Ghost movie description', 39.5, N'http://dotnethow.net/images/movies/movie-4.jpeg', CAST(N'2023-05-23T07:22:04.6654593' AS DateTime2), CAST(N'2023-05-30T07:22:04.6764156' AS DateTime2), 6, 4, 4)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (4, N'Race', N'This is the Race movie description', 39.5, N'http://dotnethow.net/images/movies/movie-6.jpeg', CAST(N'2023-05-13T07:22:04.7043002' AS DateTime2), CAST(N'2023-05-18T07:22:04.7406339' AS DateTime2), 4, 1, 2)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (5, N'Scoob', N'This is the Scoob movie description', 39.5, N'http://dotnethow.net/images/movies/movie-7.jpeg', CAST(N'2023-05-13T07:22:04.7657309' AS DateTime2), CAST(N'2023-05-21T07:22:04.7892874' AS DateTime2), 5, 1, 3)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (6, N'Cold Soles', N'This is the Cold Soles movie description', 39.5, N'http://dotnethow.net/images/movies/movie-8.jpeg', CAST(N'2023-05-26T07:22:04.8132374' AS DateTime2), CAST(N'2023-06-12T07:22:04.8332444' AS DateTime2), 3, 1, 5)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (1002, N'Test Movie', N'Desc', 5, N'http://dotnethow.net/images/movies/movie-3.jpeg', CAST(N'2023-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-06-30T00:00:00.0000000' AS DateTime2), 3, 5, 1002)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (1003, N'Deneme', N'Desc', 25, N'http://dotnethow.net/images/movies/movie-3.jpeg', CAST(N'2023-07-19T00:00:00.0000000' AS DateTime2), CAST(N'2023-07-30T00:00:00.0000000' AS DateTime2), 2, 2, 3)
INSERT [dbo].[Movies] ([Id], [Name], [Description], [Price], [ImageURL], [StartDate], [EndDate], [MovieCategory], [CinemaId], [ProducerId]) VALUES (1004, N'Deneme 2', N'Desc2', 100, N'http://dotnethow.net/images/movies/movie-1.jpeg', CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2023-08-31T00:00:00.0000000' AS DateTime2), 3, 3, 3)
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 

INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1, N'http://dotnethow.net/images/producers/producer-1.jpeg', N'Producer 1', N'This is the Bio of the first actor')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (2, N'http://dotnethow.net/images/producers/producer-2.jpeg', N'Producer 2', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (3, N'http://dotnethow.net/images/producers/producer-3.jpeg', N'Quentin Tarantino', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (4, N'http://dotnethow.net/images/producers/producer-4.jpeg', N'Producer 4', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (5, N'http://dotnethow.net/images/producers/producer-5.jpeg', N'Producer 5', N'This is the Bio of the second actor')
INSERT [dbo].[Producers] ([Id], [ProfilePictureURL], [FullName], [Bio]) VALUES (1002, N'http://dotnethow.net/images/producers/producer-2.jpeg', N'Steven Spielberg', N'Bio Bio Bio')
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
/****** Object:  Index [IX_Actors_Movies_MovieId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_Actors_Movies_MovieId] ON [dbo].[Actors_Movies]
(
	[MovieId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9.01.2024 07:19:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9.01.2024 07:19:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_CinemaId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_CinemaId] ON [dbo].[Movies]
(
	[CinemaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_ProducerId]    Script Date: 9.01.2024 07:19:12 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_ProducerId] ON [dbo].[Movies]
(
	[ProducerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actors_Movies]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Movies_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actors_Movies] CHECK CONSTRAINT [FK_Actors_Movies_Actors_ActorId]
GO
ALTER TABLE [dbo].[Actors_Movies]  WITH CHECK ADD  CONSTRAINT [FK_Actors_Movies_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Actors_Movies] CHECK CONSTRAINT [FK_Actors_Movies_Movies_MovieId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Cinemas_CinemaId] FOREIGN KEY([CinemaId])
REFERENCES [dbo].[Cinemas] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Cinemas_CinemaId]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Producers_ProducerId] FOREIGN KEY([ProducerId])
REFERENCES [dbo].[Producers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Producers_ProducerId]
GO
USE [master]
GO
ALTER DATABASE [eTicketsDb] SET  READ_WRITE 
GO
