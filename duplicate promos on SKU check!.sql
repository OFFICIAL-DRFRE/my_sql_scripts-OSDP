use centegy_sndpro_uet
Declare @datefr date ='20220101'
Declare @dateto date ='20220120'
select distinct c.doc_no, c.sku,s.LDESC sku,count(*) duplicates from CASHMEMO_DETAIL c
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join scheme_discount_detail sd on sd.doc_no=c.doc_no and sd.sku=c.sku and sd.SUB_DOCUMENT=c.SUB_DOCUMENT 
inner join Sku s on c.sku=s.SKU
where cm.DELV_DATE between @datefr and @dateto
group by c.DOC_no, c.SKU,s.LDESC 
having count(*)>1
order by 4 desc

--select * from CASHMEMO_DETAIL where DOC_NO='21M001000240' and sku=67474441
--select * from SCHEME_DISCOUNT_DETAIL where DOC_NO='21M001000240' and sku=67474441
