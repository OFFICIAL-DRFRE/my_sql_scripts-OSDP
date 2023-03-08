use CENTEGY_SNDPRO_UET
Declare @datefrom date = '20230101'
Declare @dateTo date   = '20230131'

select td.DISTRIBUTOR,d.NAME "KD Name", convert(varchar,td.doc_date,23) DOC_DATE,td.DOC_NO,REF_NO, INVOICE_NO, convert(varchar, TRUCK_NO) Truck_no,convert(varchar,TRUCK_COMP) Truck_comp, 
convert(smalldatetime,TRUCK_ARRIVAL) Truck_arrival,CONVERT(smallDateTime,TRUCK_UNLOAD) 'truck unload',convert(varchar,da.SHIPMENTDATE,23) Shipment_Date, 
convert(varchar, Schedule_Delv_Date,23) SCHEDULED_DELV_DATE ,td.sku,s.ldesc "SKU desc", td.REF_QTY1 CS,td.REF_QTY2 DZ,td.REF_QTY3 PC,
 cast(((td.REF_QTY1*s.sell_factor1)+(REF_QTY2*s.sell_factor2)+(REF_QTY3*s.sell_factor3)) as int) 'Total in pcs',  td.AMOUNT  , td.GST     
 from DA_HEAD da
inner join TRANS_DETAIL td on td.DISTRIBUTOR=da.DISTRIBUTOR and da.DOCUMENT=td.DOCUMENT and da.doc_no=td.doc_no
inner join distributor d on d.DISTRIBUTOR=da.DISTRIBUTOR
inner join sku s on s.SKU=td.sku  
where td.DOC_DATE between @datefrom and @dateTo  and da.STATUS=1
order by td.DOC_DATE desc
