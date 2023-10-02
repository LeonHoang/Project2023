USE [master]
GO
/****** Object:  Database [ecis_db_v2]    Script Date: 10/27/2021 10:45:13 PM ******/
CREATE DATABASE [ecis_db_v2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecis_db_v2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecis_db_v2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecis_db_v2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ecis_db_v2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ecis_db_v2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecis_db_v2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecis_db_v2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecis_db_v2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecis_db_v2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecis_db_v2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecis_db_v2] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecis_db_v2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecis_db_v2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecis_db_v2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecis_db_v2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecis_db_v2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecis_db_v2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecis_db_v2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecis_db_v2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecis_db_v2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecis_db_v2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ecis_db_v2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecis_db_v2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecis_db_v2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecis_db_v2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecis_db_v2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecis_db_v2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ecis_db_v2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecis_db_v2] SET RECOVERY FULL 
GO
ALTER DATABASE [ecis_db_v2] SET  MULTI_USER 
GO
ALTER DATABASE [ecis_db_v2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecis_db_v2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecis_db_v2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecis_db_v2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecis_db_v2] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecis_db_v2', N'ON'
GO
ALTER DATABASE [ecis_db_v2] SET QUERY_STORE = OFF
GO
USE [ecis_db_v2]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/27/2021 10:45:13 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[IsVerified] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[Gender] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyNameVI] [nvarchar](max) NULL,
	[CompanyNameEN] [nvarchar](max) NULL,
	[CompanyCode] [nvarchar](max) NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[CompanyTypeId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReport]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ActionTitle] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AcceptedAt] [datetime2](7) NOT NULL,
	[HandledAt] [datetime2](7) NOT NULL,
	[IsHandled] [bit] NOT NULL,
	[VerificationProcessId] [int] NULL,
	[CompanyReportTypeId] [int] NULL,
	[TargetedCompanyId] [int] NULL,
	[CreatorCompanyId] [int] NULL,
	[AssignedAgentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompanyReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReportDocument]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReportDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nvarchar](max) NULL,
	[DocumentUrl] [nvarchar](max) NULL,
	[CompanyReportId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[DocumentName] [nvarchar](max) NULL,
	[DocumentSize] [bigint] NOT NULL,
 CONSTRAINT [PK_CompanyReportDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReportTypes]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReportTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyReportTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyType]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyTypeModification]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTypeModification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NULL,
	[PreviousCompanyTypeId] [int] NULL,
	[UpdatedCompanyTypeId] [int] NULL,
	[VerificationProcessId] [int] NULL,
	[CompanyReportId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Modification] [nvarchar](max) NULL,
	[IsAnnounced] [bit] NOT NULL,
	[ViolationReportId] [int] NULL,
	[AnnouncedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_CompanyTypeModification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 10/27/2021 10:45:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Criteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CriteriaName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CriteriaTypeId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Criteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CriteriaDetail]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CriteriaDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CriteriaDetailName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CriteriaId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CriteriaDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CriteriaType]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CriteriaType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CriteriaTypeName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CriteriaType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentReview]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentReview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[IsAccepted] [bit] NOT NULL,
	[VerificationDocumentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_DocumentReview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[HasManagement] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationConfirmRequirement]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationConfirmRequirement](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ScheduledTime] [datetime2](7) NOT NULL,
	[ScheduledLocation] [nvarchar](max) NULL,
	[AnnouncedAgentAt] [datetime2](7) NULL,
	[AnnouncedCompanyAt] [datetime2](7) NULL,
	[ConfirmedAt] [datetime2](7) NULL,
	[AnnounceAgentDocumentContent] [nvarchar](max) NULL,
	[AnnounceAgentDocumentUrl] [nvarchar](max) NULL,
	[AnnounceAgentDocumentType] [nvarchar](max) NULL,
	[AnnounceAgentDocumentSize] [bigint] NOT NULL,
	[AnnounceAgentDocumentName] [nvarchar](max) NULL,
	[IsUsingAnnounceAgentFile] [bit] NOT NULL,
	[AnnounceCompanyDocumentContent] [nvarchar](max) NULL,
	[AnnounceCompanyDocumentUrl] [nvarchar](max) NULL,
	[AnnounceCompanyDocumentType] [nvarchar](max) NULL,
	[AnnounceCompanyDocumentSize] [bigint] NOT NULL,
	[AnnounceCompanyDocumentName] [nvarchar](max) NULL,
	[IsUsingAnnounceCompanyFile] [bit] NOT NULL,
	[ConfirmDocumentContent] [nvarchar](max) NULL,
	[ConfirmDocumentUrl] [nvarchar](max) NULL,
	[ConfirmDocumentType] [nvarchar](max) NULL,
	[ConfirmDocumentSize] [bigint] NOT NULL,
	[ConfirmDocumentName] [nvarchar](max) NULL,
	[IsUsingConfirmFile] [bit] NOT NULL,
	[VerificationProcessId] [int] NULL,
	[AssignedAgentId] [int] NULL,
	[ConfirmCompanyTypeId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VerificationConfirmRequirement] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationCriteria]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApprovedStatus] [nvarchar](max) NULL,
	[VerificationProcessId] [int] NULL,
	[CriteriaDetailId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[CompanyOpinion] [nvarchar](max) NULL,
	[CompanyRate] [bit] NOT NULL,
	[ReviewComment] [nvarchar](max) NULL,
	[ReviewResult] [nvarchar](max) NULL,
 CONSTRAINT [PK_VerificationCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationDocument]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[DocumentName] [nvarchar](max) NULL,
	[ResourceType] [nvarchar](max) NULL,
	[ResourceUrl] [nvarchar](max) NULL,
	[UploaderType] [nvarchar](max) NULL,
	[VerificationCriteriaId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[ResourceSize] [bigint] NOT NULL,
 CONSTRAINT [PK_VerificationDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationProcess]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationProcess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReviewedAt] [datetime2](7) NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL,
	[IsOpenedByAgent] [bit] NOT NULL,
	[SubmitMethod] [nvarchar](max) NULL,
	[CompanyTypeId] [int] NULL,
	[AssignedAgentId] [int] NULL,
	[CompanyId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[SubmitDeadline] [datetime2](7) NULL,
	[SubmittedAt] [datetime2](7) NULL,
	[IsReviewed] [bit] NOT NULL,
	[FinishedAt] [datetime2](7) NULL,
	[IsFinished] [bit] NOT NULL,
	[Status] [nvarchar](max) NULL,
 CONSTRAINT [PK_VerificationProcess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationReport]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationReport](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[ApprovedAt] [datetime2](7) NULL,
	[CompanyId] [int] NULL,
	[ReportAgentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ViolationReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationReportDocument]    Script Date: 10/27/2021 10:45:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViolationReportDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nvarchar](max) NULL,
	[DocumentUrl] [nvarchar](max) NULL,
	[DocumentName] [nvarchar](max) NULL,
	[DocumentSize] [bigint] NOT NULL,
	[ViolationReportId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ViolationReportDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714051334_updateDB', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210817091223_UpdateDB1708', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210823141514_processNewField', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210823153739_addVerificationCriteria', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210919075350_updateDocument', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210924152919_updateRole', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210926155558_addProcessField', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210930145623_addTableRequirement', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210930153317_updateTableRequiremen', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210930163638_updateDB_3009', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211003043401_updateDb_typemodification', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211008160641_addTableViolation', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211022181308_updateDbCompanyReport', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211026165313_initV2', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211026170239_addFK_CriteriaDetai', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211026170708_initV2_2', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20211027145528_updateDb_verificationCriteria', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'company1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 7, 0, CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'agent1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 6, 0, CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Agent', N'Lam', NULL, CAST(N'1999-11-07T00:00:00.0000000' AS DateTime2), NULL, NULL, 2, 0, CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Company 1', N'Company 1 EN', N'COMP1', NULL, 1, NULL, 0, CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2), CAST(N'2021-10-27T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Criteria] ON 

INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Hồ sơ khai thác gỗ đối với doanh nghiệp chế biến và xuất khẩu gỗ trực tiếp khai thác gỗ làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ khai thác gỗ đối với doanh nghiệp chế biến và xuất khẩu gỗ trực tiếp khai thác gỗ làm nguyên liệu chế biến', 4, 0, CAST(N'2021-10-27T00:11:32.7965262' AS DateTime2), CAST(N'2021-10-27T00:11:32.7965267' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Thuế, lao động', N'Tuân thủ quy định của pháp luật về thuế, lao động phải có một trong các loại tài liệu sau:', 3, 0, CAST(N'2021-10-27T00:11:32.7964764' AS DateTime2), CAST(N'2021-10-27T00:11:32.7964771' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Theo dõi nhập, xuất lâm sản', N'Tuân thủ quy định của pháp luật về theo dõi nhập, xuất lâm sản phải có một trong các loại tài liệu sau:', 3, 0, CAST(N'2021-10-27T00:11:32.7963422' AS DateTime2), CAST(N'2021-10-27T00:11:32.7963427' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Phòng cháy, chữa cháy', N'Tuân thủ quy định của pháp luật về phòng cháy, chữa cháy phải có một trong các loại tài liệu sau:', 3, 0, CAST(N'2021-10-27T00:11:32.7962794' AS DateTime2), CAST(N'2021-10-27T00:11:32.7962799' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Môi trường', N'Tuân thủ quy định của pháp luật về môi trường phải có một trong các loại tài liệu sau:', 3, 0, CAST(N'2021-10-27T00:11:32.7960994' AS DateTime2), CAST(N'2021-10-27T00:11:32.7961021' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Thành lập doanh nghiệp', N'Tuân thủ quy định của pháp luật về thành lập doanh nghiệp phải có các loại tài liệu sau:', 3, 0, CAST(N'2021-10-27T00:11:32.7602108' AS DateTime2), CAST(N'2021-10-27T00:11:32.7602150' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Hồ sơ sau xử lý tịch thu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ sau tịch thu làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ sau xử lý tịch thu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ sau tịch thu làm nguyên liệu chế biến', 4, 0, CAST(N'2021-10-27T00:11:32.7965740' AS DateTime2), CAST(N'2021-10-27T00:11:32.7965744' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'Hồ sơ gỗ nhập khẩu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ nhập khẩu làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ gỗ nhập khẩu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ nhập khẩu làm nguyên liệu chế biến', 4, 0, CAST(N'2021-10-27T00:11:32.7966157' AS DateTime2), CAST(N'2021-10-27T00:11:32.7966162' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'Hồ sơ trong quá trình mua bán, vận chuyển; chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ trong quá trình mua bán, vận chuyển; chế biến', 4, 0, CAST(N'2021-10-27T00:11:32.7966942' AS DateTime2), CAST(N'2021-10-27T00:11:32.7966946' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Criteria] OFF
GO
SET IDENTITY_INSERT [dbo].[CriteriaDetail] ON 

INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Không có tên trong danh sách công khai thông tin tổ chức, cá nhân kinh doanh có dấu hiệu vi phạm pháp luật về thuế', N'Không có tên trong danh sách công khai thông tin tổ chức, cá nhân kinh doanh có dấu hiệu vi phạm pháp luật về thuế', 3, 0, CAST(N'2021-10-27T00:11:32.8515984' AS DateTime2), CAST(N'2021-10-27T00:11:32.8515989' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Bản sao hồ sơ gỗ nhập khẩu', N'Bản sao hồ sơ gỗ nhập khẩu', 9, 0, CAST(N'2021-10-27T00:11:32.8520528' AS DateTime2), CAST(N'2021-10-27T00:11:32.8520532' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 9, 0, CAST(N'2021-10-27T00:11:32.8520116' AS DateTime2), CAST(N'2021-10-27T00:11:32.8520120' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Bản sao hồ sơ gỗ sau xử lý tịch thu', N'Bản sao hồ sơ gỗ sau xử lý tịch thu', 8, 0, CAST(N'2021-10-27T00:11:32.8519716' AS DateTime2), CAST(N'2021-10-27T00:11:32.8519719' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 8, 0, CAST(N'2021-10-27T00:11:32.8519312' AS DateTime2), CAST(N'2021-10-27T00:11:32.8519315' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Bản sao hồ sơ nguồn gốc gỗ khai thác', N'Bản sao hồ sơ nguồn gốc gỗ khai thác', 2, 0, CAST(N'2021-10-27T00:11:32.8518896' AS DateTime2), CAST(N'2021-10-27T00:11:32.8518900' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 2, 0, CAST(N'2021-10-27T00:11:32.8518439' AS DateTime2), CAST(N'2021-10-27T00:11:32.8518443' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'Chấp hành quy định về trình tự, thủ tục khai thác gỗ', N'Chấp hành quy định về trình tự, thủ tục khai thác gỗ', 2, 0, CAST(N'2021-10-27T00:11:32.8518006' AS DateTime2), CAST(N'2021-10-27T00:11:32.8518010' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'Người lao động là thành viên tổ chức Công đoàn của doanh nghiệp', N'Người lao động là thành viên tổ chức Công đoàn của doanh nghiệp', 3, 0, CAST(N'2021-10-27T00:11:32.8517584' AS DateTime2), CAST(N'2021-10-27T00:11:32.8517588' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (11, N'Niêm yết công khai thông tin về đóng bảo hiểm xã hội và y tế đối với người lao động theo quy định của Luật Bảo hiểm xã hội', N'Niêm yết công khai thông tin về đóng bảo hiểm xã hội và y tế đối với người lao động theo quy định của Luật Bảo hiểm xã hội', 3, 0, CAST(N'2021-10-27T00:11:32.8517180' AS DateTime2), CAST(N'2021-10-27T00:11:32.8517184' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (12, N'Người lao động có tên trong danh sách bảng lương của doanh nghiệp', N'Người lao động có tên trong danh sách bảng lương của doanh nghiệp', 3, 0, CAST(N'2021-10-27T00:11:32.8516780' AS DateTime2), CAST(N'2021-10-27T00:11:32.8516784' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (13, N'Có kế hoạch vệ sinh an toàn lao động theo quy định của pháp luật', N'Có kế hoạch vệ sinh an toàn lao động theo quy định của pháp luật', 3, 0, CAST(N'2021-10-27T00:11:32.8516383' AS DateTime2), CAST(N'2021-10-27T00:11:32.8516386' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (14, N'Giấy chứng nhận đăng ký doanh nghiệp (đối với doanh nghiệp không có vốn đầu tư nước ngoài)', N'Giấy chứng nhận đăng ký doanh nghiệp (đối với doanh nghiệp không có vốn đầu tư nước ngoài)', 7, 0, CAST(N'2021-10-27T00:11:32.8361557' AS DateTime2), CAST(N'2021-10-27T00:11:32.8361572' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (15, N'Giấy chứng nhận đăng ký đầu tư đối với doanh nghiệp có vốn đầu tư nước ngoài hoặc có yếu tố nước ngoài chiếm 51% vốn điều lệ hoặc doanh nghiệp hoạt động trong khu công nghiệp, khu chế xuất', N'Giấy chứng nhận đăng ký đầu tư đối với doanh nghiệp có vốn đầu tư nước ngoài hoặc có yếu tố nước ngoài chiếm 51% vốn điều lệ hoặc doanh nghiệp hoạt động trong khu công nghiệp, khu chế xuất', 7, 0, CAST(N'2021-10-27T00:11:32.8512642' AS DateTime2), CAST(N'2021-10-27T00:11:32.8512666' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (16, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở chế biến gỗ, dăm gỗ từ gỗ rừng tự nhiên có công suất từ 5.000 m3 sản phẩm/năm trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở chế biến gỗ, dăm gỗ từ gỗ rừng tự nhiên có công suất từ 5.000 m3 sản phẩm/năm trở lên', 6, 0, CAST(N'2021-10-27T00:11:32.8513412' AS DateTime2), CAST(N'2021-10-27T00:11:32.8513418' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (17, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất ván ép có công suất từ 100.000 m2 sản phẩm/năm trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất ván ép có công suất từ 100.000 m2 sản phẩm/năm trở lên', 6, 0, CAST(N'2021-10-27T00:11:32.8513890' AS DateTime2), CAST(N'2021-10-27T00:11:32.8513893' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (18, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất đồ gỗ có tổng diện tích kho bãi, nhà xưởng từ 10.000 m2 trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất đồ gỗ có tổng diện tích kho bãi, nhà xưởng từ 10.000 m2 trở lên', 6, 0, CAST(N'2021-10-27T00:11:32.8514323' AS DateTime2), CAST(N'2021-10-27T00:11:32.8514327' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (19, N'Có kế hoạch bảo vệ môi trường đối với các cơ sở sản xuất có công suất hay diện tích nhỏ hơn công suất hoặc diện tích của các cơ sở sản xuất quy định tại các điểm a, b, c nêu trên', N'Có kế hoạch bảo vệ môi trường đối với các cơ sở sản xuất có công suất hay diện tích nhỏ hơn công suất hoặc diện tích của các cơ sở sản xuất quy định tại các điểm a, b, c nêu trên', 6, 0, CAST(N'2021-10-27T00:11:32.8514734' AS DateTime2), CAST(N'2021-10-27T00:11:32.8514738' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (20, N'Phương án phòng cháy, chữa cháy theo quy định pháp luật', N'Phương án phòng cháy, chữa cháy theo quy định pháp luật', 5, 0, CAST(N'2021-10-27T00:11:32.8515167' AS DateTime2), CAST(N'2021-10-27T00:11:32.8515171' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (21, N'Sổ theo dõi nhập, xuất lâm sản được ghi chép đầy đủ theo đúng quy định pháp luật', N'Sổ theo dõi nhập, xuất lâm sản được ghi chép đầy đủ theo đúng quy định pháp luật', 4, 0, CAST(N'2021-10-27T00:11:32.8515568' AS DateTime2), CAST(N'2021-10-27T00:11:32.8515572' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (22, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 10, 0, CAST(N'2021-10-27T00:11:32.8520919' AS DateTime2), CAST(N'2021-10-27T00:11:32.8520923' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (23, N'Bản sao hồ sơ nguồn gốc gỗ', N'Bản sao hồ sơ nguồn gốc gỗ', 10, 0, CAST(N'2021-10-27T00:11:32.8521333' AS DateTime2), CAST(N'2021-10-27T00:11:32.8521336' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CriteriaDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CriteriaType] ON 

INSERT [dbo].[CriteriaType] ([Id], [CriteriaTypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Tuân thủ quy định của pháp luật trong việc thành lập và hoạt động của doanh nghiệp', N'Tuân thủ quy định của pháp luật trong việc thành lập và hoạt động của doanh nghiệp', 0, CAST(N'2021-10-27T00:11:32.4959028' AS DateTime2), CAST(N'2021-10-27T00:11:32.4959049' AS DateTime2))
INSERT [dbo].[CriteriaType] ([Id], [CriteriaTypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Tuân thủ quy định của pháp luật về nguồn gốc gỗ hợp pháp', N'Tuân thủ quy định của pháp luật về nguồn gốc gỗ hợp pháp', 0, CAST(N'2021-10-27T00:11:32.5240948' AS DateTime2), CAST(N'2021-10-27T00:11:32.5240992' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CriteriaType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt], [HasManagement]) VALUES (5, N'Admin', N'Admin Role', 0, CAST(N'2021-10-27T00:11:32.3666018' AS DateTime2), CAST(N'2021-10-27T00:11:32.3681019' AS DateTime2), 1)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt], [HasManagement]) VALUES (6, N'Agent', N'Agent Role', 0, CAST(N'2021-10-27T00:11:32.4940826' AS DateTime2), CAST(N'2021-10-27T00:11:32.4940869' AS DateTime2), 1)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt], [HasManagement]) VALUES (7, N'Company', N'Company Role', 0, CAST(N'2021-10-27T00:11:32.4951363' AS DateTime2), CAST(N'2021-10-27T00:11:32.4951379' AS DateTime2), 0)
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt], [HasManagement]) VALUES (8, N'ThirdParty', N'Third Party Role', 0, CAST(N'2021-10-27T00:11:32.4952972' AS DateTime2), CAST(N'2021-10-27T00:11:32.4952992' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationCriteria] ON 

INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (1, N'PENDING', 1, 2, 0, CAST(N'2021-10-27T13:41:13.8477668' AS DateTime2), CAST(N'2021-10-27T21:11:33.8488600' AS DateTime2), N'hihi', 1, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (2, N'PENDING', 1, 3, 0, CAST(N'2021-10-27T13:41:13.8967211' AS DateTime2), CAST(N'2021-10-27T13:41:13.8967231' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (3, N'PENDING', 1, 4, 0, CAST(N'2021-10-27T13:41:13.9002373' AS DateTime2), CAST(N'2021-10-27T13:41:13.9002386' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (4, N'PENDING', 1, 5, 0, CAST(N'2021-10-27T13:41:13.9037627' AS DateTime2), CAST(N'2021-10-27T13:41:13.9037681' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (5, N'PENDING', 1, 6, 0, CAST(N'2021-10-27T13:41:13.9097074' AS DateTime2), CAST(N'2021-10-27T13:41:13.9097100' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (6, N'PENDING', 1, 7, 0, CAST(N'2021-10-27T13:41:13.9137586' AS DateTime2), CAST(N'2021-10-27T13:41:13.9137600' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (7, N'PENDING', 1, 8, 0, CAST(N'2021-10-27T13:41:13.9172209' AS DateTime2), CAST(N'2021-10-27T13:41:13.9172223' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (8, N'PENDING', 1, 9, 0, CAST(N'2021-10-27T13:41:13.9229091' AS DateTime2), CAST(N'2021-10-27T13:41:13.9229117' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (9, N'PENDING', 1, 10, 0, CAST(N'2021-10-27T13:41:13.9295349' AS DateTime2), CAST(N'2021-10-27T13:41:13.9295367' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (10, N'PENDING', 1, 11, 0, CAST(N'2021-10-27T13:41:13.9341440' AS DateTime2), CAST(N'2021-10-27T13:41:13.9341453' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (11, N'PENDING', 1, 12, 0, CAST(N'2021-10-27T13:41:13.9395990' AS DateTime2), CAST(N'2021-10-27T13:41:13.9396020' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (12, N'PENDING', 1, 13, 0, CAST(N'2021-10-27T13:41:13.9439289' AS DateTime2), CAST(N'2021-10-27T13:41:13.9439374' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (13, N'PENDING', 1, 14, 0, CAST(N'2021-10-27T13:41:13.9478328' AS DateTime2), CAST(N'2021-10-27T13:41:13.9478345' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (14, N'PENDING', 1, 15, 0, CAST(N'2021-10-27T13:41:13.9522768' AS DateTime2), CAST(N'2021-10-27T13:41:13.9522801' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (15, N'PENDING', 1, 16, 0, CAST(N'2021-10-27T13:41:13.9594091' AS DateTime2), CAST(N'2021-10-27T13:41:13.9594110' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (16, N'PENDING', 1, 17, 0, CAST(N'2021-10-27T13:41:13.9631617' AS DateTime2), CAST(N'2021-10-27T13:41:13.9631634' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (17, N'PENDING', 1, 18, 0, CAST(N'2021-10-27T13:41:13.9672803' AS DateTime2), CAST(N'2021-10-27T13:41:13.9672823' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (18, N'PENDING', 1, 19, 0, CAST(N'2021-10-27T13:41:13.9769050' AS DateTime2), CAST(N'2021-10-27T13:41:13.9769079' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (19, N'PENDING', 1, 20, 0, CAST(N'2021-10-27T13:41:13.9822183' AS DateTime2), CAST(N'2021-10-27T13:41:13.9822249' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (20, N'PENDING', 1, 21, 0, CAST(N'2021-10-27T13:41:13.9934372' AS DateTime2), CAST(N'2021-10-27T13:41:13.9934400' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (21, N'PENDING', 1, 22, 0, CAST(N'2021-10-27T13:41:13.9995226' AS DateTime2), CAST(N'2021-10-27T13:41:13.9995243' AS DateTime2), NULL, 0, NULL, NULL)
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt], [CompanyOpinion], [CompanyRate], [ReviewComment], [ReviewResult]) VALUES (22, N'PENDING', 1, 23, 0, CAST(N'2021-10-27T13:41:14.0060132' AS DateTime2), CAST(N'2021-10-27T13:41:14.0060151' AS DateTime2), NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[VerificationCriteria] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationDocument] ON 

INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt], [ResourceSize]) VALUES (1, NULL, N'285eea7b-bc04-4509-9167-cc5ad5dcf686-9c898311-acf6-42c5-ae90-7dec9b0b58e0-DK-DATN-D17CN-AT.docx', N'docx', N'/File/285eea7b-bc04-4509-9167-cc5ad5dcf686-9c898311-acf6-42c5-ae90-7dec9b0b58e0-DK-DATN-D17CN-AT.docx', N'BY_COMPANY', 1, 0, CAST(N'2021-10-27T15:27:08.0374047' AS DateTime2), CAST(N'2021-10-27T15:27:08.0374097' AS DateTime2), 19505)
SET IDENTITY_INSERT [dbo].[VerificationDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationProcess] ON 

INSERT [dbo].[VerificationProcess] ([Id], [ReviewedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [SubmitMethod], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [IsSubmitted], [SubmitDeadline], [SubmittedAt], [IsReviewed], [FinishedAt], [IsFinished], [Status]) VALUES (1, NULL, NULL, NULL, 0, N'BY_CUSTOMER', NULL, NULL, 1, 0, CAST(N'2021-10-27T13:41:13.3260402' AS DateTime2), CAST(N'2021-10-27T15:52:52.2882467' AS DateTime2), 0, CAST(N'2021-11-06T13:41:13.3233857' AS DateTime2), NULL, 0, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[VerificationProcess] OFF
GO
/****** Object:  Index [IX_Account_RoleId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Account_RoleId] ON [dbo].[Account]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Agent_AccountId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Agent_AccountId] ON [dbo].[Agent]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Company_AccountId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company_AccountId] ON [dbo].[Company]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Company_CompanyTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Company_CompanyTypeId] ON [dbo].[Company]
(
	[CompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_AssignedAgentId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_AssignedAgentId] ON [dbo].[CompanyReport]
(
	[AssignedAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_CompanyReportTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_CompanyReportTypeId] ON [dbo].[CompanyReport]
(
	[CompanyReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_CreatorCompanyId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_CreatorCompanyId] ON [dbo].[CompanyReport]
(
	[CreatorCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_TargetedCompanyId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_TargetedCompanyId] ON [dbo].[CompanyReport]
(
	[TargetedCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_VerificationProcessId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_VerificationProcessId] ON [dbo].[CompanyReport]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReportDocument_CompanyReportId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReportDocument_CompanyReportId] ON [dbo].[CompanyReportDocument]
(
	[CompanyReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_CompanyId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_CompanyId] ON [dbo].[CompanyTypeModification]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_CompanyReportId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_CompanyReportId] ON [dbo].[CompanyTypeModification]
(
	[CompanyReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_PreviousCompanyTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_PreviousCompanyTypeId] ON [dbo].[CompanyTypeModification]
(
	[PreviousCompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_UpdatedCompanyTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_UpdatedCompanyTypeId] ON [dbo].[CompanyTypeModification]
(
	[UpdatedCompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_VerificationProcessId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_VerificationProcessId] ON [dbo].[CompanyTypeModification]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_ViolationReportId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_ViolationReportId] ON [dbo].[CompanyTypeModification]
(
	[ViolationReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Criteria_CriteriaTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_Criteria_CriteriaTypeId] ON [dbo].[Criteria]
(
	[CriteriaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CriteriaDetail_CriteriaId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_CriteriaDetail_CriteriaId] ON [dbo].[CriteriaDetail]
(
	[CriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DocumentReview_VerificationDocumentId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_DocumentReview_VerificationDocumentId] ON [dbo].[DocumentReview]
(
	[VerificationDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationConfirmRequirement_AssignedAgentId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationConfirmRequirement_AssignedAgentId] ON [dbo].[VerificationConfirmRequirement]
(
	[AssignedAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationConfirmRequirement_ConfirmCompanyTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationConfirmRequirement_ConfirmCompanyTypeId] ON [dbo].[VerificationConfirmRequirement]
(
	[ConfirmCompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationConfirmRequirement_VerificationProcessId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationConfirmRequirement_VerificationProcessId] ON [dbo].[VerificationConfirmRequirement]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationCriteria_CriteriaDetailId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationCriteria_CriteriaDetailId] ON [dbo].[VerificationCriteria]
(
	[CriteriaDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationCriteria_VerificationProcessId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationCriteria_VerificationProcessId] ON [dbo].[VerificationCriteria]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationDocument_VerificationCriteriaId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationDocument_VerificationCriteriaId] ON [dbo].[VerificationDocument]
(
	[VerificationCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_AssignedAgentId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_AssignedAgentId] ON [dbo].[VerificationProcess]
(
	[AssignedAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_CompanyId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_CompanyId] ON [dbo].[VerificationProcess]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_CompanyTypeId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_CompanyTypeId] ON [dbo].[VerificationProcess]
(
	[CompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReport_CompanyId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReport_CompanyId] ON [dbo].[ViolationReport]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReport_ReportAgentId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReport_ReportAgentId] ON [dbo].[ViolationReport]
(
	[ReportAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReportDocument_ViolationReportId]    Script Date: 10/27/2021 10:45:14 PM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReportDocument_ViolationReportId] ON [dbo].[ViolationReportDocument]
(
	[ViolationReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CompanyReportDocument] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [DocumentSize]
GO
ALTER TABLE [dbo].[CompanyTypeModification] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsAnnounced]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (CONVERT([bit],(0))) FOR [HasManagement]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [AnnounceAgentDocumentSize]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [AnnounceCompanyDocumentSize]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [ConfirmDocumentSize]
GO
ALTER TABLE [dbo].[VerificationCriteria] ADD  DEFAULT (CONVERT([bit],(0))) FOR [CompanyRate]
GO
ALTER TABLE [dbo].[VerificationDocument] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [ResourceSize]
GO
ALTER TABLE [dbo].[VerificationProcess] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[VerificationProcess] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsReviewed]
GO
ALTER TABLE [dbo].[VerificationProcess] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsFinished]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role_RoleId]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Account_AccountId]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Account_AccountId]
GO
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_CompanyType_CompanyTypeId] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_CompanyType_CompanyTypeId]
GO
ALTER TABLE [dbo].[CompanyReport]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReport_Agent_AssignedAgentId] FOREIGN KEY([AssignedAgentId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[CompanyReport] CHECK CONSTRAINT [FK_CompanyReport_Agent_AssignedAgentId]
GO
ALTER TABLE [dbo].[CompanyReport]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReport_Company_CreatorCompanyId] FOREIGN KEY([CreatorCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyReport] CHECK CONSTRAINT [FK_CompanyReport_Company_CreatorCompanyId]
GO
ALTER TABLE [dbo].[CompanyReport]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReport_Company_TargetedCompanyId] FOREIGN KEY([TargetedCompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyReport] CHECK CONSTRAINT [FK_CompanyReport_Company_TargetedCompanyId]
GO
ALTER TABLE [dbo].[CompanyReport]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReport_CompanyReportTypes_CompanyReportTypeId] FOREIGN KEY([CompanyReportTypeId])
REFERENCES [dbo].[CompanyReportTypes] ([Id])
GO
ALTER TABLE [dbo].[CompanyReport] CHECK CONSTRAINT [FK_CompanyReport_CompanyReportTypes_CompanyReportTypeId]
GO
ALTER TABLE [dbo].[CompanyReport]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReport_VerificationProcess_VerificationProcessId] FOREIGN KEY([VerificationProcessId])
REFERENCES [dbo].[VerificationProcess] ([Id])
GO
ALTER TABLE [dbo].[CompanyReport] CHECK CONSTRAINT [FK_CompanyReport_VerificationProcess_VerificationProcessId]
GO
ALTER TABLE [dbo].[CompanyReportDocument]  WITH CHECK ADD  CONSTRAINT [FK_CompanyReportDocument_CompanyReport_CompanyReportId] FOREIGN KEY([CompanyReportId])
REFERENCES [dbo].[CompanyReport] ([Id])
GO
ALTER TABLE [dbo].[CompanyReportDocument] CHECK CONSTRAINT [FK_CompanyReportDocument_CompanyReport_CompanyReportId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_Company_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_Company_CompanyId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_CompanyReport_CompanyReportId] FOREIGN KEY([CompanyReportId])
REFERENCES [dbo].[CompanyReport] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_CompanyReport_CompanyReportId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_CompanyType_PreviousCompanyTypeId] FOREIGN KEY([PreviousCompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_CompanyType_PreviousCompanyTypeId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_CompanyType_UpdatedCompanyTypeId] FOREIGN KEY([UpdatedCompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_CompanyType_UpdatedCompanyTypeId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_VerificationProcess_VerificationProcessId] FOREIGN KEY([VerificationProcessId])
REFERENCES [dbo].[VerificationProcess] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_VerificationProcess_VerificationProcessId]
GO
ALTER TABLE [dbo].[CompanyTypeModification]  WITH CHECK ADD  CONSTRAINT [FK_CompanyTypeModification_ViolationReport_ViolationReportId] FOREIGN KEY([ViolationReportId])
REFERENCES [dbo].[ViolationReport] ([Id])
GO
ALTER TABLE [dbo].[CompanyTypeModification] CHECK CONSTRAINT [FK_CompanyTypeModification_ViolationReport_ViolationReportId]
GO
ALTER TABLE [dbo].[Criteria]  WITH CHECK ADD  CONSTRAINT [FK_Criteria_CriteriaType_CriteriaTypeId] FOREIGN KEY([CriteriaTypeId])
REFERENCES [dbo].[CriteriaType] ([Id])
GO
ALTER TABLE [dbo].[Criteria] CHECK CONSTRAINT [FK_Criteria_CriteriaType_CriteriaTypeId]
GO
ALTER TABLE [dbo].[CriteriaDetail]  WITH CHECK ADD  CONSTRAINT [FK_CriteriaDetail_Criteria_CriteriaId] FOREIGN KEY([CriteriaId])
REFERENCES [dbo].[Criteria] ([Id])
GO
ALTER TABLE [dbo].[CriteriaDetail] CHECK CONSTRAINT [FK_CriteriaDetail_Criteria_CriteriaId]
GO
ALTER TABLE [dbo].[DocumentReview]  WITH CHECK ADD  CONSTRAINT [FK_DocumentReview_VerificationDocument_VerificationDocumentId] FOREIGN KEY([VerificationDocumentId])
REFERENCES [dbo].[VerificationDocument] ([Id])
GO
ALTER TABLE [dbo].[DocumentReview] CHECK CONSTRAINT [FK_DocumentReview_VerificationDocument_VerificationDocumentId]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement]  WITH CHECK ADD  CONSTRAINT [FK_VerificationConfirmRequirement_Agent_AssignedAgentId] FOREIGN KEY([AssignedAgentId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] CHECK CONSTRAINT [FK_VerificationConfirmRequirement_Agent_AssignedAgentId]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement]  WITH CHECK ADD  CONSTRAINT [FK_VerificationConfirmRequirement_CompanyType_ConfirmCompanyTypeId] FOREIGN KEY([ConfirmCompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] CHECK CONSTRAINT [FK_VerificationConfirmRequirement_CompanyType_ConfirmCompanyTypeId]
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement]  WITH CHECK ADD  CONSTRAINT [FK_VerificationConfirmRequirement_VerificationProcess_VerificationProcessId] FOREIGN KEY([VerificationProcessId])
REFERENCES [dbo].[VerificationProcess] ([Id])
GO
ALTER TABLE [dbo].[VerificationConfirmRequirement] CHECK CONSTRAINT [FK_VerificationConfirmRequirement_VerificationProcess_VerificationProcessId]
GO
ALTER TABLE [dbo].[VerificationCriteria]  WITH CHECK ADD  CONSTRAINT [FK_VerificationCriteria_CriteriaDetail_CriteriaDetailId] FOREIGN KEY([CriteriaDetailId])
REFERENCES [dbo].[CriteriaDetail] ([Id])
GO
ALTER TABLE [dbo].[VerificationCriteria] CHECK CONSTRAINT [FK_VerificationCriteria_CriteriaDetail_CriteriaDetailId]
GO
ALTER TABLE [dbo].[VerificationCriteria]  WITH CHECK ADD  CONSTRAINT [FK_VerificationCriteria_VerificationProcess_VerificationProcessId] FOREIGN KEY([VerificationProcessId])
REFERENCES [dbo].[VerificationProcess] ([Id])
GO
ALTER TABLE [dbo].[VerificationCriteria] CHECK CONSTRAINT [FK_VerificationCriteria_VerificationProcess_VerificationProcessId]
GO
ALTER TABLE [dbo].[VerificationDocument]  WITH CHECK ADD  CONSTRAINT [FK_VerificationDocument_VerificationCriteria_VerificationCriteriaId] FOREIGN KEY([VerificationCriteriaId])
REFERENCES [dbo].[VerificationCriteria] ([Id])
GO
ALTER TABLE [dbo].[VerificationDocument] CHECK CONSTRAINT [FK_VerificationDocument_VerificationCriteria_VerificationCriteriaId]
GO
ALTER TABLE [dbo].[VerificationProcess]  WITH CHECK ADD  CONSTRAINT [FK_VerificationProcess_Agent_AssignedAgentId] FOREIGN KEY([AssignedAgentId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[VerificationProcess] CHECK CONSTRAINT [FK_VerificationProcess_Agent_AssignedAgentId]
GO
ALTER TABLE [dbo].[VerificationProcess]  WITH CHECK ADD  CONSTRAINT [FK_VerificationProcess_Company_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[VerificationProcess] CHECK CONSTRAINT [FK_VerificationProcess_Company_CompanyId]
GO
ALTER TABLE [dbo].[VerificationProcess]  WITH CHECK ADD  CONSTRAINT [FK_VerificationProcess_CompanyType_CompanyTypeId] FOREIGN KEY([CompanyTypeId])
REFERENCES [dbo].[CompanyType] ([Id])
GO
ALTER TABLE [dbo].[VerificationProcess] CHECK CONSTRAINT [FK_VerificationProcess_CompanyType_CompanyTypeId]
GO
ALTER TABLE [dbo].[ViolationReport]  WITH CHECK ADD  CONSTRAINT [FK_ViolationReport_Agent_ReportAgentId] FOREIGN KEY([ReportAgentId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[ViolationReport] CHECK CONSTRAINT [FK_ViolationReport_Agent_ReportAgentId]
GO
ALTER TABLE [dbo].[ViolationReport]  WITH CHECK ADD  CONSTRAINT [FK_ViolationReport_Company_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[ViolationReport] CHECK CONSTRAINT [FK_ViolationReport_Company_CompanyId]
GO
ALTER TABLE [dbo].[ViolationReportDocument]  WITH CHECK ADD  CONSTRAINT [FK_ViolationReportDocument_ViolationReport_ViolationReportId] FOREIGN KEY([ViolationReportId])
REFERENCES [dbo].[ViolationReport] ([Id])
GO
ALTER TABLE [dbo].[ViolationReportDocument] CHECK CONSTRAINT [FK_ViolationReportDocument_ViolationReport_ViolationReportId]
GO
USE [master]
GO
ALTER DATABASE [ecis_db_v2] SET  READ_WRITE 
GO
