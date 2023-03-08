use CENTEGY_SNDPRO_UET
Declare @datefrom date='20230201'
Declare @dateTo date='20230228'

select td.DISTRIBUTOR,d.NAME "KD Name",DA.DOC_NO, convert(varchar,td.doc_date,23) DOC_DATE, REF_NO,
--ROW_NUMBER() over(partition by da.Doc_no order by td.sku) 'Sr no.',td.BATCH 'Entry type',
td.sku+'- '+s.ldesc "SKU desc", td.REF_QTY1 CS,td.REF_QTY2 DZ,td.REF_QTY3 PC,
td.loss_qty1 l_CS,td.Loss_QTY2 l_DZ,td.loss_QTY3 l_PC, td.AMOUNT      
 from DA_HEAD da
inner join TRANS_DETAIL td on td.DISTRIBUTOR=da.DISTRIBUTOR and da.DOCUMENT=td.DOCUMENT and da.doc_no=td.doc_no
inner join distributor d on d.DISTRIBUTOR=da.DISTRIBUTOR
inner join sku s on s.SKU=td.sku  
where td.DOC_DATE between @datefrom and @dateTo  and da.STATUS=1 -- use 0 if you want to see the new DAs
order by td.DOC_DATE, DOC_NO,td.sku 
