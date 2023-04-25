

USE master;
GO
CREATE DATABASE Centegy_SnDPro_Log
ON 
( NAME = Centegy_SnDPro_Log_dat,
    FILENAME = 'D:\\OSDP\Database\Centegy_SnDPro_Log_dat.mdf')
LOG ON
( NAME = Centegy_SnDPro_Log_log,
    FILENAME = 'D:\\OSDP\Database\Centegy_SnDPro_Log_dat.ldf') ;
GO

USE Centegy_SnDPro_Log
GO

IF OBJECT_ID('LOG_ST_TRANS_DETAIL') IS NULL
BEGIN
CREATE TABLE [dbo].[LOG_ST_TRANS_DETAIL](
 [LOG_ID] bigint not null identity(1,1),
 [COMPANY] [varchar](10) NOT NULL,
 [DISTRIBUTOR] [varchar](10) NOT NULL,
 [DOCUMENT] [varchar](2) NOT NULL,
 [DOC_NO] [varchar](15) NOT NULL,
 [ENTRY_TYPE] [varchar](2) NOT NULL,
 [SKU] [varchar](20) NOT NULL,
 [SKU_TYPE] [varchar](2) NOT NULL,
 [BATCH] [varchar](15) NOT NULL,
 [WAREHOUSE] [varchar](2) NOT NULL,
 [DOC_DATE] [datetime] NULL,
 [REF_QTY1] [numeric](13, 2) NULL,
 [REF_QTY2] [numeric](13, 2) NULL,
 [REF_QTY3] [numeric](13, 2) NULL,
 [QTY1] [numeric](13, 2) NULL,
 [QTY2] [numeric](13, 2) NULL,
 [QTY3] [numeric](13, 2) NULL,
 [AMOUNT] [numeric](13, 2) NULL,
 [DISCOUNT] [numeric](13, 2) NULL,
 [GST] [numeric](13, 2) NULL,
 [REMARKS] [varchar](50) NULL,
 [FirstQty] [numeric](12, 6) NULL,
 [SecondQty] [numeric](12, 6) NULL,
 [sku_index] [smallint] NULL,
 [SUB_DOCUMENT] [varchar](2) NOT NULL,
 [LOSS_QTY1] [numeric](13, 2) NULL,
 [LOSS_QTY2] [numeric](13, 2) NULL,
 [LOSS_QTY3] [numeric](13, 2) NULL,
 [VAN_OFFLOAD] [bit] NULL,
 [VAN_QTY1] [numeric](9, 2) NULL,
 [VAN_QTY2] [numeric](9, 2) NULL,
 [VAN_QTY3] [numeric](9, 2) NULL,
 [WH_DISTRIBUTOR] [varchar](10) NULL,
 [LINE_NO] [varchar](10) NULL,
 [EVENT_SPID] smallint,
 [EVENT_DATETIME] datetime,
 [EVENT_TYPE] VARchar(2),
 [EVENT_DESC] VARCHAR(MAX),
 CONSTRAINT [PK_LOG_ST_TRANS_DETAIL] PRIMARY KEY CLUSTERED 
(
 [LOG_ID] ASC
)
)
END
go

IF OBJECT_ID('LOG_ST_STOCK_BATCH') IS NULL
BEGIN
CREATE TABLE [dbo].[LOG_ST_STOCK_BATCH](
 [LOG_ID] bigint not null identity(1,1),

 [COMPANY] [varchar](10) NOT NULL,
 [DISTRIBUTOR] [varchar](10) NOT NULL,
 [SKU] [varchar](20) NOT NULL,
 [SKU_TYPE] [varchar](2) NOT NULL,
 [BATCH] [varchar](15) NOT NULL,
 [WAREHOUSE] [varchar](2) NOT NULL,
 [YEAR] [varchar](4) NOT NULL,
 [JCNO] [varchar](2) NULL,
 [WEEK_NO] [varchar](2) NOT NULL,
 [OPEN_1] [numeric](13, 2) NULL,
 [OPEN_2] [numeric](13, 2) NULL,
 [OPEN_3] [numeric](13, 2) NULL,
 [SALE_1] [numeric](13, 2) NULL,
 [SALE_2] [numeric](13, 2) NULL,
 [SALE_3] [numeric](13, 2) NULL,
 [IN_1] [numeric](13, 2) NULL,
 [IN_2] [numeric](13, 2) NULL,
 [IN_3] [numeric](13, 2) NULL,
 [OUT_1] [numeric](13, 2) NULL,
 [OUT_2] [numeric](13, 2) NULL,
 [OUT_3] [numeric](13, 2) NULL,

 [EVENT_SPID] smallint,
 [EVENT_DATETIME] datetime,
 [EVENT_TYPE] VARchar(2),
 [EVENT_DESC] VARCHAR(MAX),
 CONSTRAINT [PK_LOG_ST_STOCK_BATCH] PRIMARY KEY CLUSTERED 
(
 [LOG_ID] ASC
)
)
END
go

IF OBJECT_ID('LOG_ST_BATCH') IS NULL
BEGIN
CREATE TABLE [dbo].[LOG_ST_BATCH](
 [LOG_ID] bigint not null identity(1,1),

 [COMPANY] [varchar](10) NOT NULL,
 [SKU] [varchar](20) NOT NULL,
 [BATCH] [varchar](15) NOT NULL,
 [PRICE_STRUC] [varchar](4) NOT NULL,
 [MANUFACTRING] [datetime] NULL,
 [EXPIRY] [datetime] NULL,
 [BatchIndex] [smallint] NULL,
 [SaleAlertDays] [numeric](18, 6) NULL,
 [SaleStopDays] [numeric](18, 6) NULL,
 [STANDARD_UNIT] [varchar](5) NULL,
 [STANDARD_WEIGHT] [numeric](16, 8) NULL,
 [STANDARD_FACTOR] [numeric](16, 8) NULL,
 [SELL_UNIT1] [varchar](5) NULL,
 [SELL_WEIGHT1] [numeric](16, 8) NULL,
 [SELL_FACTOR1] [numeric](16, 8) NULL,
 [SELL_UNIT2] [varchar](5) NULL,
 [SELL_WEIGHT2] [numeric](16, 8) NULL,
 [SELL_FACTOR2] [numeric](16, 8) NULL,
 [SELL_UNIT3] [varchar](5) NULL,
 [SELL_WEIGHT3] [numeric](16, 8) NULL,
 [SELL_FACTOR3] [numeric](16, 8) NULL,
 [SCHEME_WEIGHT1] [numeric](16, 8) NULL,
 [SCHEME_WEIGHT2] [numeric](16, 8) NULL,
 [SCHEME_WEIGHT3] [numeric](16, 8) NULL,
 [PURCHASE_UNIT1] [varchar](5) NULL,
 [PURCHASE_UNIT2] [varchar](5) NULL,
 [PURCHASE_UNIT3] [varchar](5) NULL,
 [PURCHASE_WEIGHT1] [numeric](16, 8) NULL,
 [PURCHASE_WEIGHT2] [numeric](16, 8) NULL,
 [PURCHASE_WEIGHT3] [numeric](16, 8) NULL,
 [PURCHASE_FACTOR1] [numeric](16, 8) NULL,
 [PURCHASE_FACTOR2] [numeric](16, 8) NULL,
 [PURCHASE_FACTOR3] [numeric](16, 8) NULL,
 [SELL_LENGTH1] [numeric](16, 8) NULL,
 [SELL_LENGTH2] [numeric](16, 8) NULL,
 [SELL_LENGTH3] [numeric](16, 8) NULL,
 [SELL_WIDTH1] [numeric](16, 8) NULL,
 [SELL_WIDTH2] [numeric](16, 8) NULL,
 [SELL_WIDTH3] [numeric](16, 8) NULL,
 [SELL_HEIGHT1] [numeric](16, 8) NULL,
 [SELL_HEIGHT2] [numeric](16, 8) NULL,
 [SELL_HEIGHT3] [numeric](16, 8) NULL,

 [EVENT_SPID] smallint,
 [EVENT_DATETIME] datetime,
 [EVENT_TYPE] VARchar(2),
 [EVENT_DESC] VARCHAR(MAX),
 CONSTRAINT [PK_LOG_ST_BATCH] PRIMARY KEY CLUSTERED 
(
 [LOG_ID] ASC
)
)
END
go

IF OBJECT_ID('LOG_ST_TRANS_HEAD') IS NULL
BEGIN
CREATE TABLE [dbo].[LOG_ST_TRANS_HEAD](
 [LOG_ID] bigint not null identity(1,1),

  [COMPANY] [varchar](10) NOT NULL,
 [DISTRIBUTOR] [varchar](10) NOT NULL,
 [DOCUMENT] [varchar](2) NOT NULL,
 [SUB_DOCUMENT] [varchar](2) NOT NULL,
 [DOC_NO] [varchar](15) NOT NULL,
 [NET_AMOUNT] [numeric](13, 2) NULL,
  [USER_ENTRY] [varchar](15) NULL,
 [DATE_ENTRY] [datetime] NULL,
 [USER_MODIFY] [varchar](15) NULL,
 [DATE_MODIFY] [datetime] NULL,
  [EVENT_SPID] smallint,
 [EVENT_DATETIME] datetime,
 [EVENT_TYPE] VARchar(2),
 [EVENT_DESC] VARCHAR(MAX),
 CONSTRAINT [PK_LOG_ST_TRANS_HEAD] PRIMARY KEY CLUSTERED 
(
 [LOG_ID] ASC
)
)
END
go

IF OBJECT_ID('LOG_ST_GIN_DETAIL') IS NULL
BEGIN
CREATE TABLE [dbo].[LOG_ST_GIN_DETAIL](
 [LOG_ID] bigint not null identity(1,1),

 [COMPANY] [varchar](10) NOT NULL,
 [DISTRIBUTOR] [varchar](10) NOT NULL,
 [DOCUMENT] [varchar](2) NOT NULL,
 [SUB_DOCUMENT] [varchar](2) NOT NULL,
 [DOC_NO] [varchar](12) NOT NULL,
 [SR_NO] [int] NOT NULL,
 [ENTRY_TYPE] [varchar](2) NOT NULL,
 [SKU] [varchar](20) NOT NULL,
 [SKU_TYPE] [varchar](2) NOT NULL,
 [BATCH] [varchar](15) NOT NULL,
 [WAREHOUSE] [varchar](2) NOT NULL,
 [DOC_DATE] [datetime] NULL,
 [REF_QTY1] [numeric](13, 2) NULL,
 [REF_QTY2] [numeric](13, 2) NULL,
 [REF_QTY3] [numeric](13, 2) NULL,
 [QTY1] [numeric](13, 2) NULL,
 [QTY2] [numeric](13, 2) NULL,
 [QTY3] [numeric](13, 2) NULL,
 [LOSS_QTY1] [numeric](13, 2) NULL,
 [LOSS_QTY2] [numeric](13, 2) NULL,
 [LOSS_QTY3] [numeric](13, 2) NULL,
 [AMOUNT] [numeric](13, 2) NULL,
 [DISCOUNT] [numeric](13, 2) NULL,
 [GST] [numeric](13, 2) NULL,
 [REMARKS] [varchar](50) NULL,
 [FirstQty] [numeric](12, 6) NULL,
 [SecondQty] [numeric](12, 6) NULL,
 [sku_index] [smallint] NULL,
 [VAN_QTY1] [decimal](13, 2) NULL,
 [VAN_QTY2] [decimal](13, 2) NULL,
 [VAN_QTY3] [decimal](13, 2) NULL,
 [SUGGESTED_GIN] [varchar](2) NULL,
 [WH_DISTRIBUTOR] [varchar](10) NULL,

 [EVENT_SPID] smallint,
 [EVENT_DATETIME] datetime,
 [EVENT_TYPE] VARchar(2),
 [EVENT_DESC] VARCHAR(MAX),
 CONSTRAINT [PK_LOG_ST_GIN_DETAIL] PRIMARY KEY CLUSTERED 
(
 [LOG_ID] ASC
)
)
END
go

/*
[2:55:30 PM] Afnan Memon: HERE YOU WILL GIVE DATABASE PATH. GIVE IT D://OSDP/ Database:

( NAME = Centegy_SnDPro_Log_dat,
    FILENAME = 'D:\\OSDP\Database\Centegy_SnDPro_Log_dat.mdf')
LOG ON
( NAME = Centegy_SnDPro_Log_log,
    FILENAME = 'D:\Work\SnD_Database\DATA\Centegy_SnDPro_Log_log.ldf') ;
    
    */