use CENTEGY_SNDPRO_UET
Declare @datefrom date='20210101'
Declare @dateTo date='20211231'

select td.DISTRIBUTOR,convert(varchar,td.doc_date,23) DOC_DATE,td.DOC_NO,REF_NO, INVOICE_NO, TRUCK_NO,TRUCK_COMP, 
TRUCK_ARRIVAL,TRUCK_UNLOAD,NET_AMOUNT,da.SHIPMENTDATE, convert(varchar, Schedule_Delv_Date,23) SCHEDULED_DELV_DATE        
 from DA_HEAD da
inner join TRANS_DETAIL td on td.DISTRIBUTOR=da.DISTRIBUTOR and da.DOCUMENT=td.DOCUMENT and da.doc_no=td.doc_no
inner join sku s on s.SKU=td.sku  
where td.DOC_DATE between @datefrom and @dateTo  
order by td.DOC_DATE desc
