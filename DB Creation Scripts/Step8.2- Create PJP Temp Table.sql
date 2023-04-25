/****** Object:  Table [dbo].[DL_PJP]    Script Date: 05/27/2014 13:12:20 ******/
DROP TABLE [dbo].[DL_PJP]
GO
/****** Object:  Table [dbo].[DL_PJP]    Script Date: 05/27/2014 13:12:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DL_PJP](
	[PJP_Code] [nvarchar](255) NULL,
	[SalesMan] [nvarchar](255) NULL,
	[PJP_Short_Description] [nvarchar](255) NULL,
	[PJP_Long_Description] [nvarchar](255) NULL,
	[Day] [nvarchar](255) NULL,
	[Selling_Cateogry] [nvarchar](255) NULL,
	[Section_Route] [nvarchar](255) NULL,
	[Visit_Frequency] [nvarchar](255) NULL,
	[warehouse] [nvarchar](255) NULL,
	[Ref_PJP] [nvarchar](255) NULL,
	[Ref_DSR] [nvarchar](255) NULL
) ON [PRIMARY]
GO
