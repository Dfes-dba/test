SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Simpleorder] (
		[orderID]         [int] IDENTITY(1, 1) NOT NULL,
		[orderdate]       [datetime2](7) NULL,
		[totalamount]     [decimal](10, 2) NULL,
		CONSTRAINT [PK__Simpleor__0809337D4ADCAB3F]
		PRIMARY KEY
		CLUSTERED
		([orderID])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Simpleorder] SET (LOCK_ESCALATION = TABLE)
GO
