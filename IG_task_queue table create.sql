USE [CENTEGY_SNDPRO_UET]
GO

/****** Object:  Table [dbo].[IG_Task_Queue]    Script Date: 10/26/2021 6:31:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IG_Task_Queue](
	[T_Queue_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[T_Company] [nvarchar](10) NOT NULL,
	[T_TenantCode] [nvarchar](10) NOT NULL,
	[T_Task_Type] [nvarchar](2) NULL,
	[T_Task_ID] [nvarchar](50) NULL,
	[Batch_ID] [int] NULL,
	[SCH_ID] [int] NULL,
	[T_Added_Date] [datetime] NOT NULL,
	[T_StartProcessTime] [datetime] NULL,
	[T_Completion_Date] [datetime] NULL,
	[T_Status] [int] NULL,
	[TP_TaskID] [nvarchar](50) NULL,
	[T_Remarks] [nvarchar](2000) NULL,
	[TempRetryCount] [int] NULL,
	[DispatchRetryCount] [int] NULL,
	[ChunkSeqNo] [int] NULL,
	[T_FileName] [varchar](max) NULL,
	[UPLOAD_STARTDATE] [datetime] NULL,
	[UPLOAD_ENDDATE] [datetime] NULL,
	[REPROCESS] [nvarchar](max) NULL,
 CONSTRAINT [PK_IG_Task_Queue] PRIMARY KEY CLUSTERED 
(
	[T_Queue_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[IG_Task_Queue] ADD  CONSTRAINT [DF_IG_Task_Queue_T_Status]  DEFAULT ((0)) FOR [T_Status]
GO


