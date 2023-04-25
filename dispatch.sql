Declare @datefrom date= '20220201'
Declare @dateTo date= '20220228'

select td.doc_no,SHIPMENT_NO,INVOICE_NO,s.sku,s.ldesc sku_desc,BATCH,ref_qty1 CS,ref_qty2 Dz,REF_QTY3 PC,convert(varchar, td.doc_date,23) Doc_date ,
TRUCK_NO,USER_ENTRY,Convert(varchar, DATE_ENTRY,23) Date_entry ,convert(varchar, Schedule_Delv_Date,23) Schedule_delv_date from DA_HEAD da
inner join TRANS_DETAIL td on td.DISTRIBUTOR=da.DISTRIBUTOR and da.DOCUMENT=td.DOCUMENT and td.doc_no=da.doc_no
inner join sku s on s.SKU=td.sku  
where td.DOC_DATE between @datefrom and @dateto  and 
order by td.DOC_DATE asc