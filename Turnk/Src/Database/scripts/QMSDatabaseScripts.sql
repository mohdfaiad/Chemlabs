USE [master]
GO
/****** Object:  Database [QMS]    Script Date: 01/06/2017 18:31:10 ******/
CREATE DATABASE [QMS] ON  PRIMARY 
( NAME = N'QMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QMS.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\QMS_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [QMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [QMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [QMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [QMS] SET ARITHABORT OFF
GO
ALTER DATABASE [QMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [QMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [QMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [QMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [QMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [QMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [QMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [QMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [QMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [QMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [QMS] SET  ENABLE_BROKER
GO
ALTER DATABASE [QMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [QMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [QMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [QMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [QMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [QMS] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [QMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [QMS] SET  READ_WRITE
GO
ALTER DATABASE [QMS] SET RECOVERY FULL
GO
ALTER DATABASE [QMS] SET  MULTI_USER
GO
ALTER DATABASE [QMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [QMS] SET DB_CHAINING OFF
GO
USE [QMS]
GO
/****** Object:  Table [dbo].[Taxes]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Taxes](
	[Id] [nvarchar](128) NOT NULL,
	[TaxType] [nvarchar](max) NULL,
	[TaxCalculation] [nvarchar](max) NULL,
	[Comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Taxes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductFeatures]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductFeatures](
	[Id] [nvarchar](128) NOT NULL,
	[FeatureName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.ProductFeatures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductLicenses]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductLicenses](
	[Id] [nvarchar](128) NOT NULL,
	[LicenseName] [nvarchar](max) NULL,
	[NumberOfUsersAllowed] [smallint] NOT NULL,
	[LicensePrice] [smallint] NOT NULL,
	[feature_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.ProductLicenses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_feature_Id] ON [dbo].[ProductLicenses] 
(
	[feature_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegisteredCompanies]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRegisteredCompanies](
	[Id] [nvarchar](128) NOT NULL,
	[CompanyName] [nvarchar](max) NULL,
	[CompanyAlias] [nvarchar](max) NULL,
	[CompanyAddress] [nvarchar](max) NULL,
	[CompanyLogo] [varbinary](max) NULL,
	[IsLicenseExpired] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[license_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.UserRegisteredCompanies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_license_Id] ON [dbo].[UserRegisteredCompanies] 
(
	[license_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[password] [nvarchar](max) NULL,
	[GUID] [nvarchar](max) NULL,
	[IsUserDeleted] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Comments] [nvarchar](max) NULL,
	[company_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_company_Id] ON [dbo].[Users] 
(
	[company_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quotations]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuotationId] [nvarchar](max) NULL,
	[CompanyName] [nvarchar](max) NULL,
	[CompanyAddress] [nvarchar](max) NULL,
	[KintAttn] [nvarchar](max) NULL,
	[TaxType] [nvarchar](max) NULL,
	[TotalValue] [int] NOT NULL,
	[Status] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[taxes_Id] [nvarchar](128) NULL,
	[user_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.Quotations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_taxes_Id] ON [dbo].[Quotations] 
(
	[taxes_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_user_Id] ON [dbo].[Quotations] 
(
	[user_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuotationsDetails]    Script Date: 01/06/2017 18:31:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuotationsDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatNo] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Unit] [int] NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[ExactPrice] [int] NOT NULL,
	[Tax] [int] NOT NULL,
	[TaxValue] [int] NOT NULL,
	[LeadTime] [nvarchar](max) NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[UpdatedBy] [nvarchar](max) NULL,
	[company_Id] [nvarchar](128) NULL,
	[Quotations_Id] [int] NULL,
 CONSTRAINT [PK_dbo.QuotationsDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_company_Id] ON [dbo].[QuotationsDetails] 
(
	[company_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Quotations_Id] ON [dbo].[QuotationsDetails] 
(
	[Quotations_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_dbo.ProductLicenses_dbo.ProductFeatures_feature_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[ProductLicenses]  WITH CHECK ADD  CONSTRAINT [FK_dbo.ProductLicenses_dbo.ProductFeatures_feature_Id] FOREIGN KEY([feature_Id])
REFERENCES [dbo].[ProductFeatures] ([Id])
GO
ALTER TABLE [dbo].[ProductLicenses] CHECK CONSTRAINT [FK_dbo.ProductLicenses_dbo.ProductFeatures_feature_Id]
GO
/****** Object:  ForeignKey [FK_dbo.UserRegisteredCompanies_dbo.ProductLicenses_license_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[UserRegisteredCompanies]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserRegisteredCompanies_dbo.ProductLicenses_license_Id] FOREIGN KEY([license_Id])
REFERENCES [dbo].[ProductLicenses] ([Id])
GO
ALTER TABLE [dbo].[UserRegisteredCompanies] CHECK CONSTRAINT [FK_dbo.UserRegisteredCompanies_dbo.ProductLicenses_license_Id]
GO
/****** Object:  ForeignKey [FK_dbo.Users_dbo.UserRegisteredCompanies_company_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.UserRegisteredCompanies_company_Id] FOREIGN KEY([company_Id])
REFERENCES [dbo].[UserRegisteredCompanies] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.UserRegisteredCompanies_company_Id]
GO
/****** Object:  ForeignKey [FK_dbo.Quotations_dbo.Taxes_taxes_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[Quotations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Quotations_dbo.Taxes_taxes_Id] FOREIGN KEY([taxes_Id])
REFERENCES [dbo].[Taxes] ([Id])
GO
ALTER TABLE [dbo].[Quotations] CHECK CONSTRAINT [FK_dbo.Quotations_dbo.Taxes_taxes_Id]
GO
/****** Object:  ForeignKey [FK_dbo.Quotations_dbo.Users_user_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[Quotations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Quotations_dbo.Users_user_Id] FOREIGN KEY([user_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Quotations] CHECK CONSTRAINT [FK_dbo.Quotations_dbo.Users_user_Id]
GO
/****** Object:  ForeignKey [FK_dbo.QuotationsDetails_dbo.Quotations_Quotations_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[QuotationsDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuotationsDetails_dbo.Quotations_Quotations_Id] FOREIGN KEY([Quotations_Id])
REFERENCES [dbo].[Quotations] ([Id])
GO
ALTER TABLE [dbo].[QuotationsDetails] CHECK CONSTRAINT [FK_dbo.QuotationsDetails_dbo.Quotations_Quotations_Id]
GO
/****** Object:  ForeignKey [FK_dbo.QuotationsDetails_dbo.UserRegisteredCompanies_company_Id]    Script Date: 01/06/2017 18:31:11 ******/
ALTER TABLE [dbo].[QuotationsDetails]  WITH CHECK ADD  CONSTRAINT [FK_dbo.QuotationsDetails_dbo.UserRegisteredCompanies_company_Id] FOREIGN KEY([company_Id])
REFERENCES [dbo].[UserRegisteredCompanies] ([Id])
GO
ALTER TABLE [dbo].[QuotationsDetails] CHECK CONSTRAINT [FK_dbo.QuotationsDetails_dbo.UserRegisteredCompanies_company_Id]
GO
