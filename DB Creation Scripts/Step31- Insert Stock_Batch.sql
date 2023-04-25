DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = '23'
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into STOCK_BATCH
select distinct
@comp_code as  COMPANY,
@dist_code as  Distributor,
SKU as SKU,
SKU_TYPE as SKU_Type,
'1-1' as Batch,
WAREHOUSE as Warehouse,
(select distinct YEAR from JC_WEEK where (select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) between start_date and end_date) as Year,
(select distinct JCNO from JC_WEEK where (select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) between start_date and end_date) as JCNO,
(select distinct WEEK_NO from JC_WEEK where (select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) between start_date and end_date) as Week_NO,
left(max(Open_1)+'.00',9) as Open_1,
left(max(Open_2)+'.00',9) as Open_2,
left(max(Open_3)+'.00',9) as Open_3,
'0.00' as Sale_1,
'0.00' as Sale_2,
'0.00' as Sale_3,
'0.00' as In_1,
'0.00' as In_2,
'0.00' as In_3,
'0.00' as Out_1,
'0.00' as Out_2,
'0.00' as Out_3,
NULL as WH_DISTRIBUTOR,
PRICE_AVG3=NULL
from Dl_Stock_batch dlsb where exists (select 1 from BATCH b where dlsb.sku=b.SKU)
group by sku, SKU_TYPE,WAREHOUSE
go


