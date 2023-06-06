USE other_working_DB;

-- Disable all constraints
EXEC sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT all'

-- Delete data from all tables
DECLARE @table_name NVARCHAR(MAX);

DECLARE cursor_tables CURSOR FOR
    SELECT QUOTENAME(s.name) + N'.' + QUOTENAME(t.name)
    FROM sys.tables t
    INNER JOIN sys.schemas s ON s.schema_id = t.schema_id
	where type = 'U'
	
OPEN cursor_tables

FETCH NEXT FROM cursor_tables INTO @table_name

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @sql_delete NVARCHAR(MAX)

    SET @sql_delete = 'DELETE FROM ' + @table_name;

    EXEC sp_executesql @sql_delete

    FETCH NEXT FROM cursor_tables INTO @table_name
END

CLOSE cursor_tables
DEALLOCATE cursor_tables

-- Enable all constraints
--EXEC sp_msforeachtable 'ALTER TABLE ? with check CHECK CONSTRAINT all'