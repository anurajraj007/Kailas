USE [KAILAS_CS]
GO
/****** Object:  Table [dbo].[Configure]    Script Date: 01/18/2015 09:31:02 ******/
ALTER TABLE [dbo].[Configure] DROP CONSTRAINT [DF_Configure_CreationDate]
GO
ALTER TABLE [dbo].[Configure] DROP CONSTRAINT [DF_Configure_ApplicationName]
GO
ALTER TABLE [dbo].[Configure] DROP CONSTRAINT [DF_Configure_SystemUserName]
GO
ALTER TABLE [dbo].[Configure] DROP CONSTRAINT [DF_Configure_DBLoginName]
GO
ALTER TABLE [dbo].[Configure] DROP CONSTRAINT [DF_Configure_MachineName]
GO
DROP TABLE [dbo].[Configure]
GO
/****** Object:  Table [dbo].[EventsType]    Script Date: 01/18/2015 09:31:02 ******/
DROP TABLE [dbo].[EventsType]
GO
/****** Object:  Table [dbo].[EventsType]    Script Date: 01/18/2015 09:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsType](
	[EventID] [bigint] IDENTITY(1,1) NOT NULL,
	[EventName] [nvarchar](200) NULL,
	[EventCode] [nvarchar](50) NOT NULL,
	[EventDescription] [nvarchar](max) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EventsType] ON
INSERT [dbo].[EventsType] ([EventID], [EventName], [EventCode], [EventDescription]) VALUES (1, N'Marriage', N'WC', N'Wedding Ceremony')
INSERT [dbo].[EventsType] ([EventID], [EventName], [EventCode], [EventDescription]) VALUES (2, N'Reception', N'WR', N'Wedding Reception')
INSERT [dbo].[EventsType] ([EventID], [EventName], [EventCode], [EventDescription]) VALUES (3, N'Engagement', N'WE', N'Wedding Engagement')
INSERT [dbo].[EventsType] ([EventID], [EventName], [EventCode], [EventDescription]) VALUES (4, N'Meeting', N'MT', N'Meetings')
INSERT [dbo].[EventsType] ([EventID], [EventName], [EventCode], [EventDescription]) VALUES (5, N'Others', N'OR', N'Other Functions')
SET IDENTITY_INSERT [dbo].[EventsType] OFF
/****** Object:  Table [dbo].[Configure]    Script Date: 01/18/2015 09:31:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configure](
	[ConfigureID] [bigint] IDENTITY(1,1) NOT NULL,
	[ConfigureItem] [varchar](200) NULL,
	[ConfigureValue] [nvarchar](max) NULL,
	[CreationDate] [datetime] NOT NULL CONSTRAINT [DF_Configure_CreationDate]  DEFAULT (getdate()),
	[ApplicationName] [nvarchar](200) NOT NULL CONSTRAINT [DF_Configure_ApplicationName]  DEFAULT (substring(app_name(),(1),(50))),
	[SystemUserName] [nvarchar](100) NOT NULL CONSTRAINT [DF_Configure_SystemUserName]  DEFAULT (substring(suser_sname(),(1),(30))),
	[DBLoginName] [nvarchar](100) NOT NULL CONSTRAINT [DF_Configure_DBLoginName]  DEFAULT (substring(user_name(),(1),(30))),
	[MachineName] [nvarchar](50) NOT NULL CONSTRAINT [DF_Configure_MachineName]  DEFAULT (substring(host_name(),(1),(30)))
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
