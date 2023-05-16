USE sndpro_copy
GO

DECLARE @table_name NVARCHAR(MAX)
DECLARE @constraint_name NVARCHAR(MAX)
DECLARE @constraint_type NVARCHAR(MAX)
DECLARE @referenced_table_name NVARCHAR(MAX)
DECLARE @referenced_constraint_name NVARCHAR(MAX)
DECLARE @pk_name NVARCHAR(MAX)

DECLARE cursor_tables CURSOR FOR
    SELECT top 1
        t.name,
        c.name,
        c.type_desc,
        OBJECT_NAME(fkc.referenced_object_id) as referenced_object_name,
        rc.name,
        pk.name as pk_name
    FROM 
        sys.tables t
        left JOIN sys.key_constraints c ON c.parent_object_id = t.object_id
        left JOIN sys.foreign_key_columns fkc ON fkc.parent_object_id = t.object_id AND fkc.constraint_object_id = c.object_id
        left JOIN sys.objects r ON r.object_id = fkc.referenced_object_id
        left JOIN sys.key_constraints rc ON rc.object_id = fkc.referenced_object_id
        left JOIN (
            SELECT i.object_id, i.name
            FROM sys.indexes i
            JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
            WHERE i.is_primary_key = 1
        ) pk ON pk.object_id = t.object_id
    WHERE 
        c.type_desc IN ('PRIMARY_KEY_CONSTRAINT', 'FOREIGN_KEY_CONSTRAINT')
    ORDER BY 
        t.name

OPEN cursor_tables

FETCH NEXT FROM cursor_tables INTO @table_name, @constraint_name, @constraint_type, @referenced_table_name, @referenced_constraint_name, @pk_name

WHILE @@FETCH_STATUS = 0
BEGIN
    DECLARE @sql NVARCHAR(MAX)

    IF @constraint_type = 'PRIMARY_KEY_CONSTRAINT'
    BEGIN
        IF EXISTS (
            SELECT *
            FROM sys.indexes i
            JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
            WHERE i.is_primary_key = 1
            AND OBJECT_NAME(i.object_id) = @table_name
        )
        BEGIN
            CONTINUE;
        END

        SET @sql = 'ALTER TABLE centegy_sndpro_uet.' + QUOTENAME(@table_name) + ' ADD CONSTRAINT ' + QUOTENAME('PK_' + @pk_name) + ' PRIMARY KEY ('

        SELECT @sql = @sql + QUOTENAME(c.name) + ','
        FROM sys.index_columns ic
        JOIN sys.columns c ON c.object_id = ic.object_id AND c.column_id = ic.column_id
        WHERE ic.object_id = OBJECT_ID('sndpro_copy.' + @table_name) AND ic.index_id = 1
        ORDER BY ic.key_ordinal

        SET @sql = LEFT(@sql, LEN(@sql) - 1) + ')'

        EXEC sp_executesql @sql
    END
    
    FETCH NEXT FROM cursor_tables INTO @table_name, @constraint_name, @constraint_type, @referenced_table_name, @referenced_constraint_name, @pk_name
END

CLOSE cursor_tables
DEALLOCATE cursor_tables
