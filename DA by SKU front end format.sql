use CENTEGY_SNDPRO_UET
Declare @datefrom date='20210601'
Declare @dateTo date='20230630'

select 
	td.DISTRIBUTOR,
	d.NAME "KD Name",
	DA.DOC_NO, 
	convert(varchar,td.doc_date,23) DOC_DATE, 
	REF_NO,
	td.sku, s.ldesc 'SKU desc', 
	cast( td.REF_QTY1 as int) CS,
	cast( td.REF_QTY2 as int) DZ,
	cast( td.REF_QTY3 as int) PC,
	cast( td.loss_qty1 as int) loss_CS ,
	cast( td.Loss_QTY2 as int) loss_DZ ,
	cast( td.loss_QTY3 as int) loss_PC , 
	td.AMOUNT      
from DA_HEAD da
	inner join TRANS_DETAIL td on td.DISTRIBUTOR=da.DISTRIBUTOR and da.DOCUMENT=td.DOCUMENT and da.doc_no=td.doc_no
	inner join distributor d on d.DISTRIBUTOR=da.DISTRIBUTOR
	inner join sku s on s.SKU=td.sku  
where td.DOC_DATE between @datefrom and @dateTo  and da.STATUS=1 -- use 0 if you want to see the new DAs
order by td.DOC_DATE, DOC_NO,td.sku 