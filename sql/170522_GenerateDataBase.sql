USE [master]
GO
/****** Object:  Database [Swastika]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE DATABASE [Swastika]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Swastika', FILENAME = N'C:\Users\smile\Swastika.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Swastika_log', FILENAME = N'C:\Users\smile\Swastika_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Swastika] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Swastika].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Swastika] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Swastika] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Swastika] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Swastika] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Swastika] SET ARITHABORT OFF 
GO
ALTER DATABASE [Swastika] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Swastika] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Swastika] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Swastika] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Swastika] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Swastika] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Swastika] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Swastika] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Swastika] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Swastika] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Swastika] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Swastika] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Swastika] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Swastika] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Swastika] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Swastika] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Swastika] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Swastika] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Swastika] SET  MULTI_USER 
GO
ALTER DATABASE [Swastika] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Swastika] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Swastika] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Swastika] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Swastika] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Swastika] SET QUERY_STORE = OFF
GO
USE [Swastika]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Swastika]
GO
/****** Object:  Schema [Core]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE SCHEMA [Core]
GO
/****** Object:  Schema [Ext]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE SCHEMA [Ext]
GO
/****** Object:  Schema [User]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE SCHEMA [User]
GO
/****** Object:  Table [Core].[Category]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Category](
	[CategoryId] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[CategoryGroupId] [int] NULL,
	[ParentCategoryId] [uniqueidentifier] NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedByUserId] [nvarchar](450) NULL,
	[Icon] [text] NULL,
	[CreatedUtc] [datetime] NOT NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[CommonStatusId] [tinyint] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[CategoryCloud]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[CategoryCloud](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[ObjId] [uniqueidentifier] NOT NULL,
	[ExtId] [int] NULL,
 CONSTRAINT [PK_CategoryNetworks] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC,
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[CategoryGroup]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[CategoryGroup](
	[CategoryGroupId] [int] NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_CategoryGroups] PRIMARY KEY CLUSTERED 
(
	[CategoryGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[Extension]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Extension](
	[ExtId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Title] [nvarchar](250) NULL,
	[Slug] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [text] NULL,
	[CreatedUtc] [datetime] NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[CreatedByUserId] [nvarchar](450) NULL,
	[CommonStatusId] [tinyint] NULL,
 CONSTRAINT [PK_Extensions] PRIMARY KEY CLUSTERED 
(
	[ExtId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[ExtensionModule]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[ExtensionModule](
	[ModuleId] [int] NOT NULL,
	[ExtId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [ntext] NULL,
	[Icon] [text] NULL,
 CONSTRAINT [PK_Extension.Modules] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[Nav]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Nav](
	[NavId] [uniqueidentifier] NOT NULL,
	[ParentNavId] [uniqueidentifier] NULL,
	[ExtId] [int] NULL,
	[PositionId] [tinyint] NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [text] NULL,
	[ActionTypeId] [tinyint] NULL,
	[ActionAtributeId] [tinyint] NULL,
	[StatusId] [tinyint] NULL,
 CONSTRAINT [PK_Admin.Navigation] PRIMARY KEY CLUSTERED 
(
	[NavId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[NavActionType]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NavActionType](
	[TypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_NavTypes] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[NavPosition]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NavPosition](
	[PositionId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](450) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_NavigationPositions] PRIMARY KEY CLUSTERED 
(
	[PositionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[NavRole]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NavRole](
	[Id] [uniqueidentifier] NOT NULL,
	[NavId] [uniqueidentifier] NOT NULL,
	[UserRoleId] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_NavigationRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[NavStatus]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[NavStatus](
	[StatusId] [tinyint] NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_NavStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[Setting]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Setting](
	[SettingId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [text] NULL,
 CONSTRAINT [PK_Extension.Settings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[SettingValue]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[SettingValue](
	[SettingValueId] [uniqueidentifier] NOT NULL,
	[SettingId] [int] NOT NULL,
	[SettingValue] [ntext] NOT NULL,
 CONSTRAINT [PK_Extension.SettingValues] PRIMARY KEY CLUSTERED 
(
	[SettingValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[Tag]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Tag](
	[TagId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedByUserId] [nvarchar](450) NULL,
	[Icon] [text] NULL,
	[CreatedUtc] [datetime] NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[CommonStatusId] [tinyint] NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Core].[TagCloud]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[TagCloud](
	[TagId] [uniqueidentifier] NOT NULL,
	[ObjId] [uniqueidentifier] NOT NULL,
	[ExtensionId] [int] NULL,
 CONSTRAINT [PK_Tag.Networks] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC,
	[ObjId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[Term]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[Term](
	[TermId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Group] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Terms_1] PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[TermCloud]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[TermCloud](
	[TaxonomyId] [uniqueidentifier] NOT NULL,
	[ObjId] [uniqueidentifier] NOT NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_Term.Relationships] PRIMARY KEY CLUSTERED 
(
	[ObjId] ASC,
	[TaxonomyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Core].[TermTaxonomie]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Core].[TermTaxonomie](
	[TaxonomyId] [uniqueidentifier] NOT NULL,
	[TermId] [uniqueidentifier] NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [varchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [text] NULL,
 CONSTRAINT [PK_Term.Taxonomy] PRIMARY KEY CLUSTERED 
(
	[TaxonomyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/22/2017 1:35:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/22/2017 1:35:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/22/2017 1:35:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/22/2017 1:35:03 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [uniqueidentifier] NOT NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StoredEvent]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoredEvent](
	[Id] [uniqueidentifier] NOT NULL,
	[AggregateId] [uniqueidentifier] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[Action] [varchar](100) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[User] [nvarchar](max) NULL,
 CONSTRAINT [PK_StoredEvent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Ext].[Blog]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ext].[Blog](
	[BlogId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](250) NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NULL,
	[Description] [ntext] NULL,
	[CreatedUtc] [datetime] NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[CreatedByUserId] [nvarchar](450) NOT NULL,
	[CommonStatusId] [tinyint] NULL,
 CONSTRAINT [PK_Blogs_1] PRIMARY KEY CLUSTERED 
(
	[BlogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Ext].[BlogPost]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ext].[BlogPost](
	[PostId] [uniqueidentifier] NOT NULL,
	[BlogId] [uniqueidentifier] NOT NULL,
	[Name] [varchar](500) NULL,
	[Title] [nvarchar](500) NULL,
	[Slug] [nvarchar](500) NULL,
	[Excerpt] [nvarchar](1000) NULL,
	[MetaTitle] [nvarchar](200) NULL,
	[MetaDescription] [nvarchar](200) NULL,
	[Content] [ntext] NOT NULL,
	[CreatedByUserId] [nvarchar](450) NOT NULL,
	[CreatedUtc] [datetime] NOT NULL,
	[ModifiedUtc] [datetime] NULL,
	[PublishedUtc] [datetime] NULL,
	[StatusId] [tinyint] NULL,
 CONSTRAINT [PK_ExtBlog.Posts] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Ext].[BlogPostStatus]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ext].[BlogPostStatus](
	[StatusId] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Blog.PostStatus] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Ext].[BlogSetting]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ext].[BlogSetting](
	[SettingId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[SvgIcon] [text] NULL,
 CONSTRAINT [PK_Blog.Setting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Ext].[BlogSettingValue]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ext].[BlogSettingValue](
	[SettingValueId] [uniqueidentifier] NOT NULL,
	[SettingId] [int] NOT NULL,
	[SettingValues] [ntext] NOT NULL,
 CONSTRAINT [PK_Blog.SettingValues] PRIMARY KEY CLUSTERED 
(
	[SettingValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [User].[Setting]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[Setting](
	[SettingId] [int] NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[Icon] [text] NULL,
 CONSTRAINT [PK_User.Settings] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [User].[SettingValue]    Script Date: 5/22/2017 1:35:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User].[SettingValue](
	[SettingValueId] [uniqueidentifier] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[SettingId] [int] NOT NULL,
	[SettingValues] [text] NOT NULL,
 CONSTRAINT [PK_User.SettingValues] PRIMARY KEY CLUSTERED 
(
	[SettingValueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [Core].[Extension] ON 

INSERT [Core].[Extension] ([ExtId], [Name], [Title], [Slug], [Description], [Icon], [CreatedUtc], [ModifiedUtc], [PublishedUtc], [CreatedByUserId], [CommonStatusId]) VALUES (1, N'Admin', N'Admin', N'admin', N'Swastika I/O main admin dashboard extension', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [Core].[Extension] ([ExtId], [Name], [Title], [Slug], [Description], [Icon], [CreatedUtc], [ModifiedUtc], [PublishedUtc], [CreatedByUserId], [CommonStatusId]) VALUES (2, N'Blog', N'Blog', N'blog', N'Blog extension', N'ReadingList', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [Core].[Extension] OFF
SET IDENTITY_INSERT [Core].[NavActionType] ON 

INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (1, N'leftnav-open-small-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (2, N'leftnav-open-medium-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (3, N'leftnav-open-large-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (4, N'leftnav-open-half-window', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (5, N'leftnav-open-full-window', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (6, N'topnav-open-small-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (7, N'topnav-open-medium-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (8, N'topnav-open-large-sub-menu', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (9, N'open-small-dialog', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (10, N'open-medium-dialog', NULL, NULL)
INSERT [Core].[NavActionType] ([TypeId], [Name], [Title], [Description]) VALUES (11, N'open-large-dialog', NULL, NULL)
SET IDENTITY_INSERT [Core].[NavActionType] OFF
SET IDENTITY_INSERT [Core].[NavPosition] ON 

INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (1, N'top-left', N'Top Left', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (2, N'top-center', N'Top Center', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (3, N'top-right', N'Top Right', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (4, N'left-top', N'Left Top', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (5, N'left-middle', N'Left Middle', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (6, N'left-bottom', N'Left Bottom', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (7, N'right-top', N'Right Top', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (8, N'right-middle', N'Right Middle', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (9, N'right-bottom', N'Right Bottom', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (10, N'bottom-left', N'Bottom Left', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (11, N'bottom-center', N'Bottom Center', NULL)
INSERT [Core].[NavPosition] ([PositionId], [Name], [Title], [Description]) VALUES (12, N'bottom-right', N'Bottom Right', NULL)
SET IDENTITY_INSERT [Core].[NavPosition] OFF
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161206204752_Initial', N'1.1.2')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] ON 

INSERT [dbo].[AspNetUserClaims] ([Id], [ClaimType], [ClaimValue], [UserId]) VALUES (1, N'Customers', N'Write', N'a5ca83f9-d8f8-4015-80a7-8f94d074899e')
SET IDENTITY_INSERT [dbo].[AspNetUserClaims] OFF
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'a5ca83f9-d8f8-4015-80a7-8f94d074899e', 0, N'8f3d0806-0df7-4739-aba1-4e60bf8f9d96', N'i.love.to.smile.around@gmail.com', 0, 1, NULL, N'I.LOVE.TO.SMILE.AROUND@GMAIL.COM', N'I.LOVE.TO.SMILE.AROUND@GMAIL.COM', N'AQAAAAEAACcQAAAAEBWvE7wJ8vN5Me9giC2N17v2AKLxcgG5DWWwUFG6GaUwQ/rlS0RJ4B3enrqsL++C7Q==', NULL, 0, N'b0861026-a7d7-4ace-8272-651e6d7bbe33', 0, N'i.love.to.smile.around@gmail.com')
INSERT [dbo].[Customers] ([Id], [BirthDate], [Email], [Name]) VALUES (N'8b84fd1b-0e8e-4ee5-84d9-837e54805956', CAST(N'1986-05-11T00:00:00.0000000' AS DateTime2), N'i.love.to.smile.around@gmail.com', N'Huy Nguyen')
INSERT [dbo].[StoredEvent] ([Id], [AggregateId], [Data], [Action], [CreationDate], [User]) VALUES (N'1ff26026-256e-45ba-91bb-4721180b14f9', N'8b84fd1b-0e8e-4ee5-84d9-837e54805956', N'{"Id":"8b84fd1b-0e8e-4ee5-84d9-837e54805956","Name":"Huy Nguyen","Email":"i.love.to.smile.around@gmail.com","BirthDate":"1986-05-11T00:00:00","Timestamp":"2017-05-22T12:43:17.6983755+07:00","MessageType":"CustomerRegisteredEvent","AggregateId":"8b84fd1b-0e8e-4ee5-84d9-837e54805956"}', N'CustomerRegisteredEvent', CAST(N'2017-05-22T12:43:17.8352081' AS DateTime2), N'i.love.to.smile.around@gmail.com')
SET IDENTITY_INSERT [Ext].[BlogPostStatus] ON 

INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (1, N'publish', N'Publish', N'Viewable by everyone.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (2, N'future', N'Future', N'Scheduled to be published in a future date.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (3, N'draft', N'Draft', N'Incomplete post viewable by anyone with proper user role.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (4, N'pending', N'Pending', N'Awaiting a user with the publish_posts capability (typically a user assigned the Editor role) to publish.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (5, N'private', N'Private', N'Viewable only to WordPress users at Administrator level.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (6, N'trash', N'Trash', N'Posts in the Trash are assigned the trash status.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (7, N'auto-draft', N'Auto-Draft', N'Revisions that Swastika saves automatically while you are editing.')
INSERT [Ext].[BlogPostStatus] ([StatusId], [Name], [Title], [Description]) VALUES (8, N'inherit', N'Inherit', N'Used with a child post (such as Attachments and Revisions) to determine the actual status from the parent post.')
SET IDENTITY_INSERT [Ext].[BlogPostStatus] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [EmailIndex]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 5/22/2017 1:35:03 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Core].[Category] ADD  CONSTRAINT [DF_Categories_Id]  DEFAULT (newsequentialid()) FOR [CategoryId]
GO
ALTER TABLE [Core].[Category] ADD  CONSTRAINT [DF_Categories_CreatedUtc]  DEFAULT (getutcdate()) FOR [CreatedUtc]
GO
ALTER TABLE [Core].[Extension] ADD  CONSTRAINT [DF_Extensions_CreatedUtc]  DEFAULT (getutcdate()) FOR [CreatedUtc]
GO
ALTER TABLE [Core].[Nav] ADD  CONSTRAINT [DF_Admin.Navigations_Id]  DEFAULT (newsequentialid()) FOR [NavId]
GO
ALTER TABLE [Core].[Nav] ADD  CONSTRAINT [DF_Admin.Navigations_ParentId]  DEFAULT (newsequentialid()) FOR [ParentNavId]
GO
ALTER TABLE [Core].[Tag] ADD  CONSTRAINT [DF_Tags_Id]  DEFAULT (newsequentialid()) FOR [TagId]
GO
ALTER TABLE [Core].[Tag] ADD  CONSTRAINT [DF_Tags_CreatedUtc]  DEFAULT (getutcdate()) FOR [CreatedUtc]
GO
ALTER TABLE [Ext].[Blog] ADD  CONSTRAINT [DF_Blogs_CreatedUtc]  DEFAULT (getutcdate()) FOR [CreatedUtc]
GO
ALTER TABLE [Ext].[BlogPost] ADD  CONSTRAINT [DF_BlogPosts_Id]  DEFAULT (newsequentialid()) FOR [PostId]
GO
ALTER TABLE [Ext].[BlogPost] ADD  CONSTRAINT [DF_BlogPosts_CreatedUtc]  DEFAULT (getutcdate()) FOR [CreatedUtc]
GO
ALTER TABLE [Ext].[BlogSettingValue] ADD  CONSTRAINT [DF_BlogSettingValues_Id]  DEFAULT (newsequentialid()) FOR [SettingValueId]
GO
ALTER TABLE [Core].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Categories_Categories] FOREIGN KEY([ParentCategoryId])
REFERENCES [Core].[Category] ([CategoryId])
GO
ALTER TABLE [Core].[Category] CHECK CONSTRAINT [FK_Categories_Categories]
GO
ALTER TABLE [Core].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Categories_CategoryGroups] FOREIGN KEY([CategoryGroupId])
REFERENCES [Core].[CategoryGroup] ([CategoryGroupId])
GO
ALTER TABLE [Core].[Category] CHECK CONSTRAINT [FK_Categories_CategoryGroups]
GO
ALTER TABLE [Core].[CategoryCloud]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNetworks_Categories] FOREIGN KEY([CategoryId])
REFERENCES [Core].[Category] ([CategoryId])
GO
ALTER TABLE [Core].[CategoryCloud] CHECK CONSTRAINT [FK_CategoryNetworks_Categories]
GO
ALTER TABLE [Core].[CategoryCloud]  WITH CHECK ADD  CONSTRAINT [FK_CategoryNetworks_Extensions] FOREIGN KEY([ExtId])
REFERENCES [Core].[Extension] ([ExtId])
GO
ALTER TABLE [Core].[CategoryCloud] CHECK CONSTRAINT [FK_CategoryNetworks_Extensions]
GO
ALTER TABLE [Core].[ExtensionModule]  WITH CHECK ADD  CONSTRAINT [FK_Extension.Modules_Core.Extensions] FOREIGN KEY([ExtId])
REFERENCES [Core].[Extension] ([ExtId])
GO
ALTER TABLE [Core].[ExtensionModule] CHECK CONSTRAINT [FK_Extension.Modules_Core.Extensions]
GO
ALTER TABLE [Core].[Nav]  WITH CHECK ADD  CONSTRAINT [FK_Admin.Navigations_Admin.Navigations] FOREIGN KEY([ParentNavId])
REFERENCES [Core].[Nav] ([NavId])
GO
ALTER TABLE [Core].[Nav] CHECK CONSTRAINT [FK_Admin.Navigations_Admin.Navigations]
GO
ALTER TABLE [Core].[Nav]  WITH CHECK ADD  CONSTRAINT [FK_Admin.Navigations_Core.Extensions] FOREIGN KEY([ExtId])
REFERENCES [Core].[Extension] ([ExtId])
GO
ALTER TABLE [Core].[Nav] CHECK CONSTRAINT [FK_Admin.Navigations_Core.Extensions]
GO
ALTER TABLE [Core].[Nav]  WITH CHECK ADD  CONSTRAINT [FK_DashboardNavigations_DashboardNavigationPositions] FOREIGN KEY([PositionId])
REFERENCES [Core].[NavPosition] ([PositionId])
GO
ALTER TABLE [Core].[Nav] CHECK CONSTRAINT [FK_DashboardNavigations_DashboardNavigationPositions]
GO
ALTER TABLE [Core].[Nav]  WITH CHECK ADD  CONSTRAINT [FK_Navs_NavStatus] FOREIGN KEY([StatusId])
REFERENCES [Core].[NavStatus] ([StatusId])
GO
ALTER TABLE [Core].[Nav] CHECK CONSTRAINT [FK_Navs_NavStatus]
GO
ALTER TABLE [Core].[Nav]  WITH CHECK ADD  CONSTRAINT [FK_Navs_NavTypes] FOREIGN KEY([ActionTypeId])
REFERENCES [Core].[NavActionType] ([TypeId])
GO
ALTER TABLE [Core].[Nav] CHECK CONSTRAINT [FK_Navs_NavTypes]
GO
ALTER TABLE [Core].[NavRole]  WITH CHECK ADD  CONSTRAINT [FK_DashboardNavigationRoles_DashboardNavigations] FOREIGN KEY([NavId])
REFERENCES [Core].[Nav] ([NavId])
GO
ALTER TABLE [Core].[NavRole] CHECK CONSTRAINT [FK_DashboardNavigationRoles_DashboardNavigations]
GO
ALTER TABLE [Core].[SettingValue]  WITH CHECK ADD  CONSTRAINT [FK_Extension.SettingValues_Extension.Settings] FOREIGN KEY([SettingId])
REFERENCES [Core].[Setting] ([SettingId])
GO
ALTER TABLE [Core].[SettingValue] CHECK CONSTRAINT [FK_Extension.SettingValues_Extension.Settings]
GO
ALTER TABLE [Core].[TagCloud]  WITH CHECK ADD  CONSTRAINT [FK_Tag.Networks_Core.Extensions] FOREIGN KEY([ExtensionId])
REFERENCES [Core].[Extension] ([ExtId])
GO
ALTER TABLE [Core].[TagCloud] CHECK CONSTRAINT [FK_Tag.Networks_Core.Extensions]
GO
ALTER TABLE [Core].[TagCloud]  WITH CHECK ADD  CONSTRAINT [FK_TagNetworks_Tags] FOREIGN KEY([TagId])
REFERENCES [Core].[Tag] ([TagId])
GO
ALTER TABLE [Core].[TagCloud] CHECK CONSTRAINT [FK_TagNetworks_Tags]
GO
ALTER TABLE [Core].[TermCloud]  WITH CHECK ADD  CONSTRAINT [FK_Term.Relationships_Term.Taxonomy1] FOREIGN KEY([TaxonomyId])
REFERENCES [Core].[TermTaxonomie] ([TaxonomyId])
GO
ALTER TABLE [Core].[TermCloud] CHECK CONSTRAINT [FK_Term.Relationships_Term.Taxonomy1]
GO
ALTER TABLE [Core].[TermTaxonomie]  WITH CHECK ADD  CONSTRAINT [FK_Term.Taxonomy_Terms] FOREIGN KEY([TermId])
REFERENCES [Core].[Term] ([TermId])
GO
ALTER TABLE [Core].[TermTaxonomie] CHECK CONSTRAINT [FK_Term.Taxonomy_Terms]
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
ALTER TABLE [Ext].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPosts_BlogPostStatus] FOREIGN KEY([StatusId])
REFERENCES [Ext].[BlogPostStatus] ([StatusId])
GO
ALTER TABLE [Ext].[BlogPost] CHECK CONSTRAINT [FK_BlogPosts_BlogPostStatus]
GO
ALTER TABLE [Ext].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPosts_Blogs] FOREIGN KEY([BlogId])
REFERENCES [Ext].[Blog] ([BlogId])
GO
ALTER TABLE [Ext].[BlogPost] CHECK CONSTRAINT [FK_BlogPosts_Blogs]
GO
ALTER TABLE [Ext].[BlogSettingValue]  WITH CHECK ADD  CONSTRAINT [FK_Blog.SettingValues_Blog.Setting] FOREIGN KEY([SettingId])
REFERENCES [Ext].[BlogSetting] ([SettingId])
GO
ALTER TABLE [Ext].[BlogSettingValue] CHECK CONSTRAINT [FK_Blog.SettingValues_Blog.Setting]
GO
ALTER TABLE [User].[SettingValue]  WITH CHECK ADD  CONSTRAINT [FK_User.SettingValues_User.Settings] FOREIGN KEY([SettingId])
REFERENCES [User].[Setting] ([SettingId])
GO
ALTER TABLE [User].[SettingValue] CHECK CONSTRAINT [FK_User.SettingValues_User.Settings]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Navigation positions' , @level0type=N'SCHEMA',@level0name=N'Core', @level1type=N'TABLE',@level1name=N'NavPosition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default Statuses
There are 8 major post statuses that WordPress uses by default.

Publish
Viewable by everyone. (publish)

Future
Scheduled to be published in a future date. (future)

Draft
Incomplete post viewable by anyone with proper user role. (draft)

Pending
Awaiting a user with the publish_posts capability (typically a user assigned the Editor role) to publish. (pending)

Private
Viewable only to WordPress users at Administrator level. (private)

Trash
Posts in the Trash are assigned the trash status. (trash)

Auto-Draft
Revisions that Swastika saves automatically while you are editing. (auto-draft)

Inherit
Used with a child post (such as Attachments and Revisions) to determine the actual status from the parent post. (inherit)' , @level0type=N'SCHEMA',@level0name=N'Ext', @level1type=N'TABLE',@level1name=N'BlogPostStatus'
GO
USE [master]
GO
ALTER DATABASE [Swastika] SET  READ_WRITE 
GO
