USE [XFULET]



GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[RtUploadSyncKeys_Insert]
		@SyncKey = N'f69b54c5-9b10-4640-b59d-f08b70473c6f',
		@IncludeVoidDocument = 1

SELECT	'Return Value' = @return_value


select * from rtuploadsynckeys where synckey='f69b54c5-9b10-4640-b59d-f08b70473c6f '

GO
