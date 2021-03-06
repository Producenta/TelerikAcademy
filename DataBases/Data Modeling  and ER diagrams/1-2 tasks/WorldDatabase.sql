USE [master]
GO
/****** Object:  Database [WorldDatabase]    Script Date: 23.8.2014 г. 09:02:06 ч. ******/
CREATE DATABASE [WorldDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WorldDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WorldDatabase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WorldDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\WorldDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WorldDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WorldDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WorldDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WorldDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WorldDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WorldDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WorldDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [WorldDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WorldDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WorldDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WorldDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WorldDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WorldDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WorldDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WorldDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WorldDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WorldDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WorldDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WorldDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WorldDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WorldDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WorldDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WorldDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WorldDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WorldDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WorldDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [WorldDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WorldDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WorldDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WorldDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [WorldDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [WorldDatabase]
GO
/****** Object:  Table [dbo].[Adress]    Script Date: 23.8.2014 г. 09:02:07 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adress](
	[AdressID] [int] IDENTITY(1,1) NOT NULL,
	[AdressText] [nvarchar](50) NOT NULL,
	[TownID] [int] NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[AdressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Continent]    Script Date: 23.8.2014 г. 09:02:07 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Continent](
	[ContinentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Continent] PRIMARY KEY CLUSTERED 
(
	[ContinentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Country]    Script Date: 23.8.2014 г. 09:02:07 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContinentID] [int] NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 23.8.2014 г. 09:02:07 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[AdressID] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Town]    Script Date: 23.8.2014 г. 09:02:07 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Town](
	[TownID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Town] PRIMARY KEY CLUSTERED 
(
	[TownID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Adress] ON 

INSERT [dbo].[Adress] ([AdressID], [AdressText], [TownID]) VALUES (1, N'TelerikAcademy', 1)
INSERT [dbo].[Adress] ([AdressID], [AdressText], [TownID]) VALUES (2, N'PostOffice', 2)
INSERT [dbo].[Adress] ([AdressID], [AdressText], [TownID]) VALUES (4, N'YellowPeople', 3)
SET IDENTITY_INSERT [dbo].[Adress] OFF
SET IDENTITY_INSERT [dbo].[Continent] ON 

INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (1, N'Europe')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (2, N'Africa')
INSERT [dbo].[Continent] ([ContinentID], [Name]) VALUES (3, N'Azia')
SET IDENTITY_INSERT [dbo].[Continent] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (1, N'Bulgaria', 1)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (2, N'UAR', 2)
INSERT [dbo].[Country] ([CountryID], [Name], [ContinentID]) VALUES (3, N'China', 3)
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Town] ON 

INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (1, N'Sofia', 1)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (2, N'UARCity', 2)
INSERT [dbo].[Town] ([TownID], [Name], [CountryID]) VALUES (3, N'Pekin', 3)
SET IDENTITY_INSERT [dbo].[Town] OFF
ALTER TABLE [dbo].[Adress]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Town] FOREIGN KEY([TownID])
REFERENCES [dbo].[Town] ([TownID])
GO
ALTER TABLE [dbo].[Adress] CHECK CONSTRAINT [FK_Adress_Town]
GO
ALTER TABLE [dbo].[Country]  WITH CHECK ADD  CONSTRAINT [FK_Country_Continent] FOREIGN KEY([ContinentID])
REFERENCES [dbo].[Continent] ([ContinentID])
GO
ALTER TABLE [dbo].[Country] CHECK CONSTRAINT [FK_Country_Continent]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Adress] FOREIGN KEY([AdressID])
REFERENCES [dbo].[Adress] ([AdressID])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Adress]
GO
ALTER TABLE [dbo].[Town]  WITH CHECK ADD  CONSTRAINT [FK_Town_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([CountryID])
GO
ALTER TABLE [dbo].[Town] CHECK CONSTRAINT [FK_Town_Country]
GO
USE [master]
GO
ALTER DATABASE [WorldDatabase] SET  READ_WRITE 
GO
