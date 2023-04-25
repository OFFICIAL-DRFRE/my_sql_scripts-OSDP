DROP TABLE [dbo].[DL_Vehicle]
GO
/****** Object:  Table [dbo].[DL_Vehicle]    Script Date: 05/27/2014 13:01:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DL_Vehicle](
	[Vehicle_code] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Make] [nvarchar](255) NULL,
	[Registration_No] [nvarchar](255) NULL,
	[Year] [nvarchar](255) NULL,
	[Colour] [nvarchar](255) NULL,
	[Delivery Man] [nvarchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
