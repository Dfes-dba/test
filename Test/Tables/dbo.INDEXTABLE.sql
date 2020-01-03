SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INDEXTABLE] (
		[nodeid]         [int] NULL,
		[contextid]      [int] NULL,
		[parentid]       [int] NULL,
		[attrnameid]     [int] NULL,
		[attrvalue]      [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[dummyid]        [int] IDENTITY(1, 1) NOT NULL,
		CONSTRAINT [c4]
		PRIMARY KEY
		CLUSTERED
		([dummyid])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[INDEXTABLE]
	WITH CHECK
	ADD CONSTRAINT [FK__INDEXTABL__nodei__07F6335A]
	FOREIGN KEY ([nodeid]) REFERENCES [dbo].[KEYTABLE] ([nodeid])
ALTER TABLE [dbo].[INDEXTABLE]
	CHECK CONSTRAINT [FK__INDEXTABL__nodei__07F6335A]

GO
CREATE NONCLUSTERED INDEX [INDEXTABLEINDEX]
	ON [dbo].[INDEXTABLE] ([attrnameid], [parentid], [attrvalue], [contextid])
	ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [INDEXTABLEINDEX2]
	ON [dbo].[INDEXTABLE] ([nodeid])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[INDEXTABLE] SET (LOCK_ESCALATION = TABLE)
GO
