USE [master]
GO
/****** Object:  Database [employee_jobs_portal]    Script Date: 10/21/2015 9:34:30 PM ******/
CREATE DATABASE [employee_jobs_portal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'employee_jobs_portal', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\employee_jobs_portal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'employee_jobs_portal_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\employee_jobs_portal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [employee_jobs_portal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [employee_jobs_portal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [employee_jobs_portal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET ARITHABORT OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [employee_jobs_portal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [employee_jobs_portal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [employee_jobs_portal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [employee_jobs_portal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [employee_jobs_portal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET RECOVERY FULL 
GO
ALTER DATABASE [employee_jobs_portal] SET  MULTI_USER 
GO
ALTER DATABASE [employee_jobs_portal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [employee_jobs_portal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [employee_jobs_portal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [employee_jobs_portal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'employee_jobs_portal', N'ON'
GO
USE [employee_jobs_portal]
GO
/****** Object:  User [Administrator]    Script Date: 10/21/2015 9:34:31 PM ******/
CREATE USER [Administrator] FOR LOGIN [Administrator] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[department]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[department](
	[dept_name] [varchar](50) NULL,
	[dept_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_department] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[emp_project_map]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[emp_project_map](
	[emp_id] [varchar](50) NOT NULL,
	[project_id] [varchar](50) NOT NULL,
	[dept_id] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[employee]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[employee](
	[emp_id] [varchar](50) NOT NULL,
	[emp_firstname] [varchar](50) NULL,
	[emp_middlename] [varchar](50) NULL,
	[emp_lastname] [varchar](50) NULL,
	[emp_emailid] [varchar](50) NULL,
	[emp_phonenumber] [varchar](15) NULL,
	[emp_desg] [varchar](50) NULL,
	[emp_experience] [int] NULL,
	[dept_id] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_employee] PRIMARY KEY CLUSTERED 
(
	[emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project](
	[project_name] [varchar](50) NULL,
	[project_id] [varchar](50) NOT NULL,
 CONSTRAINT [PK_project] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[project_dept_map]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[project_dept_map](
	[project_id] [varchar](50) NOT NULL,
	[dept_id] [varchar](50) NOT NULL,
	[hours_allocated] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[timesheet]    Script Date: 10/21/2015 9:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[timesheet](
	[emp_id] [varchar](50) NOT NULL,
	[project_id] [varchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[work_hours] [float] NULL,
	[approved] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'dev', N'1')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Music', N'10')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Literature', N'11')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Automation Testing', N'1246')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Chemical', N'1247')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'CSE', N'2')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Chemistry', N'2424')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Public Administration', N'3')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'DBA', N'4')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Arts', N'6')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'SAP', N'6670')
INSERT [dbo].[department] ([dept_name], [dept_id]) VALUES (N'Biology', N'8')
INSERT [dbo].[emp_project_map] ([emp_id], [project_id], [dept_id]) VALUES (N'jkeerthpati', N'1235', N'2424')
INSERT [dbo].[emp_project_map] ([emp_id], [project_id], [dept_id]) VALUES (N'dmudunuri', N'423423', N'2')
INSERT [dbo].[emp_project_map] ([emp_id], [project_id], [dept_id]) VALUES (N'njyothi', N'9990', N'1246')
INSERT [dbo].[emp_project_map] ([emp_id], [project_id], [dept_id]) VALUES (N'mbandaru', N'9990', N'1246')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'ctenneti', N'chandra', N'sekhar', N'tenneti', N'ctenneti@govst.edu', N'989349349349', N'Sr.Java Developer', 4, N'2', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'divakar', N'divakar', N'sri', N'mudunuri', N'sri_divakar@gmail.com', N'452523523523', N'Developer', 8, N'10', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'dmudunuri', N'Divakar', N'Kumar', N'Mudunuri', N'divakar@gmail.com', N'342341421421', N'Sr.Java Developer', 8, N'2', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'dsandadi', N'deepika', N'reddy', N'sandadi', N'deepika@gmail.edu', N'123456789', N'Manager', 7, N'3', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'jkeerthpati', N'Jahnavi', N'Keerthi', N'Pati', N'jkeerthipati', N'98930430943', N'Jr.Java Programmer', 2, N'2', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'kmurthy', N'krishna', N'moorthy', N'tenneti', N'tkmurthy@gmail.com', N'123456789', N'professor', 9, N'10', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'kuday', N'uday', N'kumar', N'k', N'uday@gmail.com', N'745074590598', N'DBA', 6, N'4', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'mbandaru', N'mounica', N'rani', N'bandaru', N'mounica@gmail.com', N'423534341123', N'Office Assistant', 5, N'3', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'mmudunuri', N'venkata ', N'satyanarayana', N'murthy', N'murthy@gmail.com', N'343454544590', N'Manager', 37, N'3', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'njyothi', N'jyothi', N'bhai', N'nerella', N'jyothi@gmail.com', N'707409740924', N'Tester', 9, N'6', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'nrios', N'nancy', N'mercy', N'rios', N'nrios@govst.edu', N'7085344500', N'Office Assistant', 11, N'10', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'rmudunuri', N'ratna', N'kumari', N'mudunuri', N'ratna@gmail.com', N'7590459025', N'Teacher', 17, N'10', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'skundarapu', N'sindhu', N'k', N'kundarapu', N'skundarapu@gmail.com', N'707409740924', N'Production Manger', 9, N'4', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'smandadi', N'sindhura', N'reddy', N'mandadi', N'sindhu@gmail.edu', N'678575467467', N'Developer', 2, N'2', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'smudunuri', N'Sri Vidya', N'Rani', N'Mudunuri', N'vidya@gmail.com', N'434342344234', N'java programmer', 3, N'1', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'spasam', N'Sandhya', N'Vani', N'Pasam', N'spasam', N'43434342344', N'DBA', 2, N'4', N'abc123')
INSERT [dbo].[employee] ([emp_id], [emp_firstname], [emp_middlename], [emp_lastname], [emp_emailid], [emp_phonenumber], [emp_desg], [emp_experience], [dept_id], [password]) VALUES (N'tvodapally', N'tejaswini', N'veena', N'vodapally', N'teju@govst.edu', N'5444453449', N'Artist', 9, N'10', N'abc123')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'Jobs Portal', N'1234')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'Walmart', N'1235')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'NASA', N'3423')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'Devlopment project', N'423423')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'Online Advertiment', N'44')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'CISCO', N'5454')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'Thesis', N'8900')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'USCIS', N'9990')
INSERT [dbo].[project] ([project_name], [project_id]) VALUES (N'hot market sales', N'9991')
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'1234', N'1', 70)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'1235', N'10', 50)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'5454', N'1', 60)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'5454', N'1', 80)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'3423', N'2424', 90)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'423423', N'1', 40)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'8900', N'11', 80)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'44', N'4', 60)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'9990', N'2', 77)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'5454', N'1', 90)
INSERT [dbo].[project_dept_map] ([project_id], [dept_id], [hours_allocated]) VALUES (N'3423', N'4', 60)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'divakar', N'1234', CAST(0x000007C600000000 AS DateTime), 22, 1)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'dmudunuri', N'1235', CAST(0x000007C600000000 AS DateTime), 22.5, 0)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'nrios', N'3423', CAST(0x000007CF00000000 AS DateTime), 12.3, 1)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'mbandaru', N'3423', CAST(0x000007C900000000 AS DateTime), 6, 0)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'ctenneti', N'1235', CAST(0x000007BA00000000 AS DateTime), 7, 0)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'njyothi', N'9990', CAST(0x000007C400000000 AS DateTime), 7, 0)
INSERT [dbo].[timesheet] ([emp_id], [project_id], [date], [work_hours], [approved]) VALUES (N'smandadi', N'3423', CAST(0x000007BB00000000 AS DateTime), 5, 1)
ALTER TABLE [dbo].[emp_project_map]  WITH CHECK ADD  CONSTRAINT [FK_emp_project_map_department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([dept_id])
GO
ALTER TABLE [dbo].[emp_project_map] CHECK CONSTRAINT [FK_emp_project_map_department]
GO
ALTER TABLE [dbo].[emp_project_map]  WITH CHECK ADD  CONSTRAINT [FK_emp_project_map_employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[employee] ([emp_id])
GO
ALTER TABLE [dbo].[emp_project_map] CHECK CONSTRAINT [FK_emp_project_map_employee]
GO
ALTER TABLE [dbo].[emp_project_map]  WITH CHECK ADD  CONSTRAINT [FK_emp_project_map_project] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
GO
ALTER TABLE [dbo].[emp_project_map] CHECK CONSTRAINT [FK_emp_project_map_project]
GO
ALTER TABLE [dbo].[employee]  WITH CHECK ADD  CONSTRAINT [FK_employee_department] FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([dept_id])
GO
ALTER TABLE [dbo].[employee] CHECK CONSTRAINT [FK_employee_department]
GO
ALTER TABLE [dbo].[project_dept_map]  WITH CHECK ADD  CONSTRAINT [FK_dept-id] FOREIGN KEY([dept_id])
REFERENCES [dbo].[department] ([dept_id])
GO
ALTER TABLE [dbo].[project_dept_map] CHECK CONSTRAINT [FK_dept-id]
GO
ALTER TABLE [dbo].[project_dept_map]  WITH CHECK ADD  CONSTRAINT [FK_project-id] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
GO
ALTER TABLE [dbo].[project_dept_map] CHECK CONSTRAINT [FK_project-id]
GO
ALTER TABLE [dbo].[timesheet]  WITH CHECK ADD  CONSTRAINT [FK_timesheet_employee] FOREIGN KEY([emp_id])
REFERENCES [dbo].[employee] ([emp_id])
GO
ALTER TABLE [dbo].[timesheet] CHECK CONSTRAINT [FK_timesheet_employee]
GO
ALTER TABLE [dbo].[timesheet]  WITH CHECK ADD  CONSTRAINT [FK_timesheet_project1] FOREIGN KEY([project_id])
REFERENCES [dbo].[project] ([project_id])
GO
ALTER TABLE [dbo].[timesheet] CHECK CONSTRAINT [FK_timesheet_project1]
GO
USE [master]
GO
ALTER DATABASE [employee_jobs_portal] SET  READ_WRITE 
GO
