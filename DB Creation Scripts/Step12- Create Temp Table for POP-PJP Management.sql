if exists (select 1 from sysobjects where name = 'DL_Section_Outlet' and xtype = 'U')
drop table DL_Section_Outlet
GO
CREATE TABLE [DL_Section_Outlet](
	[PJP] [nvarchar](255) NULL,
	[SELL_CATEGORY] [nvarchar](255) NULL,
	[Section_Route] [nvarchar](255) NULL,
	[Section_Description] [nvarchar](255) NULL,
	[TOWN] [nvarchar](255) NULL,
	[Locality] [nvarchar](255) NULL,
	[Locality_Description] [nvarchar](255) NULL,	
	[Sub_Locality] [nvarchar](255) NULL,
	[Sub_Locality_Description] [nvarchar](255) NULL,
	[POP] [nvarchar](255) NULL,
	[Outlet_Code] [nvarchar](255) NULL,
	[Outlet_Name] [nvarchar](255) NULL,
	[MARKET_NAME] [nvarchar](255) NULL,
	[STREET] [nvarchar](255) NULL,
	[POPNO] [nvarchar](255) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[Company_Turnover] [nvarchar](255) NULL,	
	[Total_Turnover] [nvarchar](255) NULL,	
	[AREATYPE] [nvarchar](255) NULL,
	[TOWN_CORPORATE] [nvarchar](255) NULL,
	[LOCALITY_CORPORATE] [nvarchar](255) NULL,
	[SLOCALITY_CORPORATE] [nvarchar](255) NULL,
	[TOWN_BILL_TO] [nvarchar](255) NULL,
	[LOCALITY_BILL_TO] [nvarchar](255) NULL,
	[SLOCALITY_BILL_TO] [nvarchar](255) NULL,
	[POP_BILL_TO] [nvarchar](255) NULL,
	[LONGITUDE] [nvarchar](255) NULL,
	[LATITUDE] [nvarchar](255) NULL,
	[PERFECT_STORE_LEVEL] [nvarchar](255) NULL,
	[PERFECT_STORE_DATE] [nvarchar](255) NULL,
	[TAX_SLAB] [nvarchar](255) NULL,
	[TAX_NO] [nvarchar](255) NULL,
	[Outlet_Business_Type] [nvarchar](255) NULL,	
	[Account_Type] [nvarchar](255) NULL,
	[Outlet_Type] [nvarchar](255) NULL,
	[Outlet_Ref_Code] [nvarchar](255) NULL,
	[Amount_action] [nvarchar](255) NULL,
	[Days_action] [nvarchar](255) NULL,
	[Amount_Limit] [nvarchar](255) NULL,
	[Days_Limit] [nvarchar](255) NULL,
	[Index] [nvarchar](255) NULL,
	[Section_outlet] [nvarchar](255) NULL,
	[POP_Banner] [nvarchar](255) NULL,
	[POP_BarCode] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Owner_NIC] [nvarchar](255) NULL,
	[Active] [nvarchar](255) NULL
) ON [PRIMARY]
GO
if exists (select 1 from sysobjects where name = 'DL_DSR' and xtype = 'U')
drop table DL_DSR
GO
CREATE TABLE [DL_DSR](
	[DSR] [nvarchar](255) NULL,
	[Name_of_DSR] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[Job_Type] [nvarchar](255) NULL,
	[Territory_Manager] [nvarchar](255) NULL,
	[Device_Sr_No] [nvarchar](255) NULL
) ON [PRIMARY]
GO

if exists (select 1 from sysobjects where name = 'DL_Selling_Category_SKU' and xtype = 'U')
drop table DL_Selling_Category_SKU
GO
CREATE TABLE [DL_Selling_Category_SKU](
	[Selling_Category] [nvarchar](255) NULL,
	[Sell_Category_Name] [nvarchar](255) NULL,
	[SKU_Code] [nvarchar](255) NULL,
	[SKU_Desc] [nvarchar](255) NULL,
	[SKU_INDEX] [nvarchar](255) NULL,
) ON [PRIMARY]
GO


if exists (select 1 from sysobjects where name = 'DL_Distributor_Warehouse' and xtype = 'U')
drop table DL_Distributor_Warehouse
GO
CREATE TABLE [DL_Distributor_Warehouse](
	[Warehouse_Code] [nvarchar](255) NULL,
	[Warehouse_Name] [nvarchar](255) NULL,
) ON [PRIMARY]
GO

if exists (select 1 from sysobjects where name = 'DL_Account_Type' and xtype = 'U')
drop table DL_Account_Type
GO
CREATE TABLE [DL_Account_Type](
	[account_type] [nvarchar](255) NULL,
	[sdesc] [nvarchar](255) NULL,
	[ldesc] [nvarchar](255) NULL
) ON [PRIMARY]
GO