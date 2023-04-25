
/****** Object:  Table [dbo].[DL_PJP]    Script Date: 05/27/2014 13:12:20 ******/
if exists (select 1 from sysobjects where name = 'DL_Users' and xtype = 'U')
DROP TABLE [dbo].[DL_Users]
GO
/****** Object:  Table [dbo].[DL_PJP]    Script Date: 05/27/2014 13:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_Users](
	[Distributor] [nvarchar](255) NULL,
	[User_ID] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[level] [nvarchar](255) NULL,
	[Pass_width] [nvarchar](255) NULL,
	[Expiry_alert] [nvarchar](255) NULL,
	[Expiry_days] [nvarchar](255) NULL
) ON [PRIMARY]
GO
