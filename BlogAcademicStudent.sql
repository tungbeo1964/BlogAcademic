USE [master]
GO
/****** Object:  Database [SWP_Group6_Blog_Student]    Script Date: 01-Nov-21 09:09:49 PM ******/
CREATE DATABASE [SWP_Group6_Blog_Student]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP_Group6_Blog_Student', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP_Group6_Blog_Student.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP_Group6_Blog_Student_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SWP_Group6_Blog_Student_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_Group6_Blog_Student].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP_Group6_Blog_Student', N'ON'
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET QUERY_STORE = OFF
GO
USE [SWP_Group6_Blog_Student]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[username] [varchar](25) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[full_name] [varchar](255) NOT NULL,
	[role] [int] NOT NULL,
	[del_flag] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[admin_email] [varchar](50) NOT NULL,
	[admin_phone] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Award]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Award](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[detail] [nvarchar](250) NOT NULL,
	[content_id] [int] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[title] [nvarchar](150) NOT NULL,
	[blog_content] [nvarchar](2000) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [int] NOT NULL,
	[approved_on] [datetime] NULL,
	[approved_by] [int] NULL,
	[status] [int] NOT NULL,
	[vote] [int] NOT NULL,
	[subject_id] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[detail] [nvarchar](250) NOT NULL,
	[vote] [int] NULL,
	[content_id] [int] NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[image_url] [varchar](500) NOT NULL,
	[content_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mentor]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mentor](
	[id] [int] NOT NULL,
	[mentor_email] [varchar](50) NOT NULL,
	[mentor_phone] [varchar](10) NOT NULL,
	[created_on] [datetime] NOT NULL,
	[created_by] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id] [int] NOT NULL,
	[student_email] [varchar](50) NOT NULL,
	[student_phone] [varchar](10) NOT NULL,
	[created_on] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subject_id] [varchar](6) NOT NULL,
	[subject_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[tag_id] [varchar](15) NOT NULL,
	[tag_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tag_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagEntry]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagEntry](
	[content_id] [int] NOT NULL,
	[tag_id] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Video]    Script Date: 01-Nov-21 09:09:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Video](
	[id] [int] IDENTITY(0,1) NOT NULL,
	[video_url] [varchar](500) NOT NULL,
	[content_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [username], [password], [full_name], [role], [del_flag]) VALUES (0, N'admin', N'123', N'admin', 1, 0)
INSERT [dbo].[Account] ([id], [username], [password], [full_name], [role], [del_flag]) VALUES (1, N'mentor', N'123', N'tuan2', 2, 0)
INSERT [dbo].[Account] ([id], [username], [password], [full_name], [role], [del_flag]) VALUES (2, N'student', N'123', N'tung2', 3, 0)
INSERT [dbo].[Account] ([id], [username], [password], [full_name], [role], [del_flag]) VALUES (3, N'mentor1', N'123', N'lam nguyen', 2, 1)
INSERT [dbo].[Account] ([id], [username], [password], [full_name], [role], [del_flag]) VALUES (4, N'tung', N'123', N'123123', 3, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Award] ON 

INSERT [dbo].[Award] ([id], [detail], [content_id], [created_on], [created_by]) VALUES (0, N'bai viet hay nhat', 1, CAST(N'2021-10-28T07:17:28.000' AS DateTime), N'mentor')
SET IDENTITY_INSERT [dbo].[Award] OFF
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([id], [title], [blog_content], [created_on], [created_by], [approved_on], [approved_by], [status], [vote], [subject_id]) VALUES (0, N'java22', N'sdfadssfasdfsad2', CAST(N'2021-10-29T18:54:39.000' AS DateTime), 2, CAST(N'2021-10-28T06:28:43.000' AS DateTime), 1, 1, 0, N'LAB201')
INSERT [dbo].[Blog] ([id], [title], [blog_content], [created_on], [created_by], [approved_on], [approved_by], [status], [vote], [subject_id]) VALUES (1, N'python22', N'wqer22', CAST(N'2021-10-26T20:41:09.000' AS DateTime), 4, CAST(N'2021-10-28T06:28:47.000' AS DateTime), 1, 2, 42, N'LAB201')
INSERT [dbo].[Blog] ([id], [title], [blog_content], [created_on], [created_by], [approved_on], [approved_by], [status], [vote], [subject_id]) VALUES (2, N'test 33', N'tung tung', CAST(N'2021-11-01T20:40:06.000' AS DateTime), 4, CAST(N'2021-11-01T20:22:10.000' AS DateTime), 1, 1, 0, N'LAB201')
INSERT [dbo].[Blog] ([id], [title], [blog_content], [created_on], [created_by], [approved_on], [approved_by], [status], [vote], [subject_id]) VALUES (3, N'test33', N'1233333', CAST(N'2021-10-26T20:54:26.000' AS DateTime), 1, CAST(N'2021-11-01T20:47:56.000' AS DateTime), 1, 2, 0, N'SWP391')
INSERT [dbo].[Blog] ([id], [title], [blog_content], [created_on], [created_by], [approved_on], [approved_by], [status], [vote], [subject_id]) VALUES (1001, N'test 6', N'1fasdfasdf', CAST(N'2021-11-01T20:32:08.000' AS DateTime), 1, NULL, -1, 1, 0, N'SWP391')
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (0, N'tet', 4, 0, CAST(N'2021-10-26T20:07:32.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1, N'444', 4, 0, CAST(N'2021-10-28T06:29:16.000' AS DateTime), N'mentor')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (2, N'5555', 5, 1, CAST(N'2021-10-28T06:29:40.000' AS DateTime), N'mentor')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (3, N'3', 4, 1, CAST(N'2021-10-31T18:10:49.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (4, N'1', 1, 1, CAST(N'2021-10-31T18:10:59.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (5, N'vote 5', 5, 1, CAST(N'2021-10-31T18:11:15.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (6, N'vote 2', 2, 1, CAST(N'2021-10-31T18:11:23.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (7, N'vote 3', 3, 1, CAST(N'2021-10-31T18:11:50.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (8, N'vote 4', 4, 1, CAST(N'2021-10-31T18:18:02.000' AS DateTime), N'mentor')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (9, N'vote 5', 5, 1, CAST(N'2021-10-31T18:18:29.000' AS DateTime), N'mentor')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1001, N'123', 2, 1, CAST(N'2021-11-01T20:26:49.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1002, N'5555', 1, 1, CAST(N'2021-11-01T20:27:02.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1003, N'5555', 5, 1, CAST(N'2021-11-01T20:27:44.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1004, N'1111', 1, 1, CAST(N'2021-11-01T20:27:51.000' AS DateTime), N'student')
INSERT [dbo].[Comment] ([id], [detail], [vote], [content_id], [created_on], [created_by]) VALUES (1005, N'444', 4, 1, CAST(N'2021-11-01T20:31:41.000' AS DateTime), N'mentor')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Image] ON 

INSERT [dbo].[Image] ([id], [image_url], [content_id]) VALUES (1001, N'img120211101203206.jpg', 1001)
SET IDENTITY_INSERT [dbo].[Image] OFF
GO
INSERT [dbo].[Mentor] ([id], [mentor_email], [mentor_phone], [created_on], [created_by]) VALUES (1, N'tuan@fpt.vn', N'1231231231', CAST(N'2021-10-26T19:56:37.000' AS DateTime), N'admin')
INSERT [dbo].[Mentor] ([id], [mentor_email], [mentor_phone], [created_on], [created_by]) VALUES (3, N'manhtung2561995@gmail.com', N'1234773619', CAST(N'2021-10-26T20:16:15.000' AS DateTime), N'admin')
GO
INSERT [dbo].[Student] ([id], [student_email], [student_phone], [created_on]) VALUES (2, N'manhtung2561995@gmail.com', N'1234773619', CAST(N'2021-10-26T20:01:30.000' AS DateTime))
INSERT [dbo].[Student] ([id], [student_email], [student_phone], [created_on]) VALUES (4, N'1232@gmail.com', N'1234773619', CAST(N'2021-10-26T20:38:02.000' AS DateTime))
GO
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (N'LAB201', N'lab java')
INSERT [dbo].[Subject] ([subject_id], [subject_name]) VALUES (N'SWP391', N'software project')
GO
INSERT [dbo].[Tag] ([tag_id], [tag_name]) VALUES (N'HT', N'hoc tap')
INSERT [dbo].[Tag] ([tag_id], [tag_name]) VALUES (N'KT', N'kien thuc')
GO
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (0, N'HT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (1, N'HT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (1001, N'HT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (2, N'HT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (2, N'KT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (1, N'KT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (3, N'HT')
INSERT [dbo].[TagEntry] ([content_id], [tag_id]) VALUES (3, N'KT')
GO
SET IDENTITY_INSERT [dbo].[Video] ON 

INSERT [dbo].[Video] ([id], [video_url], [content_id]) VALUES (1001, N'img120211101203207.mp4', 1001)
SET IDENTITY_INSERT [dbo].[Video] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__F3DBC5729B6D1C23]    Script Date: 01-Nov-21 09:09:50 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_Account]
GO
ALTER TABLE [dbo].[Award]  WITH CHECK ADD  CONSTRAINT [FK_Award_Blog] FOREIGN KEY([content_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[Award] CHECK CONSTRAINT [FK_Award_Blog]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Account] FOREIGN KEY([created_by])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Account]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Subject]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Blog] FOREIGN KEY([content_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Blog]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Blog] FOREIGN KEY([content_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Blog]
GO
ALTER TABLE [dbo].[Mentor]  WITH CHECK ADD  CONSTRAINT [FK_Mentor_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Mentor] CHECK CONSTRAINT [FK_Mentor_Account]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
ALTER TABLE [dbo].[TagEntry]  WITH CHECK ADD  CONSTRAINT [FK_TagEntry_Blog] FOREIGN KEY([content_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[TagEntry] CHECK CONSTRAINT [FK_TagEntry_Blog]
GO
ALTER TABLE [dbo].[TagEntry]  WITH CHECK ADD  CONSTRAINT [FK_TagEntry_Tag] FOREIGN KEY([tag_id])
REFERENCES [dbo].[Tag] ([tag_id])
GO
ALTER TABLE [dbo].[TagEntry] CHECK CONSTRAINT [FK_TagEntry_Tag]
GO
ALTER TABLE [dbo].[Video]  WITH CHECK ADD  CONSTRAINT [FK_Video_Blog] FOREIGN KEY([content_id])
REFERENCES [dbo].[Blog] ([id])
GO
ALTER TABLE [dbo].[Video] CHECK CONSTRAINT [FK_Video_Blog]
GO
USE [master]
GO
ALTER DATABASE [SWP_Group6_Blog_Student] SET  READ_WRITE 
GO
