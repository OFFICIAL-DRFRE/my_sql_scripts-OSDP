use centegy_sndpro_uet
Declare @datefr date = '20230101'
Declare @dateto date = '20230131'

select td.DISTRIBUTOR 'DT code',d.NAME 'KD Name', td.DOC_NO,convert(varchar, td.DOC_DATE, 23) Doc_date, st.LDESC 'Sku type',
w.ldesc Warehouse, td.SKU, s.LDESC SKU,
cast(QTY1 as int) CS, cast(QTY3 as int) DZ, cast(QTY3 as int) PC , 
cast( REPLACE(CONVERT(varchar(200), (CAST(SUM(td.amount+td.gst) AS money)), 1), '.00', '') as varchar) 'Total Amount' from TRANS_DETAIL td
inner join sku s on s.sku = td.SKU
inner join distributor d on d.DISTRIBUTOR=td.DISTRIBUTOR
inner join WAREHOUSE w on w.WAREHOUSE=td.WAREHOUSE
inner join SKU_TYPE st on st.SKU_TYPE=td.SKU_TYPE
where document='SA' and SUB_DOCUMENT='05' and DOC_DATE between @datefr and @dateto
order by Doc_date desc, DOC_NO