select t.name [Table], b.name [Index],avg_fragmentation_in_percent,
		tSize.Total_MB  tableSize_MB, 
		iSize.Total_MB  IndexSize_MB, tSize.RowCounts  tableRowCounts
FROM sys.dm_db_index_physical_stats (DB_ID(), object_id('dbo.Tablename') , NULL, NULL, DEFAULT) AS a  
inner JOIN sys.indexes AS b ON a.object_id = b.object_id AND a.index_id = b.index_id   
INNER JOIN sys.tables t  ON  a.[object_id] = t.[object_id] 

inner join (
SELECT 
t.Name AS TableName,
p.rows AS RowCounts,
CAST(ROUND((SUM(a.total_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Total_MB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.Name, s.Name, p.Rows
		) tSize on tSize.TableName = t.name


inner join (
SELECT 
i.Name AS IndexName,
t.Name AS TableName,
p.rows AS RowCounts,
CAST(ROUND((SUM(a.total_pages) / 128.00), 2) AS NUMERIC(36, 2)) AS Total_MB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN sys.allocation_units a ON p.partition_id = a.container_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
GROUP BY t.Name, i.Name, p.Rows
		) iSize on iSize.IndexName = b.name and iSize.TableName = t.Name

where b.name is not null and avg_fragmentation_in_percent > 20 and page_count > 100
order by avg_fragmentation_in_percent desc
 