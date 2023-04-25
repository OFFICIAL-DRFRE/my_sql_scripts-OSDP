use Centegy_SnDPro_UET

update CASHMEMO_DETAIL set sku=( select sku from sku 
where LDESC like 'dovcon IR 400ml') 
--select * from CASHMEMO_DETAIL
where sku=32027351 and DOC_DATE='20190705' 