DECLARE @oldDist_code VARCHAR(10)
DECLARE @newDist_code VARCHAR(10)

SET @oldDist_code = (SELECT TOP 1 PLC_LOCACODE FROM PR_GN_LC_LOCATION)
SET @newDist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR  where sales_organization is not NULL)

EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

DECLARE @table_name VARCHAR(100)
DECLARE @script VARCHAR(500)

DECLARE DistColumnTables CURSOR
    FOR SELECT  table_name
        FROM    information_schema.columns c
        WHERE   column_name = 'plc_locacode'
                AND EXISTS ( SELECT 1
                             FROM   INFORMATION_SCHEMA.tables
                             WHERE  table_name = c.table_name
                                    AND table_type <> 'VIEW' ) ;

OPEN DistColumnTables ;

FETCH NEXT FROM DistColumnTables INTO @table_name
WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @table_name
	
        SET @script = '
		UPDATE ' + @table_name + ' SET plc_locacode = ''' + @newDist_code
            + ''' WHERE plc_locacode = ''' + @oldDist_code + ''''
	
        EXEC ( @script
            )

        FETCH NEXT FROM DistColumnTables INTO @table_name
    END
CLOSE DistColumnTables ;
DEALLOCATE DistColumnTables ;

EXEC sp_msforeachtable 'ALTER TABLE ? CHECK CONSTRAINT all'


