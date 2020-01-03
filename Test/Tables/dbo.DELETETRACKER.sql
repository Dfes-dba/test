SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DELETETRACKER] (
		[nodeid]          [int] NOT NULL,
		[contextid]       [int] NULL,
		[imalock]         [int] NULL,
		[fulldn]          [varbinary](2048) NULL,
		[changestamp]     [datetime] NULL,
		CONSTRAINT [c5]
		PRIMARY KEY
		CLUSTERED
		([nodeid])
	ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYCHGSTAMPANDIMALOCK]
	ON [dbo].[DELETETRACKER] ([changestamp], [imalock])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[DELETETRACKER] SET (LOCK_ESCALATION = TABLE)
GO
