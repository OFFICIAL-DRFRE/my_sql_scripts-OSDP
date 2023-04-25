if exists (select 1 from sysobjects where name = 'DL_Stock_batch' and xtype = 'U')
drop table DL_Stock_batch
GO
CREATE TABLE [DL_Stock_batch](
	[SKU] [nvarchar](255) NULL,
	[SKU_Type] [nvarchar](255) NULL,
	[Warehouse] [nvarchar](255) NULL,
	[Open_1] [nvarchar](255) NULL,
	[Open_2] [nvarchar](255) NULL,
	[Open_3] [nvarchar](255) NULL,
	) ON [PRIMARY]
GO