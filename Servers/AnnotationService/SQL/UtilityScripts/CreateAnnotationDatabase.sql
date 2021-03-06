USE [master]
GO

/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 04/06/2010 11:08:36 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'×§¶v\0WKý4óCz{w)SøÏ¥*éçÕ', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 04/06/2010 11:08:36 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'Á[Å8«{±úB#¸WSÚã
!n/üA1abVs}', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [BUILTIN\Users]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'BUILTIN\Users')
CREATE LOGIN [BUILTIN\Users] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [jamesan]    Script Date: 04/06/2010 11:08:36 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'jamesan')
CREATE LOGIN [jamesan] WITH PASSWORD=N'×!5wý£eÕÌhØýak±''¯¡*?Xs', DEFAULT_DATABASE=[XXXXXX], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
EXEC sys.sp_addsrvrolemember @loginame = N'jamesan', @rolename = N'sysadmin'
GO
EXEC sys.sp_addsrvrolemember @loginame = N'jamesan', @rolename = N'serveradmin'
GO
ALTER LOGIN [jamesan] DISABLE
GO
/****** Object:  Login [MARCLABRETINADA\Administrator]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'MARCLABRETINADA\Administrator')
CREATE LOGIN [MARCLABRETINADA\Administrator] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [MARCLABRETINADA\RobertMarc]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'MARCLABRETINADA\RobertMarc')
CREATE LOGIN [MARCLABRETINADA\RobertMarc] FROM WINDOWS WITH DEFAULT_DATABASE=[XXXXXX], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [MARCLABRETINADA\ShoebM]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'MARCLABRETINADA\ShoebM')
CREATE LOGIN [MARCLABRETINADA\ShoebM] FROM WINDOWS WITH DEFAULT_DATABASE=[XXXXXX], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [MARCLABRETINADA\SQLEXPRESSAdmin]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'MARCLABRETINADA\SQLEXPRESSAdmin')
CREATE LOGIN [MARCLABRETINADA\SQLEXPRESSAdmin] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [Matlab]    Script Date: 04/06/2010 11:08:36 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'Matlab')
CREATE LOGIN [Matlab] WITH PASSWORD=N' ¨5*vëmY±gm¶[ú¹¦óáïÛM©Ã¼ü*®', DEFAULT_DATABASE=[XXXXXX], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [Matlab] DISABLE
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\MSSQL$SQLEXPRESS]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\MSSQL$SQLEXPRESS')
CREATE LOGIN [NT SERVICE\MSSQL$SQLEXPRESS] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [WebSite]    Script Date: 04/06/2010 11:08:36 ******/
/* For security reasons the login is created disabled and with a random password. */
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'WebSite')
CREATE LOGIN [WebSite] WITH PASSWORD=N'[%£ø>CfzQïd 
2$küeÿæÏ7vöBm8', DEFAULT_DATABASE=[XXXXXX], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
EXEC sys.sp_addsrvrolemember @loginame = N'WebSite', @rolename = N'processadmin'
GO
ALTER LOGIN [WebSite] DISABLE
GO
USE [XXXXXX]
GO
/****** Object:  User [jamesan]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'jamesan')
CREATE USER [jamesan] FOR LOGIN [jamesan] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARCLABRETINADA\RobertMarc]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'MARCLABRETINADA\RobertMarc')
CREATE USER [MARCLABRETINADA\RobertMarc] FOR LOGIN [MARCLABRETINADA\RobertMarc] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [MARCLABRETINADA\ShoebM]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'MARCLABRETINADA\ShoebM')
CREATE USER [MARCLABRETINADA\ShoebM] FOR LOGIN [MARCLABRETINADA\ShoebM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Matlab]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Matlab')
CREATE USER [Matlab] FOR LOGIN [Matlab] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Network Service]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Network Service')
CREATE USER [Network Service] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Shoeb]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'Shoeb')
CREATE USER [Shoeb] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [WebSite]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'WebSite')
CREATE USER [WebSite] FOR LOGIN [WebSite] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DeletedLocations]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeletedLocations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DeletedLocations](
	[ID] [bigint] NOT NULL,
	[DeletedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_DeletedLocations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[DeletedLocations] DISABLE CHANGE_TRACKING
GO
/****** Object:  Table [dbo].[StructureType]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StructureType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StructureType](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentID] [bigint] NULL,
	[Name] [nchar](128) NOT NULL,
	[Notes] [text] NULL,
	[MarkupType] [nchar](16) NOT NULL,
	[Tags] [xml] NULL,
	[StructureTags] [text] NULL,
	[Abstract] [bit] NOT NULL,
	[Color] [int] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[Code] [nchar](16) NOT NULL,
	[HotKey] [char](1) NOT NULL,
	[Username] [nchar](20) NOT NULL,
 CONSTRAINT [PK_StructureType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[StructureType] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StructureType]') AND name = N'ParentID')
CREATE NONCLUSTERED INDEX [ParentID] ON [dbo].[StructureType] 
(
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureType', N'COLUMN',N'MarkupType'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Point,Line,Poly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureType', @level2type=N'COLUMN',@level2name=N'MarkupType'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureType', N'COLUMN',N'Tags'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Strings seperated by semicolins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureType', @level2type=N'COLUMN',@level2name=N'Tags'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureType', N'COLUMN',N'Code'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Code used to identify these items in the UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureType', @level2type=N'COLUMN',@level2name=N'Code'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureType', N'COLUMN',N'HotKey'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hotkey used to create a structure of this type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureType', @level2type=N'COLUMN',@level2name=N'HotKey'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureType', N'COLUMN',N'Username'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last username to modify the row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureType', @level2type=N'COLUMN',@level2name=N'Username'
GO
/****** Object:  Table [dbo].[Structure]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Structure]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Structure](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeID] [bigint] NOT NULL,
	[Notes] [text] NULL,
	[Verified] [bit] NOT NULL,
	[Tags] [xml] NULL,
	[Confidence] [float] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[ParentID] [bigint] NULL,
	[Created] [datetime] NOT NULL,
	[Label] [varchar](64) NULL,
	[Username] [nchar](20) NOT NULL,
 CONSTRAINT [PK_StructureBase] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Structure] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Structure]') AND name = N'ParentID')
CREATE NONCLUSTERED INDEX [ParentID] ON [dbo].[Structure] 
(
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Structure]') AND name = N'TypeID')
CREATE NONCLUSTERED INDEX [TypeID] ON [dbo].[Structure] 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Tags'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Strings seperated by semicolins' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Tags'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Confidence'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'How certain is it that the structure is what we say it is' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Confidence'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Version'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Records last write time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Version'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'ParentID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'If the structure is contained in a larger structure (Synapse for a cell) this index contains the index of the parent' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Created'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the structure was created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Created'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Label'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Additional Label for structure in UI' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Label'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Structure', N'COLUMN',N'Username'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last username to modify the row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Structure', @level2type=N'COLUMN',@level2name=N'Username'
GO
/****** Object:  Table [dbo].[StructureTemplates]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StructureTemplates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StructureTemplates](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [char](64) NOT NULL,
	[StructureTypeID] [bigint] NOT NULL,
	[StructureTags] [text] NOT NULL,
	[Version] [timestamp] NOT NULL,
 CONSTRAINT [PK_StructureTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[StructureTemplates] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureTemplates', N'COLUMN',N'Name'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Name of template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureTemplates', @level2type=N'COLUMN',@level2name=N'Name'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureTemplates', N'COLUMN',N'StructureTypeID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The structure type which is created when using the template' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureTemplates', @level2type=N'COLUMN',@level2name=N'StructureTypeID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureTemplates', N'COLUMN',N'StructureTags'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The tags to create with the new structure type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureTemplates', @level2type=N'COLUMN',@level2name=N'StructureTags'
GO
/****** Object:  Table [dbo].[StructureLink]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StructureLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StructureLink](
	[SourceID] [bigint] NOT NULL,
	[TargetID] [bigint] NOT NULL,
	[Bidirectional] [bit] NOT NULL,
	[Tags] [xml] NULL,
	[Username] [nchar](20) NOT NULL
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[StructureLink] DISABLE CHANGE_TRACKING
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StructureLink]') AND name = N'SourceID')
CREATE NONCLUSTERED INDEX [SourceID] ON [dbo].[StructureLink] 
(
	[SourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[StructureLink]') AND name = N'TargetID')
CREATE NONCLUSTERED INDEX [TargetID] ON [dbo].[StructureLink] 
(
	[TargetID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'StructureLink', N'COLUMN',N'Username'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last username to modify the row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StructureLink', @level2type=N'COLUMN',@level2name=N'Username'
GO
/****** Object:  Table [dbo].[Location]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Location](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ParentID] [bigint] NOT NULL,
	[X] [float] NOT NULL,
	[Y] [float] NOT NULL,
	[Z] [float] NOT NULL,
	[Verticies] [varbinary](max) NULL,
	[Closed] [bit] NOT NULL,
	[Version] [timestamp] NOT NULL,
	[Overlay] [varbinary](max) NULL,
	[Tags] [xml] NULL,
	[VolumeX] [float] NOT NULL,
	[VolumeY] [float] NOT NULL,
	[Terminal] [bit] NOT NULL,
	[OffEdge] [bit] NOT NULL,
	[Radius] [float] NOT NULL,
	[TypeCode] [smallint] NOT NULL,
	[LastModified] [datetime] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Username] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[Location] DISABLE CHANGE_TRACKING
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND name = N'LastModified')
CREATE NONCLUSTERED INDEX [LastModified] ON [dbo].[Location] 
(
	[LastModified] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND name = N'ParentID')
CREATE NONCLUSTERED INDEX [ParentID] ON [dbo].[Location] 
(
	[ParentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Location]') AND name = N'Z')
CREATE NONCLUSTERED INDEX [Z] ON [dbo].[Location] 
(
	[Z] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'ParentID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Structure which we belong to' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Verticies'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A binary formatted series of X,Y doubles which can be specified to create polygons or lines' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Verticies'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Closed'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Defines whether Vertices form a closed figure (The last vertex connects to the first)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Closed'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Overlay'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An image centered on X,Y,Z which specifies which surrounding pixels are part of location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Overlay'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'VolumeX'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VolumeX is the location in volume space.  It exists so that data analysis code does not need to implement transforms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'VolumeX'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'VolumeY'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'VolumeY is the location in volume space.  It exists so that data analysis code does not need to implement transforms' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'VolumeY'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Terminal'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Set to true if this location is the edge of a structure and cannot be extended.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Terminal'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'OffEdge'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This bit is set if the structure leaves the volume at this location' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'OffEdge'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'TypeCode'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 = Point, 1 = Circle, 2 =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'TypeCode'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'LastModified'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the location was last modified' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'LastModified'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Created'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date the location was created' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Created'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Location', N'COLUMN',N'Username'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last username to modify the row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Location', @level2type=N'COLUMN',@level2name=N'Username'
GO
/****** Object:  Table [dbo].[LocationLink]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LocationLink]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LocationLink](
	[A] [bigint] NOT NULL,
	[B] [bigint] NOT NULL,
	[Username] [nchar](20) NOT NULL,
 CONSTRAINT [PK_LocationLink] PRIMARY KEY CLUSTERED 
(
	[A] ASC,
	[B] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
ALTER TABLE [dbo].[LocationLink] DISABLE CHANGE_TRACKING
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LocationLink]') AND name = N'a')
CREATE NONCLUSTERED INDEX [a] ON [dbo].[LocationLink] 
(
	[A] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[LocationLink]') AND name = N'b')
CREATE NONCLUSTERED INDEX [b] ON [dbo].[LocationLink] 
(
	[B] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LocationLink', N'COLUMN',N'A'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The convention is that A is always less than B' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LocationLink', @level2type=N'COLUMN',@level2name=N'A'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'LocationLink', N'COLUMN',N'Username'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Last username to modify the row' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LocationLink', @level2type=N'COLUMN',@level2name=N'Username'
GO
/****** Object:  Trigger [Location_update]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Location_update]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Location_update] 
   ON  [dbo].[Location]
   FOR UPDATE
AS 
	Update dbo.Location
	Set LastModified = (GETUTCDATE())
	WHERE ID in (SELECT ID FROM inserted)
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
'
GO
/****** Object:  Trigger [Location_delete]    Script Date: 04/06/2010 11:08:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N'[dbo].[Location_delete]'))
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Location_delete] 
   ON  [dbo].[Location]
   FOR DELETE
AS 
	INSERT INTO [dbo].[DeletedLocations] (ID)
	SELECT deleted.ID FROM deleted
	
	SET NOCOUNT ON;

    -- Insert statements for trigger here
'
GO
/****** Object:  StoredProcedure [dbo].[SelectStructureLocations]    Script Date: 04/06/2010 11:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStructureLocations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectStructureLocations]
	-- Add the parameters for the stored procedure here
	@StructureID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT L.ID
       ,[ParentID]
      ,[VolumeX]
      ,[VolumeY]
      ,[Z]
      ,[Radius]
      ,J.TypeID
      ,[X]
      ,[Y]
	  FROM [XXXXXX].[dbo].[Location] L
	  INNER JOIN 
	   (SELECT ID, TYPEID
		FROM Structure
		WHERE ID = @StructureID OR ParentID = @StructureID) J
	  ON L.ParentID = J.ID
	  ORDER BY ID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStructureLocations]    Script Date: 04/06/2010 11:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectAllStructureLocations]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE PROCEDURE [dbo].[SelectAllStructureLocations]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT L.ID
       ,[ParentID]
      ,[VolumeX]
      ,[VolumeY]
      ,[Z]
      ,[Radius]
      ,J.TypeID
      ,[X]
      ,[Y]
	  FROM [XXXXXX].[dbo].[Location] L
	  INNER JOIN 
	   (SELECT ID, TYPEID
		FROM Structure) J
	  ON L.ParentID = J.ID
	  ORDER BY ID
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectAllStructureLocationLinks]    Script Date: 04/06/2010 11:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectAllStructureLocationLinks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectAllStructureLocationLinks]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from LocationLink	 
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectStructureLocationLinks]    Script Date: 04/06/2010 11:08:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SelectStructureLocationLinks]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SelectStructureLocationLinks]
	-- Add the parameters for the stored procedure here
	@StructureID bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Select * from LocationLink
	 WHERE (A in 
	(SELECT L.ID
	  FROM [XXXXXX].[dbo].[Location] L
	  INNER JOIN 
	   (SELECT ID, TYPEID
		FROM Structure
		WHERE ID = @StructureID OR ParentID = @StructureID ) J
	  ON L.ParentID = J.ID))
	  OR
	  (B in 
	(SELECT L.ID
	  FROM [XXXXXX].[dbo].[Location] L
	  INNER JOIN 
	   (SELECT ID, TYPEID
		FROM Structure
		WHERE ID = @StructureID OR ParentID = @StructureID ) J
	  ON L.ParentID = J.ID))
	 
END
' 
END
GO
/****** Object:  Default [DF_DeletedLocations_DeletedOn]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_DeletedLocations_DeletedOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[DeletedLocations]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_DeletedLocations_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DeletedLocations] ADD  CONSTRAINT [DF_DeletedLocations_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END


End
GO
/****** Object:  Default [DF_Location_Closed]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_Closed]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_Closed]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Closed]  DEFAULT ((0)) FOR [Closed]
END


End
GO
/****** Object:  Default [DF_Location_Flagged]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_Flagged]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_Flagged]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Flagged]  DEFAULT ((0)) FOR [Terminal]
END


End
GO
/****** Object:  Default [DF_Location_OffEdge]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_OffEdge]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_OffEdge]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_OffEdge]  DEFAULT ((0)) FOR [OffEdge]
END


End
GO
/****** Object:  Default [DF_Location_Radius]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_Radius]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_Radius]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Radius]  DEFAULT ((128)) FOR [Radius]
END


End
GO
/****** Object:  Default [DF_Location_TypeCode]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_TypeCode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_TypeCode]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_TypeCode]  DEFAULT ((1)) FOR [TypeCode]
END


End
GO
/****** Object:  Default [DF_Location_LastModified]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_LastModified]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_LastModified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_LastModified]  DEFAULT (getutcdate()) FOR [LastModified]
END


End
GO
/****** Object:  Default [DF_Location_Created]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_Created]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Created]  DEFAULT (getutcdate()) FOR [Created]
END


End
GO
/****** Object:  Default [DF_Location_Username]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Location_Username]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Location_Username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Location] ADD  CONSTRAINT [DF_Location_Username]  DEFAULT (N'Anonymous') FOR [Username]
END


End
GO
/****** Object:  Default [DF_LocationLink_Username]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_LocationLink_Username]') AND parent_object_id = OBJECT_ID(N'[dbo].[LocationLink]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_LocationLink_Username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LocationLink] ADD  CONSTRAINT [DF_LocationLink_Username]  DEFAULT (N'Anonymous') FOR [Username]
END


End
GO
/****** Object:  Default [DF_StructureBase_Verified]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureBase_Verified]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureBase_Verified]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Structure] ADD  CONSTRAINT [DF_StructureBase_Verified]  DEFAULT ((0)) FOR [Verified]
END


End
GO
/****** Object:  Default [DF_StructureBase_Confidence]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureBase_Confidence]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureBase_Confidence]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Structure] ADD  CONSTRAINT [DF_StructureBase_Confidence]  DEFAULT ((0.5)) FOR [Confidence]
END


End
GO
/****** Object:  Default [DF_Structure_Created]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Structure_Created]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Structure_Created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Structure] ADD  CONSTRAINT [DF_Structure_Created]  DEFAULT (getutcdate()) FOR [Created]
END


End
GO
/****** Object:  Default [DF_Structure_Username]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_Structure_Username]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Structure_Username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Structure] ADD  CONSTRAINT [DF_Structure_Username]  DEFAULT (N'Anonymous') FOR [Username]
END


End
GO
/****** Object:  Default [DF_StructureLink_Bidirectional]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureLink_Bidirectional]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureLink_Bidirectional]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureLink] ADD  CONSTRAINT [DF_StructureLink_Bidirectional]  DEFAULT ((0)) FOR [Bidirectional]
END


End
GO
/****** Object:  Default [DF_StructureLink_Username]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureLink_Username]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureLink_Username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureLink] ADD  CONSTRAINT [DF_StructureLink_Username]  DEFAULT (N'Anonymous') FOR [Username]
END


End
GO
/****** Object:  Default [DF_StructureTemplates_Tags]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureTemplates_Tags]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureTemplates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureTemplates_Tags]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureTemplates] ADD  CONSTRAINT [DF_StructureTemplates_Tags]  DEFAULT ('') FOR [StructureTags]
END


End
GO
/****** Object:  Default [DF_StructureType_MarkupType]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_MarkupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_MarkupType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_MarkupType]  DEFAULT (N'Point') FOR [MarkupType]
END


End
GO
/****** Object:  Default [DF_StructureType_Abstract]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_Abstract]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_Abstract]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_Abstract]  DEFAULT ((0)) FOR [Abstract]
END


End
GO
/****** Object:  Default [DF_StructureType_Color]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_Color]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_Color]  DEFAULT (0xFFFFFF) FOR [Color]
END


End
GO
/****** Object:  Default [DF_StructureType_Code]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_Code]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_Code]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_Code]  DEFAULT (N'No Code') FOR [Code]
END


End
GO
/****** Object:  Default [DF_StructureType_HotKey]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_HotKey]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_HotKey]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_HotKey]  DEFAULT ('\0') FOR [HotKey]
END


End
GO
/****** Object:  Default [DF_StructureType_Username]    Script Date: 04/06/2010 11:08:36 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_StructureType_Username]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_StructureType_Username]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[StructureType] ADD  CONSTRAINT [DF_StructureType_Username]  DEFAULT (N'Anonymous') FOR [Username]
END


End
GO
/****** Object:  ForeignKey [FK_Location_StructureBase1]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_StructureBase1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location]  WITH CHECK ADD  CONSTRAINT [FK_Location_StructureBase1] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Structure] ([ID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Location_StructureBase1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Location]'))
ALTER TABLE [dbo].[Location] CHECK CONSTRAINT [FK_Location_StructureBase1]
GO
/****** Object:  ForeignKey [FK_LocationLink_Location]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LocationLink_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[LocationLink]'))
ALTER TABLE [dbo].[LocationLink]  WITH CHECK ADD  CONSTRAINT [FK_LocationLink_Location] FOREIGN KEY([A])
REFERENCES [dbo].[Location] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LocationLink_Location]') AND parent_object_id = OBJECT_ID(N'[dbo].[LocationLink]'))
ALTER TABLE [dbo].[LocationLink] CHECK CONSTRAINT [FK_LocationLink_Location]
GO
/****** Object:  ForeignKey [FK_LocationLink_Location1]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LocationLink_Location1]') AND parent_object_id = OBJECT_ID(N'[dbo].[LocationLink]'))
ALTER TABLE [dbo].[LocationLink]  WITH CHECK ADD  CONSTRAINT [FK_LocationLink_Location1] FOREIGN KEY([B])
REFERENCES [dbo].[Location] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LocationLink_Location1]') AND parent_object_id = OBJECT_ID(N'[dbo].[LocationLink]'))
ALTER TABLE [dbo].[LocationLink] CHECK CONSTRAINT [FK_LocationLink_Location1]
GO
/****** Object:  ForeignKey [FK_Structure_Structure]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Structure_Structure]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
ALTER TABLE [dbo].[Structure]  WITH CHECK ADD  CONSTRAINT [FK_Structure_Structure] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Structure] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Structure_Structure]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
ALTER TABLE [dbo].[Structure] CHECK CONSTRAINT [FK_Structure_Structure]
GO
/****** Object:  ForeignKey [FK_StructureBase_StructureType]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureBase_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
ALTER TABLE [dbo].[Structure]  WITH CHECK ADD  CONSTRAINT [FK_StructureBase_StructureType] FOREIGN KEY([TypeID])
REFERENCES [dbo].[StructureType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureBase_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Structure]'))
ALTER TABLE [dbo].[Structure] CHECK CONSTRAINT [FK_StructureBase_StructureType]
GO
/****** Object:  ForeignKey [FK_StructureLinkSource_StructureBaseID]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureLinkSource_StructureBaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
ALTER TABLE [dbo].[StructureLink]  WITH CHECK ADD  CONSTRAINT [FK_StructureLinkSource_StructureBaseID] FOREIGN KEY([SourceID])
REFERENCES [dbo].[Structure] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureLinkSource_StructureBaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
ALTER TABLE [dbo].[StructureLink] CHECK CONSTRAINT [FK_StructureLinkSource_StructureBaseID]
GO
/****** Object:  ForeignKey [FK_StructureLinkTarget_StructureBaseID]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureLinkTarget_StructureBaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
ALTER TABLE [dbo].[StructureLink]  WITH CHECK ADD  CONSTRAINT [FK_StructureLinkTarget_StructureBaseID] FOREIGN KEY([TargetID])
REFERENCES [dbo].[Structure] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureLinkTarget_StructureBaseID]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureLink]'))
ALTER TABLE [dbo].[StructureLink] CHECK CONSTRAINT [FK_StructureLinkTarget_StructureBaseID]
GO
/****** Object:  ForeignKey [FK_StructureTemplates_StructureType]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureTemplates_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureTemplates]'))
ALTER TABLE [dbo].[StructureTemplates]  WITH CHECK ADD  CONSTRAINT [FK_StructureTemplates_StructureType] FOREIGN KEY([StructureTypeID])
REFERENCES [dbo].[StructureType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureTemplates_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureTemplates]'))
ALTER TABLE [dbo].[StructureTemplates] CHECK CONSTRAINT [FK_StructureTemplates_StructureType]
GO
/****** Object:  ForeignKey [FK_StructureType_StructureType]    Script Date: 04/06/2010 11:08:36 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureType_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
ALTER TABLE [dbo].[StructureType]  WITH CHECK ADD  CONSTRAINT [FK_StructureType_StructureType] FOREIGN KEY([ParentID])
REFERENCES [dbo].[StructureType] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_StructureType_StructureType]') AND parent_object_id = OBJECT_ID(N'[dbo].[StructureType]'))
ALTER TABLE [dbo].[StructureType] CHECK CONSTRAINT [FK_StructureType_StructureType]
GO
