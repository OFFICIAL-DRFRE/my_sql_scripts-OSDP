USE [YourDatabaseName]
GO

EXEC sp_MSforeachtable '
IF OBJECTPROPERTY(OBJECT_ID(''?''), ''TableHasIdentity'') = 1
    BEGIN
        SET IDENTITY_INSERT ? ON
    END
'
