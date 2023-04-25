alter table mtd_data alter column distributor varchar(10)
alter table sku_device  alter column distributor varchar(10)
alter table pop_device alter column distributor varchar(10)

DECLARE @oldDist_code VARCHAR(10)
DECLARE @newDist_code VARCHAR(10)

SET @oldDist_code = (select DISTRIBUTOR from DISTRIBUTOR)
SET @newDist_code = '15490031'

EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

DECLARE @table_name VARCHAR(100)
DECLARE @script VARCHAR(500)

DECLARE DistColumnTables CURSOR
    FOR SELECT  table_name
        FROM    information_schema.columns c
        WHERE   column_name = 'distributor'
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
		UPDATE ' + @table_name + ' SET distributor = ''' + @newDist_code
            + ''' WHERE distributor = ''' + @oldDist_code + ''''
	
        EXEC ( @script
            )

        FETCH NEXT FROM DistColumnTables INTO @table_name
    END
CLOSE DistColumnTables ;
DEALLOCATE DistColumnTables ;

EXEC sp_msforeachtable 'ALTER TABLE ? CHECK CONSTRAINT all'


