USE [master]
GO
/****** Object:  Database [Job_Management]    Script Date: 1/1/2023 11:41:44 PM ******/
CREATE DATABASE [Job_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Job_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Job_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Job_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Job_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Job_Management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Job_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Job_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Job_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Job_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Job_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Job_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Job_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Job_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Job_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Job_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Job_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Job_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Job_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Job_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Job_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Job_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Job_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Job_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Job_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Job_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Job_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Job_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Job_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Job_Management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Job_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Job_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Job_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Job_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Job_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Job_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Job_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Job_Management] SET QUERY_STORE = OFF
GO
USE [Job_Management]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/1/2023 11:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobPosition]    Script Date: 1/1/2023 11:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobPosition](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[PostedDate] [datetime] NOT NULL,
	[ClosingDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 1/1/2023 11:41:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NULL,
	[City] [varchar](250) NULL,
	[Country] [varchar](250) NULL,
	[Zipcode] [varchar](10) NULL,
	[State] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Title]) VALUES (1, N'Computer')
INSERT [dbo].[Department] ([Id], [Title]) VALUES (2, N'SoftWare-Development')
INSERT [dbo].[Department] ([Id], [Title]) VALUES (3, N'Research and Development')
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[JobPosition] ON 

INSERT [dbo].[JobPosition] ([Id], [Code], [Title], [Description], [DepartmentId], [LocationId], [PostedDate], [ClosingDate]) VALUES (4, N'JOB-00', N'Software Developer', N'Job description here...', 1, 1, CAST(N'2021-08-30T18:43:31.877' AS DateTime), CAST(N'2021-08-30T18:43:31.877' AS DateTime))
INSERT [dbo].[JobPosition] ([Id], [Code], [Title], [Description], [DepartmentId], [LocationId], [PostedDate], [ClosingDate]) VALUES (5, N'JOB-05', N'Software Developer', N'.NET Technologies', 1, 1, CAST(N'2023-01-01T15:58:04.833' AS DateTime), CAST(N'2021-08-30T18:43:31.877' AS DateTime))
INSERT [dbo].[JobPosition] ([Id], [Code], [Title], [Description], [DepartmentId], [LocationId], [PostedDate], [ClosingDate]) VALUES (6, N'JOB-06', N'Technical Analyst', N'Technical', 1, 1, CAST(N'2023-01-01T22:45:14.547' AS DateTime), CAST(N'2021-08-30T18:43:31.877' AS DateTime))
SET IDENTITY_INSERT [dbo].[JobPosition] OFF
GO
SET IDENTITY_INSERT [dbo].[Location] ON 

INSERT [dbo].[Location] ([Id], [Title], [City], [Country], [Zipcode], [State]) VALUES (1, N'London HeadQuarter', N'Panaji-Goa', N'India', N'403001', N'Goa')
INSERT [dbo].[Location] ([Id], [Title], [City], [Country], [Zipcode], [State]) VALUES (2, N'London Head Office', N'Baltimore', N'United States', NULL, N'MD')
INSERT [dbo].[Location] ([Id], [Title], [City], [Country], [Zipcode], [State]) VALUES (3, N'Goa Head Office', N'Verna', N'India', N'403002', N'MD')
SET IDENTITY_INSERT [dbo].[Location] OFF
GO
ALTER TABLE [dbo].[JobPosition]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[JobPosition]  WITH CHECK ADD FOREIGN KEY([LocationId])
REFERENCES [dbo].[Location] ([Id])
GO
USE [master]
GO
ALTER DATABASE [Job_Management] SET  READ_WRITE 
GO
