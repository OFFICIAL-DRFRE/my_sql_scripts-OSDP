use Centegy_sndpro_uet
Declare @datefrom date = '20221201'

select t.DOC_NO, convert(varchar, t.DOC_DATE, 106) Date,s.sku, s.ldesc, cast( REF_QTY1 as int) CS, cast(AMOUNT as money) Amount, INVOICE_NO, 
case when d.STATUS = 1 then 'Accepted' else ' ' end as DA_Status from TRANS_DETAIL t
inner join DA_HEAD d on d.DOC_NO=t.DOC_NO and t.DOCUMENT=d.DOCUMENT
inner join sku s on s.sku = t.SKU
where t.DOC_DATE > @datefrom 
--and t.SKU in ( select sku from sku where ldesc like 'Life%') -- uncomment if you want to search by SKU
order by t.DOC_DATE,t.DOC_NO, SKU