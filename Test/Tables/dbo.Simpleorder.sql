SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Simpleorder] (
		[orderID]         [int] IDENTITY(1, 1) NOT NULL,
		[orderdate]       [datetime2](7) NULL,
		[totalamount]     [decimal](10, 2) NULL,
		[testcol]         [varchar](5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		CONSTRAINT [PK__Simpleor__0809337D4ADCAB3F]
		PRIMARY KEY
		CLUSTERED
		([orderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Simpleorder] SET (LOCK_ESCALATION = TABLE)
GO
