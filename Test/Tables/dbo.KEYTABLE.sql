SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KEYTABLE] (
		[imalock]         [int] NULL,
		[nodeid]          [int] IDENTITY(1, 1) NOT NULL,
		[parentid]        [int] NULL,
		[highhash]        [int] NULL,
		[lowhash]         [int] NULL,
		[uidhost]         [int] NULL,
		[uidtype]         [int] NULL,
		[uidid]           [int] NULL,
		[contextid]       [int] NULL,
		[rdn]             [varbinary](255) NULL,
		[changestamp]     [datetime] NULL,
		[data]            [varbinary](max) NULL,
		CONSTRAINT [c2]
		UNIQUE
		NONCLUSTERED
		([parentid], [rdn])
		ON [PRIMARY],
		CONSTRAINT [c1]
		PRIMARY KEY
		CLUSTERED
		([nodeid])
	ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYNAME]
	ON [dbo].[KEYTABLE] ([parentid], [highhash], [lowhash])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYUID]
	ON [dbo].[KEYTABLE] ([uidhost], [uidtype], [uidid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYCONTEXTID]
	ON [dbo].[KEYTABLE] ([contextid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYCONTEXTIDANDIMALOCK]
	ON [dbo].[KEYTABLE] ([contextid], [imalock])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYCHGSTAMPANDIMALOCK]
	ON [dbo].[KEYTABLE] ([changestamp], [imalock])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [READBYCHGSTAMP]
	ON [dbo].[KEYTABLE] ([changestamp])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[KEYTABLE] SET (LOCK_ESCALATION = TABLE)
GO
