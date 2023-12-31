USE [master]
GO
/****** Object:  Database [ecis_db]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE DATABASE [ecis_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ecis_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecis_db.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ecis_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ecis_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ecis_db] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ecis_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ecis_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ecis_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ecis_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ecis_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ecis_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [ecis_db] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ecis_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ecis_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ecis_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ecis_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ecis_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ecis_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ecis_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ecis_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ecis_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ecis_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ecis_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ecis_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ecis_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ecis_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ecis_db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [ecis_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ecis_db] SET RECOVERY FULL 
GO
ALTER DATABASE [ecis_db] SET  MULTI_USER 
GO
ALTER DATABASE [ecis_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ecis_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ecis_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ecis_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ecis_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ecis_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ecis_db', N'ON'
GO
ALTER DATABASE [ecis_db] SET QUERY_STORE = ON
GO
ALTER DATABASE [ecis_db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ecis_db]
GO
/****** Object:  Schema [HangFire]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](450) NULL,
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
/****** Object:  Table [dbo].[Agent]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[AgentAssignment]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentAssignment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AgentId] [int] NOT NULL,
	[ProvinceId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_AgentAssignment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyNameVI] [nvarchar](max) NULL,
	[CompanyNameEN] [nvarchar](max) NULL,
	[CompanyCode] [nvarchar](450) NULL,
	[LogoUrl] [nvarchar](max) NULL,
	[AccountId] [int] NOT NULL,
	[CompanyTypeId] [int] NULL,
	[ProvinceId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReport]    Script Date: 12/11/2023 7:06:03 AM ******/
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
	[Status] [nvarchar](450) NULL,
	[VerificationProcessId] [int] NULL,
	[CompanyReportTypeId] [int] NULL,
	[TargetedCompanyId] [int] NULL,
	[CreatorCompanyId] [int] NULL,
	[AssignedAgentId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyReport] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReportDocument]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyReportDocument](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DocumentType] [nvarchar](max) NULL,
	[DocumentUrl] [nvarchar](max) NULL,
	[DocumentName] [nvarchar](max) NULL,
	[DocumentSize] [bigint] NOT NULL,
	[CompanyReportId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyReportDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyReportTypes]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[CompanyType]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[CompanyTypeModification]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTypeModification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Modification] [nvarchar](max) NULL,
	[IsAnnounced] [bit] NOT NULL,
	[AnnouncedAt] [datetime2](7) NULL,
	[CompanyId] [int] NULL,
	[PreviousCompanyTypeId] [int] NULL,
	[UpdatedCompanyTypeId] [int] NULL,
	[VerificationProcessId] [int] NULL,
	[ViolationReportId] [int] NULL,
	[CompanyReportId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CompanyTypeModification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Criteria]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[CriteriaDetail]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CriteriaDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CriteriaDetailName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[IsRequired] [bit] NULL,
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
/****** Object:  Table [dbo].[CriteriaType]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[DocumentReview]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProvinceCode] [nvarchar](max) NULL,
	[ProvinceName] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Province] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[HasManagement] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemConfiguration]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ConfigurationKey] [nvarchar](max) NULL,
	[ConfigurationValue] [nvarchar](max) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SystemConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThirdParty]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThirdParty](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[ClientId] [nvarchar](max) NULL,
	[ClientSecret] [nvarchar](max) NULL,
	[IsActive] [bit] NOT NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ThirdParty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationCriteria]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationCriteria](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApprovedStatus] [nvarchar](max) NULL,
	[CompanyRate] [bit] NULL,
	[CompanyOpinion] [nvarchar](max) NULL,
	[ReviewResult] [nvarchar](max) NULL,
	[ReviewComment] [nvarchar](max) NULL,
	[VerificationProcessId] [int] NULL,
	[CriteriaDetailId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VerificationCriteria] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationDocument]    Script Date: 12/11/2023 7:06:03 AM ******/
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
	[ResourceSize] [bigint] NOT NULL,
	[UploaderType] [nvarchar](max) NULL,
	[VerificationCriteriaId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_VerificationDocument] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VerificationProcess]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VerificationProcess](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubmitDeadline] [datetime2](7) NULL,
	[SubmittedAt] [datetime2](7) NULL,
	[ReviewedAt] [datetime2](7) NULL,
	[FinishedAt] [datetime2](7) NULL,
	[ValidFrom] [datetime2](7) NULL,
	[ValidTo] [datetime2](7) NULL,
	[IsOpenedByAgent] [bit] NOT NULL,
	[IsSubmitted] [bit] NOT NULL,
	[IsReviewed] [bit] NOT NULL,
	[IsFinished] [bit] NOT NULL,
	[SubmitMethod] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[CompanyTypeId] [int] NULL,
	[AssignedAgentId] [int] NULL,
	[CompanyId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[SubmittedCount] [int] NOT NULL,
	[AssignedAgentReviewId] [int] NULL,
 CONSTRAINT [PK_VerificationProcess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationReport]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [dbo].[ViolationReportDocument]    Script Date: 12/11/2023 7:06:03 AM ******/
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
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 12/11/2023 7:06:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009160216_Refesh', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009160449_Init', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231017043638_newdb', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231112150252_Remove_Confirm_Service', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231209124551_Add_Assign_Agent', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231210171529_Assgin_Review_ref', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'admin@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 1, 0, CAST(N'2023-10-09T23:05:53.8879097' AS DateTime2), CAST(N'2023-10-09T23:05:53.8879104' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'achau@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-10-23T22:51:49.4654422' AS DateTime2), CAST(N'2023-10-23T22:51:49.4654452' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'ecis.kiemlam.1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-10-31T22:57:39.3376804' AS DateTime2), CAST(N'2023-10-31T22:57:39.3376824' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'rung1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-11-20T22:56:24.4566799' AS DateTime2), CAST(N'2023-11-20T22:56:24.4567344' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'rung2@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-11-21T11:10:56.8126742' AS DateTime2), CAST(N'2023-12-06T11:13:03.6444509' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'ecis.kiemlam.2@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-11-21T13:15:07.3440474' AS DateTime2), CAST(N'2023-11-21T13:15:07.3440486' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (12, N'agent1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-12-06T10:16:24.0108019' AS DateTime2), CAST(N'2023-12-10T01:09:52.1708705' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (13, N'ben.thu.huong1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 4, 0, CAST(N'2023-12-06T11:46:05.0074817' AS DateTime2), CAST(N'2023-12-06T12:02:04.5395858' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (14, N'rung3@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-12-06T12:37:29.1643889' AS DateTime2), CAST(N'2023-12-06T12:37:29.1644571' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (15, N'hoangtm01223364550@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 1, CAST(N'2023-12-06T14:01:15.7584211' AS DateTime2), CAST(N'2023-12-06T14:06:09.3163440' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (16, N'rung4@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-12-06T15:08:07.2879596' AS DateTime2), CAST(N'2023-12-06T15:08:07.2880177' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (17, N'hoangtmhoang@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-12-08T03:38:46.8545756' AS DateTime2), CAST(N'2023-12-08T03:38:46.8547890' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (18, N'rung5@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-12-08T09:14:20.7280245' AS DateTime2), CAST(N'2023-12-08T09:14:20.7280838' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'An', N'Nguyễn', N'0988281324', CAST(N'1999-07-07T00:00:00.0000000' AS DateTime2), N'Nam', N'Nguyen Hong, Lang Ha', 6, 0, CAST(N'2023-10-31T22:57:39.3613661' AS DateTime2), CAST(N'2023-10-31T22:57:39.3613685' AS DateTime2))
INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Kim Ánh', N'Trần', N'092224458322', CAST(N'1997-04-02T00:00:00.0000000' AS DateTime2), N'Nữ', N'Hồ Chí Minh', 9, 0, CAST(N'2023-11-21T13:15:07.3527082' AS DateTime2), CAST(N'2023-11-21T13:15:07.3527093' AS DateTime2))
INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Minh Hùng', N'Trần', N'0988281111', CAST(N'1997-12-03T17:00:00.0000000' AS DateTime2), N'Khác', N'HN', 12, 0, CAST(N'2023-12-06T10:16:26.9121718' AS DateTime2), CAST(N'2023-12-10T01:09:52.0385199' AS DateTime2))
INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Dũng', N'Trần', N'0988228883', CAST(N'1999-12-07T17:00:00.0000000' AS DateTime2), N'Nam', N'HN', 17, 0, CAST(N'2023-12-08T03:38:46.9805734' AS DateTime2), CAST(N'2023-12-08T03:38:46.9805751' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentAssignment] ON 

INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, 2, 5, 0, CAST(N'2023-10-31T22:57:39.4002979' AS DateTime2), CAST(N'2023-10-31T22:57:39.4002996' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, 3, 5, 0, CAST(N'2023-11-21T13:15:07.3654347' AS DateTime2), CAST(N'2023-11-21T13:15:07.3654367' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, 6, 7, 0, CAST(N'2023-12-06T10:16:28.9390274' AS DateTime2), CAST(N'2023-12-06T10:16:28.9390290' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (11, 6, 6, 0, CAST(N'2023-12-06T10:16:30.1274773' AS DateTime2), CAST(N'2023-12-06T10:16:30.1274796' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (12, 7, 7, 0, CAST(N'2023-12-08T03:38:46.9889154' AS DateTime2), CAST(N'2023-12-08T03:38:46.9889172' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (13, 7, 8, 0, CAST(N'2023-12-08T03:38:47.0063887' AS DateTime2), CAST(N'2023-12-08T03:38:47.0063906' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AgentAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Công ty TNHH Gỗ Á Châu', NULL, N'779999', NULL, 5, 2, 5, 0, CAST(N'2023-10-23T22:51:49.5787309' AS DateTime2), CAST(N'2023-11-15T00:34:40.7543891' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Công ty TNHH Gỗ Đức Bao An', N'Duc Bao An Wood Company Limited', N'11000', NULL, 7, 1, 5, 0, CAST(N'2023-11-20T22:56:24.6188751' AS DateTime2), CAST(N'2023-12-06T11:11:20.1232902' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Công ty TNHH Đức Long Gia Minh', N'', N'123456', NULL, 8, 2, 5, 0, CAST(N'2023-11-21T11:10:56.9376040' AS DateTime2), CAST(N'2023-12-08T03:25:37.7843860' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Công ty TNHH Gỗ Sâm VN', N'', N'837322', NULL, 14, NULL, 5, 0, CAST(N'2023-12-06T12:37:29.2278182' AS DateTime2), CAST(N'2023-12-06T12:37:29.2278206' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Hoang', N'Hoang', N'3522525', NULL, 15, NULL, 5, 1, CAST(N'2023-12-06T14:01:15.8943929' AS DateTime2), CAST(N'2023-12-06T14:06:09.1634552' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Công ty TNHH Gỗ Đức Việt', N'', N'4366733', NULL, 16, NULL, 5, 0, CAST(N'2023-12-06T15:08:07.3431391' AS DateTime2), CAST(N'2023-12-06T15:08:07.3431413' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Công ty TNHH GỖ Hàn', N'', N'2393939', NULL, 18, NULL, 5, 0, CAST(N'2023-12-08T09:14:20.8686744' AS DateTime2), CAST(N'2023-12-08T09:14:20.8686769' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyType] ON 

INSERT [dbo].[CompanyType] ([Id], [TypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Loại 1', N'Doanh nghiệp loại 1', 0, CAST(N'2023-10-09T23:05:53.9516894' AS DateTime2), CAST(N'2023-10-09T23:05:53.9516911' AS DateTime2))
INSERT [dbo].[CompanyType] ([Id], [TypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Loại 2', N'Doanh nghiệp loại 2', 0, CAST(N'2023-10-09T23:05:53.9351129' AS DateTime2), CAST(N'2023-10-09T23:05:53.9351143' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyType] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyTypeModification] ON 

INSERT [dbo].[CompanyTypeModification] ([Id], [Modification], [IsAnnounced], [AnnouncedAt], [CompanyId], [PreviousCompanyTypeId], [UpdatedCompanyTypeId], [VerificationProcessId], [ViolationReportId], [CompanyReportId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'VERIFICATION', 0, NULL, 2, NULL, 2, 1, NULL, NULL, 0, CAST(N'2023-11-15T00:34:40.6666825' AS DateTime2), CAST(N'2023-11-15T00:34:40.6667403' AS DateTime2))
INSERT [dbo].[CompanyTypeModification] ([Id], [Modification], [IsAnnounced], [AnnouncedAt], [CompanyId], [PreviousCompanyTypeId], [UpdatedCompanyTypeId], [VerificationProcessId], [ViolationReportId], [CompanyReportId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'VERIFICATION', 0, NULL, 3, NULL, 1, 2, NULL, NULL, 0, CAST(N'2023-12-06T11:11:20.0518441' AS DateTime2), CAST(N'2023-12-06T11:11:20.0518981' AS DateTime2))
INSERT [dbo].[CompanyTypeModification] ([Id], [Modification], [IsAnnounced], [AnnouncedAt], [CompanyId], [PreviousCompanyTypeId], [UpdatedCompanyTypeId], [VerificationProcessId], [ViolationReportId], [CompanyReportId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'VIOLATION', 0, NULL, 4, NULL, 2, NULL, 19, NULL, 0, CAST(N'2023-12-08T03:25:37.7371092' AS DateTime2), CAST(N'2023-12-08T03:25:37.7371102' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyTypeModification] OFF
GO
SET IDENTITY_INSERT [dbo].[Criteria] ON 

INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Hồ sơ gỗ nhập khẩu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ nhập khẩu làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ gỗ nhập khẩu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ nhập khẩu làm nguyên liệu chế biến', 2, 0, CAST(N'2023-10-09T23:05:53.8499257' AS DateTime2), CAST(N'2023-10-09T23:05:53.8499260' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Hồ sơ sau xử lý tịch thu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ sau tịch thu làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ sau xử lý tịch thu đối với doanh nghiệp chế biến và xuất khẩu gỗ sử dụng gỗ sau tịch thu làm nguyên liệu chế biến', 2, 0, CAST(N'2023-10-09T23:05:53.8499023' AS DateTime2), CAST(N'2023-10-09T23:05:53.8499026' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Hồ sơ khai thác gỗ đối với doanh nghiệp chế biến và xuất khẩu gỗ trực tiếp khai thác gỗ làm nguyên liệu chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ khai thác gỗ đối với doanh nghiệp chế biến và xuất khẩu gỗ trực tiếp khai thác gỗ làm nguyên liệu chế biến', 2, 0, CAST(N'2023-10-09T23:05:53.8498760' AS DateTime2), CAST(N'2023-10-09T23:05:53.8498763' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Thuế, lao động', N'Tuân thủ quy định của pháp luật về thuế, lao động phải có một trong các loại tài liệu sau:', 1, 0, CAST(N'2023-10-09T23:05:53.8498435' AS DateTime2), CAST(N'2023-10-09T23:05:53.8498438' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Theo dõi nhập, xuất lâm sản', N'Tuân thủ quy định của pháp luật về theo dõi nhập, xuất lâm sản phải có một trong các loại tài liệu sau:', 1, 0, CAST(N'2023-10-09T23:05:53.8498090' AS DateTime2), CAST(N'2023-10-09T23:05:53.8498093' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Phòng cháy, chữa cháy', N'Tuân thủ quy định của pháp luật về phòng cháy, chữa cháy phải có một trong các loại tài liệu sau:', 1, 0, CAST(N'2023-10-09T23:05:53.8497741' AS DateTime2), CAST(N'2023-10-09T23:05:53.8497745' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Môi trường', N'Tuân thủ quy định của pháp luật về môi trường phải có một trong các loại tài liệu sau:', 1, 0, CAST(N'2023-10-09T23:05:53.8496804' AS DateTime2), CAST(N'2023-10-09T23:05:53.8496824' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Thành lập doanh nghiệp', N'Tuân thủ quy định của pháp luật về thành lập doanh nghiệp phải có các loại tài liệu sau:', 1, 0, CAST(N'2023-10-09T23:05:53.8218643' AS DateTime2), CAST(N'2023-10-09T23:05:53.8218661' AS DateTime2))
INSERT [dbo].[Criteria] ([Id], [CriteriaName], [Description], [CriteriaTypeId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'Hồ sơ trong quá trình mua bán, vận chuyển; chế biến', N'Tuân thủ quy định của pháp luật về hồ sơ trong quá trình mua bán, vận chuyển; chế biến', 2, 0, CAST(N'2023-10-09T23:05:53.8499539' AS DateTime2), CAST(N'2023-10-09T23:05:53.8499542' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Criteria] OFF
GO
SET IDENTITY_INSERT [dbo].[CriteriaDetail] ON 

INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 0, 9, 0, CAST(N'2023-10-09T23:05:53.8871580' AS DateTime2), CAST(N'2023-10-09T23:05:53.8871582' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Bản sao hồ sơ gỗ nhập khẩu', N'Bản sao hồ sơ gỗ nhập khẩu', 0, 1, 0, CAST(N'2023-10-09T23:05:53.8871324' AS DateTime2), CAST(N'2023-10-09T23:05:53.8871327' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 0, 1, 0, CAST(N'2023-10-09T23:05:53.8870961' AS DateTime2), CAST(N'2023-10-09T23:05:53.8870964' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Bản sao hồ sơ gỗ sau xử lý tịch thu', N'Bản sao hồ sơ gỗ sau xử lý tịch thu', 0, 2, 0, CAST(N'2023-10-09T23:05:53.8870697' AS DateTime2), CAST(N'2023-10-09T23:05:53.8870700' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 0, 2, 0, CAST(N'2023-10-09T23:05:53.8870397' AS DateTime2), CAST(N'2023-10-09T23:05:53.8870400' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'Bản sao hồ sơ nguồn gốc gỗ khai thác', N'Bản sao hồ sơ nguồn gốc gỗ khai thác', 0, 3, 0, CAST(N'2023-10-09T23:05:53.8870120' AS DateTime2), CAST(N'2023-10-09T23:05:53.8870122' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'Bảng kê gỗ theo quy định của pháp luật', N'Bảng kê gỗ theo quy định của pháp luật', 0, 3, 0, CAST(N'2023-10-09T23:05:53.8869864' AS DateTime2), CAST(N'2023-10-09T23:05:53.8869867' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'Chấp hành quy định về trình tự, thủ tục khai thác gỗ', N'Chấp hành quy định về trình tự, thủ tục khai thác gỗ', 0, 3, 0, CAST(N'2023-10-09T23:05:53.8869571' AS DateTime2), CAST(N'2023-10-09T23:05:53.8869574' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'Người lao động là thành viên tổ chức Công đoàn của doanh nghiệp', N'Người lao động là thành viên tổ chức Công đoàn của doanh nghiệp', 1, 4, 0, CAST(N'2023-10-09T23:05:53.8869321' AS DateTime2), CAST(N'2023-10-09T23:05:53.8869324' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'Bản sao hồ sơ nguồn gốc gỗ', N'Bản sao hồ sơ nguồn gốc gỗ', 0, 9, 0, CAST(N'2023-10-09T23:05:53.8871880' AS DateTime2), CAST(N'2023-10-09T23:05:53.8871883' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (11, N'Niêm yết công khai thông tin về đóng bảo hiểm xã hội và y tế đối với người lao động theo quy định của Luật Bảo hiểm xã hội', N'Niêm yết công khai thông tin về đóng bảo hiểm xã hội và y tế đối với người lao động theo quy định của Luật Bảo hiểm xã hội', 1, 4, 0, CAST(N'2023-10-09T23:05:53.8869022' AS DateTime2), CAST(N'2023-10-09T23:05:53.8869025' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (12, N'Có kế hoạch vệ sinh an toàn lao động theo quy định của pháp luật', N'Có kế hoạch vệ sinh an toàn lao động theo quy định của pháp luật', 1, 4, 0, CAST(N'2023-10-09T23:05:53.8868471' AS DateTime2), CAST(N'2023-10-09T23:05:53.8868474' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (13, N'Giấy chứng nhận đăng ký doanh nghiệp', N'Giấy chứng nhận đăng ký doanh nghiệp', 1, 8, 0, CAST(N'2023-10-09T23:05:53.8716757' AS DateTime2), CAST(N'2023-10-09T23:05:53.8716773' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (14, N'Giấy chứng nhận đăng ký đầu tư đối với doanh nghiệp có vốn đầu tư nước ngoài hoặc có yếu tố nước ngoài chiếm 51% vốn điều lệ hoặc doanh nghiệp hoạt động trong khu công nghiệp, khu chế xuất', N'Giấy chứng nhận đăng ký đầu tư đối với doanh nghiệp có vốn đầu tư nước ngoài hoặc có yếu tố nước ngoài chiếm 51% vốn điều lệ hoặc doanh nghiệp hoạt động trong khu công nghiệp, khu chế xuất', 0, 8, 0, CAST(N'2023-10-09T23:05:53.8865807' AS DateTime2), CAST(N'2023-10-09T23:05:53.8865827' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (15, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở chế biến gỗ, dăm gỗ từ gỗ rừng tự nhiên có công suất từ 5.000 m3 sản phẩm/năm trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở chế biến gỗ, dăm gỗ từ gỗ rừng tự nhiên có công suất từ 5.000 m3 sản phẩm/năm trở lên', 0, 7, 0, CAST(N'2023-10-09T23:05:53.8866433' AS DateTime2), CAST(N'2023-10-09T23:05:53.8866438' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (16, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất ván ép có công suất từ 100.000 m2 sản phẩm/năm trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất ván ép có công suất từ 100.000 m2 sản phẩm/năm trở lên', 0, 7, 0, CAST(N'2023-10-09T23:05:53.8866742' AS DateTime2), CAST(N'2023-10-09T23:05:53.8866746' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (17, N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất đồ gỗ có tổng diện tích kho bãi, nhà xưởng từ 10.000 m2 trở lên', N'Quyết định phê duyệt báo cáo đánh giá tác động môi trường đối với cơ sở sản xuất đồ gỗ có tổng diện tích kho bãi, nhà xưởng từ 10.000 m2 trở lên', 0, 7, 0, CAST(N'2023-10-09T23:05:53.8867010' AS DateTime2), CAST(N'2023-10-09T23:05:53.8867014' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (18, N'Có kế hoạch bảo vệ môi trường đối với các cơ sở sản xuất có công suất hay diện tích nhỏ hơn công suất hoặc diện tích của các cơ sở sản xuất quy định tại các điểm a, b, c nêu trên', N'Có kế hoạch bảo vệ môi trường đối với các cơ sở sản xuất có công suất hay diện tích nhỏ hơn công suất hoặc diện tích của các cơ sở sản xuất quy định tại các điểm a, b, c nêu trên', 0, 7, 0, CAST(N'2023-10-09T23:05:53.8867348' AS DateTime2), CAST(N'2023-10-09T23:05:53.8867352' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (19, N'Phương án phòng cháy, chữa cháy theo quy định pháp luật', N'Phương án phòng cháy, chữa cháy theo quy định pháp luật', 1, 6, 0, CAST(N'2023-10-09T23:05:53.8867612' AS DateTime2), CAST(N'2023-10-09T23:05:53.8867615' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (20, N'Sổ theo dõi nhập, xuất lâm sản được ghi chép đầy đủ theo đúng quy định pháp luật', N'Sổ theo dõi nhập, xuất lâm sản được ghi chép đầy đủ theo đúng quy định pháp luật', 1, 5, 0, CAST(N'2023-10-09T23:05:53.8867912' AS DateTime2), CAST(N'2023-10-09T23:05:53.8867915' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (21, N'Người lao động có tên trong danh sách bảng lương của doanh nghiệp', N'Người lao động có tên trong danh sách bảng lương của doanh nghiệp', 1, 4, 0, CAST(N'2023-10-09T23:05:53.8868769' AS DateTime2), CAST(N'2023-10-09T23:05:53.8868773' AS DateTime2))
INSERT [dbo].[CriteriaDetail] ([Id], [CriteriaDetailName], [Description], [IsRequired], [CriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (22, N'Không có tên trong danh sách công khai thông tin tổ chức, cá nhân kinh doanh có dấu hiệu vi phạm pháp luật về thuế', N'Không có tên trong danh sách công khai thông tin tổ chức, cá nhân kinh doanh có dấu hiệu vi phạm pháp luật về thuế', 1, 4, 0, CAST(N'2023-10-09T23:05:53.8868177' AS DateTime2), CAST(N'2023-10-09T23:05:53.8868181' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CriteriaDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[CriteriaType] ON 

INSERT [dbo].[CriteriaType] ([Id], [CriteriaTypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Tuân thủ quy định của pháp luật trong việc thành lập và hoạt động của doanh nghiệp', N'Tuân thủ quy định của pháp luật trong việc thành lập và hoạt động của doanh nghiệp', 0, CAST(N'2023-10-09T23:05:53.6728454' AS DateTime2), CAST(N'2023-10-09T23:05:53.6728460' AS DateTime2))
INSERT [dbo].[CriteriaType] ([Id], [CriteriaTypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Tuân thủ quy định của pháp luật về nguồn gốc gỗ hợp pháp', N'Tuân thủ quy định của pháp luật về nguồn gốc gỗ hợp pháp', 0, CAST(N'2023-10-09T23:05:53.6853166' AS DateTime2), CAST(N'2023-10-09T23:05:53.6853183' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CriteriaType] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'880000', N'An Giang', 0, CAST(N'2023-10-23T22:51:37.5652276' AS DateTime2), CAST(N'2023-10-23T22:51:37.5666089' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'790000', N'Ba Ria - Vung Tau', 0, CAST(N'2023-10-23T22:51:37.5667181' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667188' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'260000', N'Bac Lieu', 0, CAST(N'2023-10-23T22:51:37.5667192' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667193' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'960000', N'Bac Kan', 0, CAST(N'2023-10-23T22:51:37.5667195' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667196' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'100000', N'Ha Noi', 0, CAST(N'2023-10-23T22:51:37.5667198' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667200' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'700000', N'Ho Chi Minh', 0, CAST(N'2023-10-23T22:51:37.5667201' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667203' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'160000', N'Hung Yen', 0, CAST(N'2023-10-23T22:51:37.5667204' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667206' AS DateTime2))
INSERT [dbo].[Province] ([Id], [ProvinceCode], [ProvinceName], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'510000', N'Quang Binh', 0, CAST(N'2023-10-23T22:51:37.5667207' AS DateTime2), CAST(N'2023-10-23T22:51:37.5667209' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [RoleName], [Description], [HasManagement], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Admin', N'Admin Role', 1, 0, CAST(N'2023-10-09T23:05:53.6565596' AS DateTime2), CAST(N'2023-10-09T23:05:53.6566095' AS DateTime2))
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [HasManagement], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Agent', N'Agent Role', 1, 0, CAST(N'2023-10-09T23:05:53.6725384' AS DateTime2), CAST(N'2023-10-09T23:05:53.6725402' AS DateTime2))
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [HasManagement], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Company', N'Company Role', 0, 0, CAST(N'2023-10-09T23:05:53.6725967' AS DateTime2), CAST(N'2023-10-09T23:05:53.6725972' AS DateTime2))
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [HasManagement], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'ThirdParty', N'Third Party Role', 0, 0, CAST(N'2023-10-09T23:05:53.6726188' AS DateTime2), CAST(N'2023-10-09T23:05:53.6726191' AS DateTime2))
INSERT [dbo].[Role] ([Id], [RoleName], [Description], [HasManagement], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'SuperUser', N'Super User Role', 1, 0, CAST(N'2023-10-09T23:05:53.6726674' AS DateTime2), CAST(N'2023-10-09T23:05:53.6726679' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemConfiguration] ON 

INSERT [dbo].[SystemConfiguration] ([Id], [ConfigurationKey], [ConfigurationValue], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'MODIFICATION_VALID_DURATION', N'1-year', 0, CAST(N'2023-10-09T23:05:53.5738477' AS DateTime2), CAST(N'2023-10-09T23:05:53.5750450' AS DateTime2))
SET IDENTITY_INSERT [dbo].[SystemConfiguration] OFF
GO
SET IDENTITY_INSERT [dbo].[ThirdParty] ON 

INSERT [dbo].[ThirdParty] ([Id], [UserName], [ClientId], [ClientSecret], [IsActive], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'ben.thu.huong1', N'08c8e323-e0db-4c4a-95c1-3d517da942fc', N'89676797b0939f7aa2fb33204a038406', 1, 13, 0, CAST(N'2023-12-06T11:46:05.0169372' AS DateTime2), CAST(N'2023-12-06T12:02:04.3891059' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ThirdParty] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationCriteria] ON 

INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'VERIFIED', 1, NULL, NULL, NULL, 1, 1, 0, CAST(N'2023-10-23T22:51:52.2528121' AS DateTime2), CAST(N'2023-11-12T23:00:07.5631635' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'VERIFIED', 1, NULL, NULL, NULL, 1, 2, 0, CAST(N'2023-10-23T22:51:52.3031251' AS DateTime2), CAST(N'2023-11-12T23:00:07.5843765' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 3, 0, CAST(N'2023-10-23T22:51:52.3063624' AS DateTime2), CAST(N'2023-11-12T23:00:07.5867609' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'VERIFIED', 1, N'', NULL, NULL, 1, 4, 0, CAST(N'2023-10-23T22:51:52.3136436' AS DateTime2), CAST(N'2023-11-12T23:00:07.5908187' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 5, 0, CAST(N'2023-10-23T22:51:52.3165446' AS DateTime2), CAST(N'2023-11-12T23:00:07.5925275' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 6, 0, CAST(N'2023-10-23T22:51:52.3190556' AS DateTime2), CAST(N'2023-11-12T23:00:07.5937114' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 7, 0, CAST(N'2023-10-23T22:51:52.3220158' AS DateTime2), CAST(N'2023-11-12T23:00:07.5948700' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 8, 0, CAST(N'2023-10-23T22:51:52.3248609' AS DateTime2), CAST(N'2023-11-12T23:00:07.5961977' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'REJECTED', NULL, N'AAAA', NULL, N'cần bổ sung Abc', 1, 9, 0, CAST(N'2023-10-23T22:51:52.3275553' AS DateTime2), CAST(N'2023-11-13T21:59:00.7281914' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 10, 0, CAST(N'2023-10-23T22:51:52.3308377' AS DateTime2), CAST(N'2023-11-12T23:00:07.5988304' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (11, N'REJECTED', NULL, N'vvv', NULL, N'cần bổ sung QWE', 1, 11, 0, CAST(N'2023-10-23T22:51:52.3333696' AS DateTime2), CAST(N'2023-11-13T21:58:59.4003680' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (12, N'VERIFIED', 1, N'aaqqq', NULL, NULL, 1, 12, 0, CAST(N'2023-10-23T22:51:52.3366254' AS DateTime2), CAST(N'2023-11-12T23:48:41.9039512' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (13, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 13, 0, CAST(N'2023-10-23T22:51:52.3393347' AS DateTime2), CAST(N'2023-11-12T23:00:07.6021605' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (14, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 14, 0, CAST(N'2023-10-23T22:51:52.3423052' AS DateTime2), CAST(N'2023-11-12T23:00:07.6032389' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (15, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 15, 0, CAST(N'2023-10-23T22:51:52.3449320' AS DateTime2), CAST(N'2023-11-12T23:00:07.6044128' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (16, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 16, 0, CAST(N'2023-10-23T22:51:52.3478964' AS DateTime2), CAST(N'2023-11-12T23:00:07.6056826' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (17, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 17, 0, CAST(N'2023-10-23T22:51:52.3508531' AS DateTime2), CAST(N'2023-11-12T23:00:07.6069135' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (18, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 18, 0, CAST(N'2023-10-23T22:51:52.3536528' AS DateTime2), CAST(N'2023-11-12T23:00:07.6080055' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (19, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 19, 0, CAST(N'2023-10-23T22:51:52.3565420' AS DateTime2), CAST(N'2023-11-12T23:00:07.6091304' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (20, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 20, 0, CAST(N'2023-10-23T22:51:52.3591192' AS DateTime2), CAST(N'2023-11-12T23:00:07.6103057' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (21, N'VERIFIED', 1, NULL, NULL, NULL, 1, 21, 0, CAST(N'2023-10-23T22:51:52.3617322' AS DateTime2), CAST(N'2023-11-12T23:48:42.5793446' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (22, N'VERIFIED', NULL, NULL, NULL, NULL, 1, 22, 0, CAST(N'2023-10-23T22:51:52.3645936' AS DateTime2), CAST(N'2023-11-12T23:00:07.6130582' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (23, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 1, 0, CAST(N'2023-11-20T22:56:27.5760470' AS DateTime2), CAST(N'2023-12-06T10:40:42.2945311' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (24, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 2, 0, CAST(N'2023-11-20T22:56:27.5878646' AS DateTime2), CAST(N'2023-12-06T10:40:42.3111653' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (25, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 3, 0, CAST(N'2023-11-20T22:56:27.5899380' AS DateTime2), CAST(N'2023-12-06T10:40:42.3128134' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (26, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 4, 0, CAST(N'2023-11-20T22:56:27.5916499' AS DateTime2), CAST(N'2023-12-06T10:40:42.3141241' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (27, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 5, 0, CAST(N'2023-11-20T22:56:27.5933353' AS DateTime2), CAST(N'2023-12-06T10:40:42.3151879' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (28, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 6, 0, CAST(N'2023-11-20T22:56:27.5948965' AS DateTime2), CAST(N'2023-12-06T10:40:42.3163397' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (29, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 7, 0, CAST(N'2023-11-20T22:56:27.5965043' AS DateTime2), CAST(N'2023-12-06T10:40:42.3175280' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (30, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 8, 0, CAST(N'2023-11-20T22:56:27.5981339' AS DateTime2), CAST(N'2023-12-06T10:40:42.3185981' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (31, N'VERIFIED', 1, NULL, NULL, NULL, 2, 9, 0, CAST(N'2023-11-20T22:56:27.5995258' AS DateTime2), CAST(N'2023-12-06T10:40:42.3196513' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (32, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 10, 0, CAST(N'2023-11-20T22:56:27.6011137' AS DateTime2), CAST(N'2023-12-06T10:40:42.3227729' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (33, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 11, 0, CAST(N'2023-11-20T22:56:27.6024965' AS DateTime2), CAST(N'2023-12-06T10:40:42.3240912' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (34, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 12, 0, CAST(N'2023-11-20T22:56:27.6041989' AS DateTime2), CAST(N'2023-12-06T10:40:42.3252092' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (35, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 13, 0, CAST(N'2023-11-20T22:56:27.6059693' AS DateTime2), CAST(N'2023-12-06T10:40:42.3262883' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (36, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 14, 0, CAST(N'2023-11-20T22:56:27.6075917' AS DateTime2), CAST(N'2023-12-06T10:40:42.3273253' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (37, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 15, 0, CAST(N'2023-11-20T22:56:27.6089651' AS DateTime2), CAST(N'2023-12-06T10:40:42.3283581' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (38, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 16, 0, CAST(N'2023-11-20T22:56:27.6104759' AS DateTime2), CAST(N'2023-12-06T10:40:42.3293951' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (39, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 17, 0, CAST(N'2023-11-20T22:56:27.6120645' AS DateTime2), CAST(N'2023-12-06T10:40:42.3305747' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (40, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 18, 0, CAST(N'2023-11-20T22:56:27.6135254' AS DateTime2), CAST(N'2023-12-06T10:40:42.3319335' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (41, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 19, 0, CAST(N'2023-11-20T22:56:27.6152779' AS DateTime2), CAST(N'2023-12-06T10:40:42.3329783' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (42, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 20, 0, CAST(N'2023-11-20T22:56:27.6166189' AS DateTime2), CAST(N'2023-12-06T10:40:42.3340297' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (43, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 21, 0, CAST(N'2023-11-20T22:56:27.6180573' AS DateTime2), CAST(N'2023-12-06T10:40:42.3350551' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (44, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 22, 0, CAST(N'2023-11-20T22:56:27.6198398' AS DateTime2), CAST(N'2023-12-06T10:40:42.3360730' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (45, N'PENDING', NULL, NULL, NULL, NULL, 3, 1, 0, CAST(N'2023-11-21T11:10:59.8251647' AS DateTime2), CAST(N'2023-11-21T11:10:59.8251668' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (46, N'PENDING', NULL, NULL, NULL, NULL, 3, 2, 0, CAST(N'2023-11-21T11:10:59.8526820' AS DateTime2), CAST(N'2023-11-21T11:10:59.8526836' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (47, N'PENDING', NULL, NULL, NULL, NULL, 3, 3, 0, CAST(N'2023-11-21T11:10:59.8552604' AS DateTime2), CAST(N'2023-11-21T11:10:59.8552613' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (48, N'PENDING', NULL, NULL, NULL, NULL, 3, 4, 0, CAST(N'2023-11-21T11:10:59.8570418' AS DateTime2), CAST(N'2023-11-21T11:10:59.8570425' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (49, N'PENDING', NULL, NULL, NULL, NULL, 3, 5, 0, CAST(N'2023-11-21T11:10:59.8587081' AS DateTime2), CAST(N'2023-11-21T11:10:59.8587088' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (50, N'PENDING', NULL, NULL, NULL, NULL, 3, 6, 0, CAST(N'2023-11-21T11:10:59.8602182' AS DateTime2), CAST(N'2023-11-21T11:10:59.8602188' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (51, N'PENDING', NULL, NULL, NULL, NULL, 3, 7, 0, CAST(N'2023-11-21T11:10:59.8616717' AS DateTime2), CAST(N'2023-11-21T11:10:59.8616724' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (52, N'PENDING', NULL, NULL, NULL, NULL, 3, 8, 0, CAST(N'2023-11-21T11:10:59.8630328' AS DateTime2), CAST(N'2023-11-21T11:10:59.8630334' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (53, N'PENDING', NULL, NULL, NULL, NULL, 3, 9, 0, CAST(N'2023-11-21T11:10:59.8642798' AS DateTime2), CAST(N'2023-11-21T11:10:59.8642804' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (54, N'PENDING', NULL, NULL, NULL, NULL, 3, 10, 0, CAST(N'2023-11-21T11:10:59.8655290' AS DateTime2), CAST(N'2023-11-21T11:10:59.8655299' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (55, N'PENDING', NULL, NULL, NULL, NULL, 3, 11, 0, CAST(N'2023-11-21T11:10:59.8668225' AS DateTime2), CAST(N'2023-11-21T11:10:59.8668232' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (56, N'PENDING', NULL, NULL, NULL, NULL, 3, 12, 0, CAST(N'2023-11-21T11:10:59.8680874' AS DateTime2), CAST(N'2023-11-21T11:10:59.8680880' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (57, N'PENDING', NULL, NULL, NULL, NULL, 3, 13, 0, CAST(N'2023-11-21T11:10:59.8693413' AS DateTime2), CAST(N'2023-11-21T11:10:59.8693419' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (58, N'PENDING', NULL, NULL, NULL, NULL, 3, 14, 0, CAST(N'2023-11-21T11:10:59.8706080' AS DateTime2), CAST(N'2023-11-21T11:10:59.8706085' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (59, N'PENDING', NULL, NULL, NULL, NULL, 3, 15, 0, CAST(N'2023-11-21T11:10:59.8719392' AS DateTime2), CAST(N'2023-11-21T11:10:59.8719399' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (60, N'PENDING', NULL, NULL, NULL, NULL, 3, 16, 0, CAST(N'2023-11-21T11:10:59.8732584' AS DateTime2), CAST(N'2023-11-21T11:10:59.8732589' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (61, N'PENDING', NULL, NULL, NULL, NULL, 3, 17, 0, CAST(N'2023-11-21T11:10:59.8746082' AS DateTime2), CAST(N'2023-11-21T11:10:59.8746089' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (62, N'PENDING', NULL, NULL, NULL, NULL, 3, 18, 0, CAST(N'2023-11-21T11:10:59.8759411' AS DateTime2), CAST(N'2023-11-21T11:10:59.8759417' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (63, N'PENDING', NULL, NULL, NULL, NULL, 3, 19, 0, CAST(N'2023-11-21T11:10:59.8773087' AS DateTime2), CAST(N'2023-11-21T11:10:59.8773093' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (64, N'PENDING', NULL, NULL, NULL, NULL, 3, 20, 0, CAST(N'2023-11-21T11:10:59.8786918' AS DateTime2), CAST(N'2023-11-21T11:10:59.8786924' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (65, N'PENDING', NULL, NULL, NULL, NULL, 3, 21, 0, CAST(N'2023-11-21T11:10:59.8800469' AS DateTime2), CAST(N'2023-11-21T11:10:59.8800475' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (66, N'PENDING', NULL, NULL, NULL, NULL, 3, 22, 0, CAST(N'2023-11-21T11:10:59.8813931' AS DateTime2), CAST(N'2023-11-21T11:10:59.8813936' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (67, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 1, 0, CAST(N'2023-12-06T12:37:52.6332424' AS DateTime2), CAST(N'2023-12-10T02:06:59.3703003' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (68, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 2, 0, CAST(N'2023-12-06T12:37:52.6657992' AS DateTime2), CAST(N'2023-12-10T02:06:59.3875455' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (69, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 3, 0, CAST(N'2023-12-06T12:37:52.6702976' AS DateTime2), CAST(N'2023-12-10T02:06:59.3892693' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (70, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 4, 0, CAST(N'2023-12-06T12:37:52.6716946' AS DateTime2), CAST(N'2023-12-10T02:06:59.3905697' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (71, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 5, 0, CAST(N'2023-12-06T12:37:52.6729761' AS DateTime2), CAST(N'2023-12-10T02:06:59.3920439' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (72, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 6, 0, CAST(N'2023-12-06T12:37:52.6741935' AS DateTime2), CAST(N'2023-12-10T02:06:59.3933937' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (73, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 7, 0, CAST(N'2023-12-06T12:37:52.6754597' AS DateTime2), CAST(N'2023-12-10T02:06:59.3945255' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (74, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 8, 0, CAST(N'2023-12-06T12:37:52.6767144' AS DateTime2), CAST(N'2023-12-10T02:06:59.3957822' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (75, N'VERIFIED', 1, NULL, NULL, NULL, 4, 9, 0, CAST(N'2023-12-06T12:37:52.6779384' AS DateTime2), CAST(N'2023-12-10T02:06:59.3968840' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (76, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 10, 0, CAST(N'2023-12-06T12:37:52.6791856' AS DateTime2), CAST(N'2023-12-10T02:06:59.4006229' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (77, N'VERIFIED', 1, NULL, NULL, NULL, 4, 11, 0, CAST(N'2023-12-06T12:37:52.6804382' AS DateTime2), CAST(N'2023-12-10T02:06:59.4018005' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (78, N'VERIFIED', 1, NULL, NULL, NULL, 4, 12, 0, CAST(N'2023-12-06T12:37:52.6817606' AS DateTime2), CAST(N'2023-12-10T02:06:59.4029748' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (79, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 13, 0, CAST(N'2023-12-06T12:37:52.6830459' AS DateTime2), CAST(N'2023-12-10T02:12:35.4797106' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (80, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 14, 0, CAST(N'2023-12-06T12:37:52.6843284' AS DateTime2), CAST(N'2023-12-10T02:06:59.4056866' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (81, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 15, 0, CAST(N'2023-12-06T12:37:52.6856740' AS DateTime2), CAST(N'2023-12-10T02:06:59.4068747' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (82, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 16, 0, CAST(N'2023-12-06T12:37:52.6869868' AS DateTime2), CAST(N'2023-12-10T02:06:59.4080306' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (83, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 17, 0, CAST(N'2023-12-06T12:37:52.6882824' AS DateTime2), CAST(N'2023-12-10T02:06:59.4092331' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (84, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 18, 0, CAST(N'2023-12-06T12:37:52.6896132' AS DateTime2), CAST(N'2023-12-10T02:06:59.4104489' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (85, N'VERIFIED', NULL, NULL, NULL, NULL, 4, 19, 0, CAST(N'2023-12-06T12:37:52.6909423' AS DateTime2), CAST(N'2023-12-10T02:06:59.4116297' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (86, N'VERIFIED', NULL, NULL, NULL, N'chưa có file đính kèm', 4, 20, 0, CAST(N'2023-12-06T12:37:52.6922944' AS DateTime2), CAST(N'2023-12-10T02:06:59.4130333' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (87, N'VERIFIED', 1, NULL, NULL, NULL, 4, 21, 0, CAST(N'2023-12-06T12:37:52.6936642' AS DateTime2), CAST(N'2023-12-10T02:06:59.4141988' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (88, N'VERIFIED', 1, NULL, NULL, NULL, 4, 22, 0, CAST(N'2023-12-06T12:37:52.6950193' AS DateTime2), CAST(N'2023-12-10T02:06:59.4154033' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (89, N'PENDING', NULL, NULL, NULL, NULL, 5, 1, 0, CAST(N'2023-12-06T14:01:38.9961188' AS DateTime2), CAST(N'2023-12-06T14:01:38.9961202' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (90, N'PENDING', NULL, NULL, NULL, NULL, 5, 2, 0, CAST(N'2023-12-06T14:01:39.0258678' AS DateTime2), CAST(N'2023-12-06T14:01:39.0258693' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (91, N'PENDING', NULL, NULL, NULL, NULL, 5, 3, 0, CAST(N'2023-12-06T14:01:39.0283189' AS DateTime2), CAST(N'2023-12-06T14:01:39.0283197' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (92, N'PENDING', NULL, NULL, NULL, NULL, 5, 4, 0, CAST(N'2023-12-06T14:01:39.0301794' AS DateTime2), CAST(N'2023-12-06T14:01:39.0301802' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (93, N'PENDING', NULL, NULL, NULL, NULL, 5, 5, 0, CAST(N'2023-12-06T14:01:39.0319603' AS DateTime2), CAST(N'2023-12-06T14:01:39.0319610' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (94, N'PENDING', NULL, NULL, NULL, NULL, 5, 6, 0, CAST(N'2023-12-06T14:01:39.0332621' AS DateTime2), CAST(N'2023-12-06T14:01:39.0332627' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (95, N'PENDING', NULL, NULL, NULL, NULL, 5, 7, 0, CAST(N'2023-12-06T14:01:39.0345674' AS DateTime2), CAST(N'2023-12-06T14:01:39.0345680' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (96, N'PENDING', NULL, NULL, NULL, NULL, 5, 8, 0, CAST(N'2023-12-06T14:01:39.0358604' AS DateTime2), CAST(N'2023-12-06T14:01:39.0358611' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (97, N'PENDING', NULL, NULL, NULL, NULL, 5, 9, 0, CAST(N'2023-12-06T14:01:39.0375978' AS DateTime2), CAST(N'2023-12-06T14:01:39.0375984' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (98, N'PENDING', NULL, NULL, NULL, NULL, 5, 10, 0, CAST(N'2023-12-06T14:01:39.0389222' AS DateTime2), CAST(N'2023-12-06T14:01:39.0389227' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (99, N'PENDING', NULL, NULL, NULL, NULL, 5, 11, 0, CAST(N'2023-12-06T14:01:39.0402600' AS DateTime2), CAST(N'2023-12-06T14:01:39.0402605' AS DateTime2))
GO
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (100, N'PENDING', NULL, NULL, NULL, NULL, 5, 12, 0, CAST(N'2023-12-06T14:01:39.0416097' AS DateTime2), CAST(N'2023-12-06T14:01:39.0416102' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (101, N'PENDING', NULL, NULL, NULL, NULL, 5, 13, 0, CAST(N'2023-12-06T14:01:39.0429447' AS DateTime2), CAST(N'2023-12-06T14:01:39.0429457' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (102, N'PENDING', NULL, NULL, NULL, NULL, 5, 14, 0, CAST(N'2023-12-06T14:01:39.0443200' AS DateTime2), CAST(N'2023-12-06T14:01:39.0443206' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (103, N'PENDING', NULL, NULL, NULL, NULL, 5, 15, 0, CAST(N'2023-12-06T14:01:39.0456863' AS DateTime2), CAST(N'2023-12-06T14:01:39.0456869' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (104, N'PENDING', NULL, NULL, NULL, NULL, 5, 16, 0, CAST(N'2023-12-06T14:01:39.0470139' AS DateTime2), CAST(N'2023-12-06T14:01:39.0470145' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (105, N'PENDING', NULL, NULL, NULL, NULL, 5, 17, 0, CAST(N'2023-12-06T14:01:39.0486392' AS DateTime2), CAST(N'2023-12-06T14:01:39.0486402' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (106, N'PENDING', NULL, NULL, NULL, NULL, 5, 18, 0, CAST(N'2023-12-06T14:01:39.0503281' AS DateTime2), CAST(N'2023-12-06T14:01:39.0503292' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (107, N'PENDING', NULL, NULL, NULL, NULL, 5, 19, 0, CAST(N'2023-12-06T14:01:39.0524615' AS DateTime2), CAST(N'2023-12-06T14:01:39.0524625' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (108, N'PENDING', NULL, NULL, NULL, NULL, 5, 20, 0, CAST(N'2023-12-06T14:01:39.0539621' AS DateTime2), CAST(N'2023-12-06T14:01:39.0539628' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (109, N'PENDING', NULL, NULL, NULL, NULL, 5, 21, 0, CAST(N'2023-12-06T14:01:39.0556444' AS DateTime2), CAST(N'2023-12-06T14:01:39.0556454' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (110, N'PENDING', NULL, NULL, NULL, NULL, 5, 22, 0, CAST(N'2023-12-06T14:01:39.0583632' AS DateTime2), CAST(N'2023-12-06T14:01:39.0583645' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (111, N'PENDING', NULL, NULL, NULL, NULL, 6, 1, 0, CAST(N'2023-12-06T15:08:10.8512235' AS DateTime2), CAST(N'2023-12-06T15:08:10.8512252' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (112, N'PENDING', NULL, NULL, NULL, NULL, 6, 2, 0, CAST(N'2023-12-06T15:08:10.8619157' AS DateTime2), CAST(N'2023-12-06T15:08:10.8619181' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (113, N'PENDING', NULL, NULL, NULL, NULL, 6, 3, 0, CAST(N'2023-12-06T15:08:10.8643777' AS DateTime2), CAST(N'2023-12-06T15:08:10.8643789' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (114, N'PENDING', NULL, NULL, NULL, NULL, 6, 4, 0, CAST(N'2023-12-06T15:08:10.8662199' AS DateTime2), CAST(N'2023-12-06T15:08:10.8662207' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (115, N'PENDING', NULL, NULL, NULL, NULL, 6, 5, 0, CAST(N'2023-12-06T15:08:10.8675210' AS DateTime2), CAST(N'2023-12-06T15:08:10.8675216' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (116, N'PENDING', NULL, NULL, NULL, NULL, 6, 6, 0, CAST(N'2023-12-06T15:08:10.8687693' AS DateTime2), CAST(N'2023-12-06T15:08:10.8687699' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (117, N'PENDING', NULL, NULL, NULL, NULL, 6, 7, 0, CAST(N'2023-12-06T15:08:10.8699732' AS DateTime2), CAST(N'2023-12-06T15:08:10.8699738' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (118, N'PENDING', NULL, NULL, NULL, NULL, 6, 8, 0, CAST(N'2023-12-06T15:08:10.8711807' AS DateTime2), CAST(N'2023-12-06T15:08:10.8711813' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (119, N'VERIFIED', 1, NULL, NULL, NULL, 6, 9, 0, CAST(N'2023-12-06T15:08:10.8725194' AS DateTime2), CAST(N'2023-12-06T15:49:46.3799500' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (120, N'PENDING', NULL, NULL, NULL, NULL, 6, 10, 0, CAST(N'2023-12-06T15:08:10.8740517' AS DateTime2), CAST(N'2023-12-06T15:08:10.8740531' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (121, N'VERIFIED', NULL, NULL, NULL, NULL, 6, 11, 0, CAST(N'2023-12-06T15:08:10.8752913' AS DateTime2), CAST(N'2023-12-08T19:41:23.8584096' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (122, N'PENDING', NULL, NULL, NULL, NULL, 6, 12, 0, CAST(N'2023-12-06T15:08:10.8770475' AS DateTime2), CAST(N'2023-12-06T15:08:10.8770489' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (123, N'PENDING', NULL, NULL, NULL, NULL, 6, 13, 0, CAST(N'2023-12-06T15:08:10.8785319' AS DateTime2), CAST(N'2023-12-06T15:08:10.8785328' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (124, N'PENDING', NULL, NULL, NULL, NULL, 6, 14, 0, CAST(N'2023-12-06T15:08:10.8799406' AS DateTime2), CAST(N'2023-12-06T15:08:10.8799412' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (125, N'PENDING', NULL, NULL, NULL, NULL, 6, 15, 0, CAST(N'2023-12-06T15:08:10.8813201' AS DateTime2), CAST(N'2023-12-06T15:08:10.8813207' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (126, N'PENDING', NULL, NULL, NULL, NULL, 6, 16, 0, CAST(N'2023-12-06T15:08:10.8826309' AS DateTime2), CAST(N'2023-12-06T15:08:10.8826315' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (127, N'PENDING', NULL, NULL, NULL, NULL, 6, 17, 0, CAST(N'2023-12-06T15:08:10.8838832' AS DateTime2), CAST(N'2023-12-06T15:08:10.8838837' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (128, N'PENDING', NULL, NULL, NULL, NULL, 6, 18, 0, CAST(N'2023-12-06T15:08:10.8855860' AS DateTime2), CAST(N'2023-12-06T15:08:10.8855867' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (129, N'PENDING', NULL, NULL, NULL, NULL, 6, 19, 0, CAST(N'2023-12-06T15:08:10.8876400' AS DateTime2), CAST(N'2023-12-06T15:08:10.8876414' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (130, N'PENDING', NULL, NULL, NULL, NULL, 6, 20, 0, CAST(N'2023-12-06T15:08:10.8897916' AS DateTime2), CAST(N'2023-12-06T15:08:10.8897937' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (131, N'PENDING', NULL, NULL, NULL, NULL, 6, 21, 0, CAST(N'2023-12-06T15:08:10.8929708' AS DateTime2), CAST(N'2023-12-06T15:08:10.8929723' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (132, N'PENDING', NULL, NULL, NULL, NULL, 6, 22, 0, CAST(N'2023-12-06T15:08:10.8952383' AS DateTime2), CAST(N'2023-12-06T15:08:10.8952400' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (133, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 1, 0, CAST(N'2023-12-08T09:14:24.5986479' AS DateTime2), CAST(N'2023-12-08T09:26:36.8665362' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (134, N'REJECTED', 1, NULL, NULL, N'cần bổ sung dấu', 7, 2, 0, CAST(N'2023-12-08T09:14:24.6120087' AS DateTime2), CAST(N'2023-12-08T09:37:25.9222112' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (135, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 3, 0, CAST(N'2023-12-08T09:14:24.6144839' AS DateTime2), CAST(N'2023-12-08T09:26:36.8809825' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (136, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 4, 0, CAST(N'2023-12-08T09:14:24.6162838' AS DateTime2), CAST(N'2023-12-08T09:26:36.8831521' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (137, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 5, 0, CAST(N'2023-12-08T09:14:24.6179987' AS DateTime2), CAST(N'2023-12-08T09:26:36.8848928' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (138, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 6, 0, CAST(N'2023-12-08T09:14:24.6193892' AS DateTime2), CAST(N'2023-12-08T09:26:36.8859554' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (139, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 7, 0, CAST(N'2023-12-08T09:14:24.6208257' AS DateTime2), CAST(N'2023-12-08T09:26:36.8871125' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (140, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 8, 0, CAST(N'2023-12-08T09:14:24.6222695' AS DateTime2), CAST(N'2023-12-08T09:26:36.8884368' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (141, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 9, 0, CAST(N'2023-12-08T09:14:24.6237726' AS DateTime2), CAST(N'2023-12-08T09:26:36.8898015' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (142, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 10, 0, CAST(N'2023-12-08T09:14:24.6252309' AS DateTime2), CAST(N'2023-12-08T09:26:36.8909192' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (143, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 11, 0, CAST(N'2023-12-08T09:14:24.6267776' AS DateTime2), CAST(N'2023-12-08T09:26:36.8919743' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (144, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 12, 0, CAST(N'2023-12-08T09:14:24.6283422' AS DateTime2), CAST(N'2023-12-08T09:26:36.8931831' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (145, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 13, 0, CAST(N'2023-12-08T09:14:24.6299710' AS DateTime2), CAST(N'2023-12-08T09:26:36.8943155' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (146, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 14, 0, CAST(N'2023-12-08T09:14:24.6316089' AS DateTime2), CAST(N'2023-12-08T09:26:36.8957602' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (147, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 15, 0, CAST(N'2023-12-08T09:14:24.6332358' AS DateTime2), CAST(N'2023-12-08T09:26:36.8969467' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (148, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 16, 0, CAST(N'2023-12-08T09:14:24.6349029' AS DateTime2), CAST(N'2023-12-08T09:26:36.8980116' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (149, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 17, 0, CAST(N'2023-12-08T09:14:24.6367239' AS DateTime2), CAST(N'2023-12-08T09:26:36.8991809' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (150, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 18, 0, CAST(N'2023-12-08T09:14:24.6385521' AS DateTime2), CAST(N'2023-12-08T09:26:36.9003144' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (151, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 19, 0, CAST(N'2023-12-08T09:14:24.6402487' AS DateTime2), CAST(N'2023-12-08T09:26:36.9018321' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (152, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 20, 0, CAST(N'2023-12-08T09:14:24.6420644' AS DateTime2), CAST(N'2023-12-08T09:26:36.9036778' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (153, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 21, 0, CAST(N'2023-12-08T09:14:24.6440260' AS DateTime2), CAST(N'2023-12-08T09:26:36.9050371' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (154, N'VERIFIED', NULL, NULL, NULL, NULL, 7, 22, 0, CAST(N'2023-12-08T09:14:24.6460165' AS DateTime2), CAST(N'2023-12-08T09:26:36.9067647' AS DateTime2))
SET IDENTITY_INSERT [dbo].[VerificationCriteria] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationDocument] ON 

INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, NULL, N'Đề cương đồ án tốt nghiệp_Trần Minh Hoàng_1710A03.docx', N'docx', N'/File/54hd310e.5ae.docx', 183139, N'BY_COMPANY', 9, 1, CAST(N'2023-10-31T22:46:52.2114015' AS DateTime2), CAST(N'2023-10-31T22:47:44.5680613' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, NULL, N'Báo cáo đồ án - Trần Bá Phúc - 17A10010203 sua lai.docx', N'docx', N'/File/btszoglg.i0a.docx', 8194536, N'BY_COMPANY', 9, 0, CAST(N'2023-10-31T22:48:57.2014733' AS DateTime2), CAST(N'2023-10-31T22:48:57.2014770' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, NULL, N'Lâm Quốc Anh - Báo cáo đồ án.docx', N'docx', N'/File/bhtuv3ts.eqm.docx', 12043907, N'BY_COMPANY', 11, 0, CAST(N'2023-10-31T22:49:08.1435885' AS DateTime2), CAST(N'2023-10-31T22:49:08.1435907' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, NULL, N'BT4.docx', N'docx', N'/File/o2zzlid3.3v3.docx', 693083, N'BY_COMPANY', 31, 0, CAST(N'2023-11-21T00:32:35.2503312' AS DateTime2), CAST(N'2023-11-21T00:32:35.2503347' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, NULL, N'PTTKHT_Hoang_Full.docx', N'docx', N'/File/lac4sglc.fez.docx', 1941236, N'BY_COMPANY', 53, 0, CAST(N'2023-11-21T14:37:43.4049278' AS DateTime2), CAST(N'2023-11-21T14:37:43.4052579' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, NULL, N'BT4.docx', N'docx', N'/File/blktplco.ehj.docx', 693083, N'BY_COMPANY', 86, 0, CAST(N'2023-12-06T13:39:08.5879804' AS DateTime2), CAST(N'2023-12-06T13:39:08.5879831' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, NULL, N'2001_C23TMH_29796_8485.pdf', N'pdf', N'/File/kkxt3xyv.5kj.pdf', 122699, N'BY_COMPANY', 119, 1, CAST(N'2023-12-06T15:27:57.6297704' AS DateTime2), CAST(N'2023-12-06T15:28:02.8237479' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, NULL, N'2001_C23TMH_29796_8485.pdf', N'pdf', N'/File/35vdxip5.wj4.pdf', 122699, N'BY_COMPANY', 119, 0, CAST(N'2023-12-06T15:47:12.9797521' AS DateTime2), CAST(N'2023-12-06T15:47:12.9797538' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, NULL, N'2001_C23TMH_29796_8485.pdf', N'pdf', N'/File/sjfzptnb.dzq.pdf', 122699, N'BY_COMPANY', 121, 0, CAST(N'2023-12-06T15:52:26.8311424' AS DateTime2), CAST(N'2023-12-06T15:52:26.8311437' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (10, NULL, N'nghi-dinh-102-2020-he-thong-bao-dam-go-hop-phap-viet-nam (1).doc', N'doc', N'/File/zfmlpkws.czj.doc', 612352, N'BY_COMPANY', 134, 0, CAST(N'2023-12-08T09:16:00.4327524' AS DateTime2), CAST(N'2023-12-08T09:16:00.4327548' AS DateTime2))
SET IDENTITY_INSERT [dbo].[VerificationDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationProcess] ON 

INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (1, CAST(N'2023-11-15T22:51:52.1370549' AS DateTime2), CAST(N'2023-11-13T23:09:48.0189585' AS DateTime2), CAST(N'2023-11-14T21:56:29.6238880' AS DateTime2), CAST(N'2023-11-15T00:34:40.6331248' AS DateTime2), NULL, NULL, 0, 1, 1, 1, N'BY_CUSTOMER', N'FINISHED', 2, 2, 2, 0, CAST(N'2023-10-23T22:51:52.1374458' AS DateTime2), CAST(N'2023-11-15T00:34:40.6332413' AS DateTime2), 2, 3)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (2, CAST(N'2023-11-30T22:56:27.5633948' AS DateTime2), CAST(N'2023-12-06T10:40:06.0909312' AS DateTime2), CAST(N'2023-12-06T10:40:47.6803261' AS DateTime2), CAST(N'2023-12-06T11:11:19.9485825' AS DateTime2), NULL, NULL, 0, 1, 1, 1, N'BY_CUSTOMER', N'FINISHED', 1, 3, 3, 0, CAST(N'2023-11-20T22:56:27.5635140' AS DateTime2), CAST(N'2023-12-06T11:11:19.9494217' AS DateTime2), 2, 2)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (3, CAST(N'2023-12-11T11:10:59.7987426' AS DateTime2), CAST(N'2023-12-10T23:19:10.8133197' AS DateTime2), NULL, NULL, NULL, NULL, 0, 1, 0, 0, N'BY_CUSTOMER', N'SUBMITTED', NULL, 3, 4, 0, CAST(N'2023-11-21T11:10:59.7989122' AS DateTime2), CAST(N'2023-12-10T23:19:10.8145106' AS DateTime2), 1, 2)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (4, CAST(N'2023-12-20T02:36:46.3676567' AS DateTime2), CAST(N'2023-12-06T13:39:11.6763962' AS DateTime2), CAST(N'2023-12-10T02:45:31.0934924' AS DateTime2), NULL, NULL, NULL, 0, 1, 1, 0, N'BY_CUSTOMER', N'REVIEWED', NULL, 3, 5, 0, CAST(N'2023-12-06T12:37:52.6040424' AS DateTime2), CAST(N'2023-12-10T02:45:31.0934945' AS DateTime2), 2, 2)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (5, CAST(N'2023-12-16T14:01:38.9530529' AS DateTime2), CAST(N'2023-12-08T08:51:56.0790805' AS DateTime2), NULL, NULL, NULL, NULL, 0, 1, 0, 0, N'BY_CUSTOMER', N'SUBMITTED', NULL, NULL, 6, 0, CAST(N'2023-12-06T14:01:38.9532348' AS DateTime2), CAST(N'2023-12-08T08:51:56.0810304' AS DateTime2), 1, NULL)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (6, CAST(N'2023-12-16T15:08:10.8349117' AS DateTime2), CAST(N'2023-12-06T15:52:36.1888108' AS DateTime2), NULL, NULL, NULL, NULL, 0, 1, 0, 0, N'BY_CUSTOMER', N'SUBMITTED', NULL, NULL, 7, 0, CAST(N'2023-12-06T15:08:10.8350485' AS DateTime2), CAST(N'2023-12-06T15:52:36.1888132' AS DateTime2), 2, NULL)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount], [AssignedAgentReviewId]) VALUES (7, CAST(N'2023-12-18T09:14:24.5856944' AS DateTime2), CAST(N'2023-12-08T09:25:37.3919512' AS DateTime2), NULL, NULL, NULL, NULL, 0, 1, 0, 0, N'BY_CUSTOMER', N'IN_PROGRESS', NULL, NULL, 8, 0, CAST(N'2023-12-08T09:14:24.5858313' AS DateTime2), CAST(N'2023-12-08T09:37:30.6279979' AS DateTime2), 2, NULL)
SET IDENTITY_INSERT [dbo].[VerificationProcess] OFF
GO
SET IDENTITY_INSERT [dbo].[ViolationReport] ON 

INSERT [dbo].[ViolationReport] ([Id], [Description], [Status], [ApprovedAt], [CompanyId], [ReportAgentId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (19, N'sai 3 lần phá rừng', N'APPROVED', CAST(N'2023-12-08T03:25:37.7114450' AS DateTime2), 4, 2, 0, CAST(N'2023-12-08T03:24:46.4948157' AS DateTime2), CAST(N'2023-12-08T03:25:37.7123726' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ViolationReport] OFF
GO
SET IDENTITY_INSERT [dbo].[ViolationReportDocument] ON 

INSERT [dbo].[ViolationReportDocument] ([Id], [DocumentType], [DocumentUrl], [DocumentName], [DocumentSize], [ViolationReportId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (31, N'doc', N'/File/110qb2ah.wqp.doc', N'nghi-dinh-102-2020-he-thong-bao-dam-go-hop-phap-viet-nam (1).doc', 612352, 19, 0, CAST(N'2023-12-08T03:24:46.5047927' AS DateTime2), CAST(N'2023-12-08T03:24:46.5047937' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ViolationReportDocument] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 12, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-08', 4, CAST(N'2024-01-08T01:54:46.870' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-09', 2, CAST(N'2024-01-09T04:36:08.107' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-10', 6, CAST(N'2024-01-10T17:17:26.027' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-10-02', 2, CAST(N'2023-12-11T02:47:26.087' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-10-16', 2, CAST(N'2023-12-11T16:19:11.027' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2023-12-10-17', 2, CAST(N'2023-12-11T17:17:26.027' AS DateTime))
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'CreatedAt', N'1702000469018', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'Job', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationDeadline"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'LastExecution', N'1702225150426', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'LastJobId', N'10', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'NextExecution', N'1702252800000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineJobId', N'V', N'2', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'CreatedAt', N'1702227781457', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'Job', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationAgentDeadline"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'LastExecution', N'1702228619610', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'LastJobId', N'12', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'NextExecution', N'1702252800000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:deadlineReviewJobId', N'V', N'2', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'CreatedAt', N'1702000476232', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'Job', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckGenerateVerification"}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'LastExecution', N'1702176444934', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'LastJobId', N'8', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'NextExecution', N'1702252800000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generateJobId', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 23, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationDeadline"}', N'[]', CAST(N'2023-12-10T02:47:25.233' AS DateTime), CAST(N'2023-12-11T02:47:26.003' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (8, 24, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckGenerateVerification"}', N'[]', CAST(N'2023-12-10T02:47:25.553' AS DateTime), CAST(N'2023-12-11T02:47:26.090' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (9, 27, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationDeadline"}', N'[]', CAST(N'2023-12-10T16:16:32.377' AS DateTime), CAST(N'2023-12-11T16:16:46.217' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10, 30, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationDeadline"}', N'[]', CAST(N'2023-12-10T16:19:10.440' AS DateTime), CAST(N'2023-12-11T16:19:11.033' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (11, 33, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationAgentDeadline"}', N'[]', CAST(N'2023-12-10T17:03:20.040' AS DateTime), CAST(N'2023-12-11T17:03:36.990' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (12, 36, N'Succeeded', N'{"t":"EcisApi.Services.JobService, EcisApi","m":"CheckVerificationAgentDeadline"}', N'[]', CAST(N'2023-12-10T17:16:59.620' AS DateTime), CAST(N'2023-12-11T17:17:26.030' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'RecurringJobId', N'"deadlineJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'Time', N'1702176444')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'RecurringJobId', N'"generateJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (8, N'Time', N'1702176444')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'RecurringJobId', N'"deadlineJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (9, N'Time', N'1702224992')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'RecurringJobId', N'"deadlineJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10, N'Time', N'1702225150')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'RecurringJobId', N'"deadlineReviewJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (11, N'Time', N'1702227800')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'RecurringJobId', N'"deadlineReviewJobId"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (12, N'Time', N'1702228619')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-h3ukcmu:3856:f886b2cf-1c94-4a19-bd13-2b1a4f29d0d4', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2023-12-10T17:16:47.6560107Z"}', CAST(N'2023-12-10T17:25:52.767' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1702252800, N'deadlineJobId', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1702252800, N'deadlineReviewJobId', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1702252800, N'generateJobId', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (19, 7, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-12-10T02:47:25.300' AS DateTime), N'{"EnqueuedAt":"1702176445284","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (21, 7, N'Processing', NULL, CAST(N'2023-12-10T02:47:25.837' AS DateTime), N'{"StartedAt":"1702176445542","ServerId":"desktop-h3ukcmu:4088:e4ba0b2d-4de5-425e-85bf-d16d237f42c3","WorkerId":"d3fe3801-2c4f-4975-9311-7ef2ba057197"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (23, 7, N'Succeeded', NULL, CAST(N'2023-12-10T02:47:26.000' AS DateTime), N'{"SucceededAt":"1702176445985","PerformanceDuration":"113","Latency":"639"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (20, 8, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2023-12-10T02:47:25.643' AS DateTime), N'{"EnqueuedAt":"1702176445597","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (22, 8, N'Processing', NULL, CAST(N'2023-12-10T02:47:25.837' AS DateTime), N'{"StartedAt":"1702176445707","ServerId":"desktop-h3ukcmu:4088:e4ba0b2d-4de5-425e-85bf-d16d237f42c3","WorkerId":"7cadb4a0-e36a-4c2e-8044-0bdbf7468597"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (24, 8, N'Succeeded', NULL, CAST(N'2023-12-10T02:47:26.087' AS DateTime), N'{"SucceededAt":"1702176446080","PerformanceDuration":"163","Latency":"363"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (25, 9, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-12-10T16:16:32.383' AS DateTime), N'{"EnqueuedAt":"1702224992382","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (26, 9, N'Processing', NULL, CAST(N'2023-12-10T16:16:32.400' AS DateTime), N'{"StartedAt":"1702224992397","ServerId":"desktop-h3ukcmu:4088:e4ba0b2d-4de5-425e-85bf-d16d237f42c3","WorkerId":"ec13b843-cbdf-4cdc-822f-f0be523249f4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (27, 9, N'Succeeded', NULL, CAST(N'2023-12-10T16:16:46.217' AS DateTime), N'{"SucceededAt":"1702225006215","PerformanceDuration":"13813","Latency":"24"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (28, 10, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-12-10T16:19:10.470' AS DateTime), N'{"EnqueuedAt":"1702225150464","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (29, 10, N'Processing', NULL, CAST(N'2023-12-10T16:19:10.620' AS DateTime), N'{"StartedAt":"1702225150539","ServerId":"desktop-h3ukcmu:21984:7c730973-c7c4-4e3c-9e29-7b612bf522c1","WorkerId":"0c4cfae4-c489-4530-a676-383610c33e9a"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (30, 10, N'Succeeded', NULL, CAST(N'2023-12-10T16:19:11.030' AS DateTime), N'{"SucceededAt":"1702225151026","PerformanceDuration":"401","Latency":"184"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (31, 11, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-12-10T17:03:20.053' AS DateTime), N'{"EnqueuedAt":"1702227800047","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (32, 11, N'Processing', NULL, CAST(N'2023-12-10T17:03:20.147' AS DateTime), N'{"StartedAt":"1702227800068","ServerId":"desktop-h3ukcmu:18484:3af41690-c569-4bf8-be74-29b99c8d25c2","WorkerId":"4336618b-2e2c-4b8a-9a6e-c5b3c8ee0696"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (33, 11, N'Succeeded', NULL, CAST(N'2023-12-10T17:03:36.990' AS DateTime), N'{"SucceededAt":"1702227816984","PerformanceDuration":"16833","Latency":"110"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 12, N'Enqueued', N'Triggered using recurring job manager', CAST(N'2023-12-10T17:16:59.643' AS DateTime), N'{"EnqueuedAt":"1702228619636","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (35, 12, N'Processing', NULL, CAST(N'2023-12-10T17:16:59.797' AS DateTime), N'{"StartedAt":"1702228619710","ServerId":"desktop-h3ukcmu:3856:f886b2cf-1c94-4a19-bd13-2b1a4f29d0d4","WorkerId":"9a5518d4-9889-44d8-8b16-5782f2f094a1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (36, 12, N'Succeeded', NULL, CAST(N'2023-12-10T17:17:26.030' AS DateTime), N'{"SucceededAt":"1702228646022","PerformanceDuration":"26222","Latency":"180"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account_Email]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account_Email] ON [dbo].[Account]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_RoleId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account_RoleId] ON [dbo].[Account]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Agent_AccountId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Agent_AccountId] ON [dbo].[Agent]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AgentAssignment_AgentId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_AgentAssignment_AgentId] ON [dbo].[AgentAssignment]
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AgentAssignment_ProvinceId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_AgentAssignment_ProvinceId] ON [dbo].[AgentAssignment]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Company_AccountId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Company_AccountId] ON [dbo].[Company]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Company_CompanyCode]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Company_CompanyCode] ON [dbo].[Company]
(
	[CompanyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Company_CompanyTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Company_CompanyTypeId] ON [dbo].[Company]
(
	[CompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Company_ProvinceId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Company_ProvinceId] ON [dbo].[Company]
(
	[ProvinceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_AssignedAgentId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_AssignedAgentId] ON [dbo].[CompanyReport]
(
	[AssignedAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_CompanyReportTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_CompanyReportTypeId] ON [dbo].[CompanyReport]
(
	[CompanyReportTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_CreatorCompanyId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_CreatorCompanyId] ON [dbo].[CompanyReport]
(
	[CreatorCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_CompanyReport_Status_IsDeleted]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_Status_IsDeleted] ON [dbo].[CompanyReport]
(
	[Status] ASC,
	[IsDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_TargetedCompanyId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_TargetedCompanyId] ON [dbo].[CompanyReport]
(
	[TargetedCompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReport_VerificationProcessId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReport_VerificationProcessId] ON [dbo].[CompanyReport]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyReportDocument_CompanyReportId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyReportDocument_CompanyReportId] ON [dbo].[CompanyReportDocument]
(
	[CompanyReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_CompanyId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_CompanyId] ON [dbo].[CompanyTypeModification]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_CompanyReportId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_CompanyReportId] ON [dbo].[CompanyTypeModification]
(
	[CompanyReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_PreviousCompanyTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_PreviousCompanyTypeId] ON [dbo].[CompanyTypeModification]
(
	[PreviousCompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_UpdatedCompanyTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_UpdatedCompanyTypeId] ON [dbo].[CompanyTypeModification]
(
	[UpdatedCompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_VerificationProcessId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_VerificationProcessId] ON [dbo].[CompanyTypeModification]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CompanyTypeModification_ViolationReportId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CompanyTypeModification_ViolationReportId] ON [dbo].[CompanyTypeModification]
(
	[ViolationReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Criteria_CriteriaTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_Criteria_CriteriaTypeId] ON [dbo].[Criteria]
(
	[CriteriaTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CriteriaDetail_CriteriaId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_CriteriaDetail_CriteriaId] ON [dbo].[CriteriaDetail]
(
	[CriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DocumentReview_VerificationDocumentId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_DocumentReview_VerificationDocumentId] ON [dbo].[DocumentReview]
(
	[VerificationDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ThirdParty_AccountId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ThirdParty_AccountId] ON [dbo].[ThirdParty]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationCriteria_CriteriaDetailId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationCriteria_CriteriaDetailId] ON [dbo].[VerificationCriteria]
(
	[CriteriaDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationCriteria_VerificationProcessId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationCriteria_VerificationProcessId] ON [dbo].[VerificationCriteria]
(
	[VerificationProcessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationDocument_VerificationCriteriaId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationDocument_VerificationCriteriaId] ON [dbo].[VerificationDocument]
(
	[VerificationCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_AssignedAgentId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_AssignedAgentId] ON [dbo].[VerificationProcess]
(
	[AssignedAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_AssignedAgentReviewId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_AssignedAgentReviewId] ON [dbo].[VerificationProcess]
(
	[AssignedAgentReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_CompanyId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_CompanyId] ON [dbo].[VerificationProcess]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_VerificationProcess_CompanyTypeId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_VerificationProcess_CompanyTypeId] ON [dbo].[VerificationProcess]
(
	[CompanyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReport_CompanyId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReport_CompanyId] ON [dbo].[ViolationReport]
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReport_ReportAgentId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReport_ReportAgentId] ON [dbo].[ViolationReport]
(
	[ReportAgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ViolationReportDocument_ViolationReportId]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_ViolationReportDocument_ViolationReportId] ON [dbo].[ViolationReportDocument]
(
	[ViolationReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_CreatedAt]    Script Date: 12/11/2023 7:06:03 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_CreatedAt] ON [HangFire].[State]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VerificationProcess] ADD  DEFAULT ((0)) FOR [SubmittedCount]
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
ALTER TABLE [dbo].[AgentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_AgentAssignment_Agent_AgentId] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgentAssignment] CHECK CONSTRAINT [FK_AgentAssignment_Agent_AgentId]
GO
ALTER TABLE [dbo].[AgentAssignment]  WITH CHECK ADD  CONSTRAINT [FK_AgentAssignment_Province_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AgentAssignment] CHECK CONSTRAINT [FK_AgentAssignment_Province_ProvinceId]
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
ALTER TABLE [dbo].[Company]  WITH CHECK ADD  CONSTRAINT [FK_Company_Province_ProvinceId] FOREIGN KEY([ProvinceId])
REFERENCES [dbo].[Province] ([Id])
GO
ALTER TABLE [dbo].[Company] CHECK CONSTRAINT [FK_Company_Province_ProvinceId]
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
ALTER TABLE [dbo].[ThirdParty]  WITH CHECK ADD  CONSTRAINT [FK_ThirdParty_Account_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ThirdParty] CHECK CONSTRAINT [FK_ThirdParty_Account_AccountId]
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
ALTER TABLE [dbo].[VerificationProcess]  WITH CHECK ADD  CONSTRAINT [FK_VerificationProcess_Agent_AssignedAgentReviewId] FOREIGN KEY([AssignedAgentReviewId])
REFERENCES [dbo].[Agent] ([Id])
GO
ALTER TABLE [dbo].[VerificationProcess] CHECK CONSTRAINT [FK_VerificationProcess_Agent_AssignedAgentReviewId]
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
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [ecis_db] SET  READ_WRITE 
GO
