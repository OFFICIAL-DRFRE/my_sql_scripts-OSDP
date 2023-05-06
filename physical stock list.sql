use centegy_sndpro_uet

Declare @datefr date = '20230314'

select pd.DOC_NO,convert( varchar, pd.DOC_DATE, 23) 'Doc date', 
	w.ldesc 'Warehouse', st.ldesc 'Sku Type',
	pd.SKU, s.ldesc sku, 
	convert(varchar, cast(ref_qty1 as int)) +' - '+
	convert(varchar, cast(ref_qty2 as int))  +' - '+ 
	convert(varchar, cast(REF_QTY3 as int)) 'Sys stock',
	convert(varchar, isnull(cast(qty1 as int), 0))  +' - '+ 
	convert(varchar, isnull(cast(qty2 as int), 0))  +' - '+ 
	convert(varchar, isnull(cast(QTY3 as int), 0)) 'Phy Stock' ,
	ph.STATUS, ph.USER_MODIFY, ph.DATE_MODIFY
from PHYSICAL_STOCK_DETAIL pd
	inner join PHYSICAL_STOCK_HEAD ph on ph.DOC_NO=pd.DOC_NO and status != '0'
	inner join SKU s on s.sku = pd.SKU
	inner join SKU_TYPE st on st.SKU_TYPE=pd.SKU_TYPE
	inner join warehouse w on w.warehouse = ph.warehouse
where  DATE_ENTRY >= @datefr --AND STATUS ='A'
		--and REF_QTY1=QTY1 and ref_qty2 = qty2 and REF_QTY3 = QTY3
order by 2, 1, 5, status