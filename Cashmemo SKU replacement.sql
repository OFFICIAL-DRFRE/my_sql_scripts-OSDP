select * from CASHMEMO_DETAIL 

Update CASHMEMO_DETAIL set SKU= (select sku from SKU where LDESC like 'lux sc 175g')
where sku=21157993 and DOC_DATE='20190701'


select * from sku