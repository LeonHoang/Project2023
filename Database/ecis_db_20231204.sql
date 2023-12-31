USE [ecis_db]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Account]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Agent]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[AgentAssignment]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Company]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CompanyReport]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CompanyReportDocument]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CompanyReportTypes]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CompanyType]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CompanyTypeModification]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Criteria]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CriteriaDetail]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[CriteriaType]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[DocumentReview]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Province]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[SystemConfiguration]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[ThirdParty]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[VerificationCriteria]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[VerificationDocument]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[VerificationProcess]    Script Date: 12/4/2023 6:43:50 PM ******/
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
 CONSTRAINT [PK_VerificationProcess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViolationReport]    Script Date: 12/4/2023 6:43:50 PM ******/
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
/****** Object:  Table [dbo].[ViolationReportDocument]    Script Date: 12/4/2023 6:43:50 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009160216_Refesh', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009160449_Init', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231017043638_newdb', N'5.0.7')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231112150252_Remove_Confirm_Service', N'5.0.7')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'admin@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 1, 0, CAST(N'2023-10-09T23:05:53.8879097' AS DateTime2), CAST(N'2023-10-09T23:05:53.8879104' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, N'achau@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-10-23T22:51:49.4654422' AS DateTime2), CAST(N'2023-10-23T22:51:49.4654452' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (6, N'klt1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-10-31T22:57:39.3376804' AS DateTime2), CAST(N'2023-10-31T22:57:39.3376824' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (7, N'rung1@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-11-20T22:56:24.4566799' AS DateTime2), CAST(N'2023-11-20T22:56:24.4567344' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (8, N'rung2@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 3, 0, CAST(N'2023-11-21T11:10:56.8126742' AS DateTime2), CAST(N'2023-11-21T11:10:56.8127247' AS DateTime2))
INSERT [dbo].[Account] ([Id], [Email], [Password], [IsVerified], [RoleId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (9, N'klt2@gmail.com', N'7ce0359f12857f2a90c7de465f40a95f01cb5da9', 1, 2, 0, CAST(N'2023-11-21T13:15:07.3440474' AS DateTime2), CAST(N'2023-11-21T13:15:07.3440486' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Nguyen', N'An', N'0988281324', CAST(N'1999-07-07T00:00:00.0000000' AS DateTime2), N'male', N'Nguyen Hong, Lang Ha', 6, 0, CAST(N'2023-10-31T22:57:39.3613661' AS DateTime2), CAST(N'2023-10-31T22:57:39.3613685' AS DateTime2))
INSERT [dbo].[Agent] ([Id], [FirstName], [LastName], [PhoneNumber], [DateOfBirth], [Gender], [Address], [AccountId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Nguyễn', N'Xuân Bình', N'092224458322', CAST(N'1997-04-02T00:00:00.0000000' AS DateTime2), NULL, N'Hồ Chí Minh', 9, 0, CAST(N'2023-11-21T13:15:07.3527082' AS DateTime2), CAST(N'2023-11-21T13:15:07.3527093' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentAssignment] ON 

INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, 2, 5, 0, CAST(N'2023-10-31T22:57:39.4002979' AS DateTime2), CAST(N'2023-10-31T22:57:39.4002996' AS DateTime2))
INSERT [dbo].[AgentAssignment] ([Id], [AgentId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, 3, 5, 0, CAST(N'2023-11-21T13:15:07.3654347' AS DateTime2), CAST(N'2023-11-21T13:15:07.3654367' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AgentAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Công ty TNHH Gỗ Á Châu', NULL, N'779999', NULL, 5, 2, 5, 0, CAST(N'2023-10-23T22:51:49.5787309' AS DateTime2), CAST(N'2023-11-15T00:34:40.7543891' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, N'Công ty TNHH Gỗ Đức Thành', N'', N'11000', NULL, 7, NULL, 5, 0, CAST(N'2023-11-20T22:56:24.6188751' AS DateTime2), CAST(N'2023-11-20T22:56:24.6188773' AS DateTime2))
INSERT [dbo].[Company] ([Id], [CompanyNameVI], [CompanyNameEN], [CompanyCode], [LogoUrl], [AccountId], [CompanyTypeId], [ProvinceId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, N'Công ty TNHH Đức Long Gia Lai', N'', N'123456', NULL, 8, NULL, 5, 0, CAST(N'2023-11-21T11:10:56.9376040' AS DateTime2), CAST(N'2023-11-21T11:10:56.9376066' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyType] ON 

INSERT [dbo].[CompanyType] ([Id], [TypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'Loại 1', N'Doanh nghiệp loại 1', 0, CAST(N'2023-10-09T23:05:53.9516894' AS DateTime2), CAST(N'2023-10-09T23:05:53.9516911' AS DateTime2))
INSERT [dbo].[CompanyType] ([Id], [TypeName], [Description], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, N'Loại 2', N'Doanh nghiệp loại 2', 0, CAST(N'2023-10-09T23:05:53.9351129' AS DateTime2), CAST(N'2023-10-09T23:05:53.9351143' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CompanyType] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyTypeModification] ON 

INSERT [dbo].[CompanyTypeModification] ([Id], [Modification], [IsAnnounced], [AnnouncedAt], [CompanyId], [PreviousCompanyTypeId], [UpdatedCompanyTypeId], [VerificationProcessId], [ViolationReportId], [CompanyReportId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, N'VERIFICATION', 0, NULL, 2, NULL, 2, 1, NULL, NULL, 0, CAST(N'2023-11-15T00:34:40.6666825' AS DateTime2), CAST(N'2023-11-15T00:34:40.6667403' AS DateTime2))
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
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (23, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 1, 0, CAST(N'2023-11-20T22:56:27.5760470' AS DateTime2), CAST(N'2023-11-21T13:15:31.6023730' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (24, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 2, 0, CAST(N'2023-11-20T22:56:27.5878646' AS DateTime2), CAST(N'2023-11-21T13:15:31.6225845' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (25, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 3, 0, CAST(N'2023-11-20T22:56:27.5899380' AS DateTime2), CAST(N'2023-11-21T13:15:31.6285174' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (26, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 4, 0, CAST(N'2023-11-20T22:56:27.5916499' AS DateTime2), CAST(N'2023-11-21T13:15:31.6353513' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (27, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 5, 0, CAST(N'2023-11-20T22:56:27.5933353' AS DateTime2), CAST(N'2023-11-21T13:15:31.6423766' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (28, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 6, 0, CAST(N'2023-11-20T22:56:27.5948965' AS DateTime2), CAST(N'2023-11-21T13:15:31.6486370' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (29, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 7, 0, CAST(N'2023-11-20T22:56:27.5965043' AS DateTime2), CAST(N'2023-11-21T13:15:31.6547857' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (30, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 8, 0, CAST(N'2023-11-20T22:56:27.5981339' AS DateTime2), CAST(N'2023-11-21T13:15:31.6611202' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (31, N'VERIFIED', 1, NULL, NULL, NULL, 2, 9, 0, CAST(N'2023-11-20T22:56:27.5995258' AS DateTime2), CAST(N'2023-11-21T13:15:31.6670800' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (32, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 10, 0, CAST(N'2023-11-20T22:56:27.6011137' AS DateTime2), CAST(N'2023-11-21T13:15:31.6809755' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (33, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 11, 0, CAST(N'2023-11-20T22:56:27.6024965' AS DateTime2), CAST(N'2023-11-21T13:15:31.6868333' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (34, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 12, 0, CAST(N'2023-11-20T22:56:27.6041989' AS DateTime2), CAST(N'2023-11-21T13:15:31.6922364' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (35, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 13, 0, CAST(N'2023-11-20T22:56:27.6059693' AS DateTime2), CAST(N'2023-11-21T13:15:31.6974372' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (36, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 14, 0, CAST(N'2023-11-20T22:56:27.6075917' AS DateTime2), CAST(N'2023-11-21T13:15:31.7029985' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (37, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 15, 0, CAST(N'2023-11-20T22:56:27.6089651' AS DateTime2), CAST(N'2023-11-21T13:15:31.7083089' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (38, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 16, 0, CAST(N'2023-11-20T22:56:27.6104759' AS DateTime2), CAST(N'2023-11-21T13:15:31.7138499' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (39, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 17, 0, CAST(N'2023-11-20T22:56:27.6120645' AS DateTime2), CAST(N'2023-11-21T13:15:31.7193281' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (40, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 18, 0, CAST(N'2023-11-20T22:56:27.6135254' AS DateTime2), CAST(N'2023-11-21T13:15:31.7245355' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (41, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 19, 0, CAST(N'2023-11-20T22:56:27.6152779' AS DateTime2), CAST(N'2023-11-21T13:15:31.7300478' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (42, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 20, 0, CAST(N'2023-11-20T22:56:27.6166189' AS DateTime2), CAST(N'2023-11-21T13:15:31.7364474' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (43, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 21, 0, CAST(N'2023-11-20T22:56:27.6180573' AS DateTime2), CAST(N'2023-11-21T13:15:31.7420185' AS DateTime2))
INSERT [dbo].[VerificationCriteria] ([Id], [ApprovedStatus], [CompanyRate], [CompanyOpinion], [ReviewResult], [ReviewComment], [VerificationProcessId], [CriteriaDetailId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (44, N'VERIFIED', NULL, NULL, NULL, NULL, 2, 22, 0, CAST(N'2023-11-20T22:56:27.6198398' AS DateTime2), CAST(N'2023-11-21T13:15:31.7472253' AS DateTime2))
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
SET IDENTITY_INSERT [dbo].[VerificationCriteria] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationDocument] ON 

INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (1, NULL, N'Đề cương đồ án tốt nghiệp_Trần Minh Hoàng_1710A03.docx', N'docx', N'/File/54hd310e.5ae.docx', 183139, N'BY_COMPANY', 9, 1, CAST(N'2023-10-31T22:46:52.2114015' AS DateTime2), CAST(N'2023-10-31T22:47:44.5680613' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (2, NULL, N'Báo cáo đồ án - Trần Bá Phúc - 17A10010203 sua lai.docx', N'docx', N'/File/btszoglg.i0a.docx', 8194536, N'BY_COMPANY', 9, 0, CAST(N'2023-10-31T22:48:57.2014733' AS DateTime2), CAST(N'2023-10-31T22:48:57.2014770' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (3, NULL, N'Lâm Quốc Anh - Báo cáo đồ án.docx', N'docx', N'/File/bhtuv3ts.eqm.docx', 12043907, N'BY_COMPANY', 11, 0, CAST(N'2023-10-31T22:49:08.1435885' AS DateTime2), CAST(N'2023-10-31T22:49:08.1435907' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (4, NULL, N'BT4.docx', N'docx', N'/File/o2zzlid3.3v3.docx', 693083, N'BY_COMPANY', 31, 0, CAST(N'2023-11-21T00:32:35.2503312' AS DateTime2), CAST(N'2023-11-21T00:32:35.2503347' AS DateTime2))
INSERT [dbo].[VerificationDocument] ([Id], [Content], [DocumentName], [ResourceType], [ResourceUrl], [ResourceSize], [UploaderType], [VerificationCriteriaId], [IsDeleted], [CreatedAt], [UpdatedAt]) VALUES (5, NULL, N'PTTKHT_Hoang_Full.docx', N'docx', N'/File/lac4sglc.fez.docx', 1941236, N'BY_COMPANY', 53, 0, CAST(N'2023-11-21T14:37:43.4049278' AS DateTime2), CAST(N'2023-11-21T14:37:43.4052579' AS DateTime2))
SET IDENTITY_INSERT [dbo].[VerificationDocument] OFF
GO
SET IDENTITY_INSERT [dbo].[VerificationProcess] ON 

INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount]) VALUES (1, CAST(N'2023-11-15T22:51:52.1370549' AS DateTime2), CAST(N'2023-11-13T23:09:48.0189585' AS DateTime2), CAST(N'2023-11-14T21:56:29.6238880' AS DateTime2), CAST(N'2023-11-15T00:34:40.6331248' AS DateTime2), NULL, NULL, 0, 1, 1, 1, N'BY_CUSTOMER', N'FINISHED', 2, 2, 2, 0, CAST(N'2023-10-23T22:51:52.1374458' AS DateTime2), CAST(N'2023-11-15T00:34:40.6332413' AS DateTime2), 2)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount]) VALUES (2, CAST(N'2023-11-30T22:56:27.5633948' AS DateTime2), CAST(N'2023-11-21T11:14:40.1636407' AS DateTime2), NULL, NULL, NULL, NULL, 0, 1, 0, 0, N'BY_CUSTOMER', N'IN_PROGRESS', NULL, NULL, 3, 0, CAST(N'2023-11-20T22:56:27.5635140' AS DateTime2), CAST(N'2023-11-21T14:40:24.7016150' AS DateTime2), 1)
INSERT [dbo].[VerificationProcess] ([Id], [SubmitDeadline], [SubmittedAt], [ReviewedAt], [FinishedAt], [ValidFrom], [ValidTo], [IsOpenedByAgent], [IsSubmitted], [IsReviewed], [IsFinished], [SubmitMethod], [Status], [CompanyTypeId], [AssignedAgentId], [CompanyId], [IsDeleted], [CreatedAt], [UpdatedAt], [SubmittedCount]) VALUES (3, CAST(N'2023-12-01T11:10:59.7987426' AS DateTime2), NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, N'BY_CUSTOMER', N'IN_PROGRESS', NULL, NULL, 4, 0, CAST(N'2023-11-21T11:10:59.7989122' AS DateTime2), CAST(N'2023-11-21T11:10:59.7989128' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[VerificationProcess] OFF
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
