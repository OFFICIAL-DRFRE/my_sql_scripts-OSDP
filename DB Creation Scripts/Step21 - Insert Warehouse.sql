delete from stock_batch_daily
go
delete from WAREHOUSE
Go
DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = (select COMPANY from COMPANY)
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)
--select * from WAREHOUSE
insert into WAREHOUSE
select distinct
@comp_code as  COMPANY,
@dist_code as  Distributor,
Warehouse_Code as warehouse,
LEFT(Warehouse_Name,15) as sdesc,
Warehouse_Name as ldesc,
'A' as Warehouse_type,
'1' as ischanged,
--NULL AS WH_DISTRIBUTOR,
null as row_ver,
'A' as Stock_allocation
from DL_Distributor_Warehouse
go
