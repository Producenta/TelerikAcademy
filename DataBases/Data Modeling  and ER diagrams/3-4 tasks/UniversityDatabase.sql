USE [master]
GO
/****** Object:  Database [UniversityDatabase]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
CREATE DATABASE [UniversityDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityDatabase.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UniversityDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\UniversityDatabase_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UniversityDatabase] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UniversityDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDatabase] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UniversityDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UniversityDatabase]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ProfessorId] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[FaciulitiesID] [int] NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Faculties]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Faculties](
	[FacultyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Faculties] PRIMARY KEY CLUSTERED 
(
	[FacultyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Professors]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Professors](
	[ProfessorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CoursesID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Professors] PRIMARY KEY CLUSTERED 
(
	[ProfessorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProfessorTitles]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessorTitles](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[ProfessorID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentCourses]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Titles]    Script Date: 23.8.2014 г. 14:05:25 ч. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[TitleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Titles_1] PRIMARY KEY CLUSTERED 
(
	[TitleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [Name], [ProfessorId], [DepartmentID]) VALUES (3, N'History', 3, 3)
INSERT [dbo].[Courses] ([CourseID], [Name], [ProfessorId], [DepartmentID]) VALUES (4, N'Math', 4, 5)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [Name], [FaciulitiesID]) VALUES (3, N'HistoryScience', 5)
INSERT [dbo].[Departments] ([DepartmentID], [Name], [FaciulitiesID]) VALUES (5, N'MathScience', 6)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Faculties] ON 

INSERT [dbo].[Faculties] ([FacultyID], [Name]) VALUES (5, N'AllHistory')
INSERT [dbo].[Faculties] ([FacultyID], [Name]) VALUES (6, N'Math')
SET IDENTITY_INSERT [dbo].[Faculties] OFF
SET IDENTITY_INSERT [dbo].[Professors] ON 

INSERT [dbo].[Professors] ([ProfessorId], [Name], [CoursesID], [DepartmentID]) VALUES (3, N'Georgio', 1, 3)
INSERT [dbo].[Professors] ([ProfessorId], [Name], [CoursesID], [DepartmentID]) VALUES (4, N'Mujo', 2, 5)
INSERT [dbo].[Professors] ([ProfessorId], [Name], [CoursesID], [DepartmentID]) VALUES (5, N'Dojo', 1, 3)
SET IDENTITY_INSERT [dbo].[Professors] OFF
SET IDENTITY_INSERT [dbo].[ProfessorTitles] ON 

INSERT [dbo].[ProfessorTitles] ([TitleID], [ProfessorID]) VALUES (2, 3)
INSERT [dbo].[ProfessorTitles] ([TitleID], [ProfessorID]) VALUES (3, 4)
INSERT [dbo].[ProfessorTitles] ([TitleID], [ProfessorID]) VALUES (4, 5)
SET IDENTITY_INSERT [dbo].[ProfessorTitles] OFF
INSERT [dbo].[StudentCourses] ([StudentID], [CourseID]) VALUES (7, 3)
INSERT [dbo].[StudentCourses] ([StudentID], [CourseID]) VALUES (8, 3)
INSERT [dbo].[StudentCourses] ([StudentID], [CourseID]) VALUES (9, 4)
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (7, N'Gancho', N'Troicho')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (8, N'Doncho', N'Fochev')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (9, N'Pesho', N'Goshov')
INSERT [dbo].[Students] ([StudentID], [FirstName], [LastName]) VALUES (10, N'Traiko', N'Luskov')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([TitleID], [Name]) VALUES (2, N'senior')
INSERT [dbo].[Titles] ([TitleID], [Name]) VALUES (3, N'assistant')
INSERT [dbo].[Titles] ([TitleID], [Name]) VALUES (4, N'helper')
INSERT [dbo].[Titles] ([TitleID], [Name]) VALUES (5, N'junior')
SET IDENTITY_INSERT [dbo].[Titles] OFF
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Departments]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Professors] FOREIGN KEY([ProfessorId])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Professors]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK_Departments_Faculties] FOREIGN KEY([FaciulitiesID])
REFERENCES [dbo].[Faculties] ([FacultyID])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK_Departments_Faculties]
GO
ALTER TABLE [dbo].[Professors]  WITH CHECK ADD  CONSTRAINT [FK_Professors_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Professors] CHECK CONSTRAINT [FK_Professors_Departments]
GO
ALTER TABLE [dbo].[ProfessorTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorTitles_Professors] FOREIGN KEY([ProfessorID])
REFERENCES [dbo].[Professors] ([ProfessorId])
GO
ALTER TABLE [dbo].[ProfessorTitles] CHECK CONSTRAINT [FK_ProfessorTitles_Professors]
GO
ALTER TABLE [dbo].[ProfessorTitles]  WITH CHECK ADD  CONSTRAINT [FK_ProfessorTitles_Titles] FOREIGN KEY([TitleID])
REFERENCES [dbo].[Titles] ([TitleID])
GO
ALTER TABLE [dbo].[ProfessorTitles] CHECK CONSTRAINT [FK_ProfessorTitles_Titles]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Courses]
GO
ALTER TABLE [dbo].[StudentCourses]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_Students] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Students] ([StudentID])
GO
ALTER TABLE [dbo].[StudentCourses] CHECK CONSTRAINT [FK_StudentCourses_Students]
GO
USE [master]
GO
ALTER DATABASE [UniversityDatabase] SET  READ_WRITE 
GO
