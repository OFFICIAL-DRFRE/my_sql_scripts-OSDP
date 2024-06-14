use Centegy_SnDPro_UET
Declare @datefr date ='20230401'
Declare @dateto date ='20230526'
select 
distinct cm.distributor 'KD Code',
d.NAME 'KD Name',
CM.POP_NAME 'Outlet Name',
SE.LDESC 'Channel Type',
cm.town+cm.locality+cm.slocality+cm.POP 'POP_code', 
convert(varchar,cm.DOC_DATE,23) Doc_date, 
Cm.DOC_NO,year(cm.DOC_DATE) 'Year',
Month(cm.DOC_DATE)'Month',
pj.pjp as  'pjp', 
c.sku,
ds.NAME AS DSR,S.LDESC 'SKU Name',
cast(((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) as int) 'Number of pcs', 
round( (sum(c.amount) + isnull( sum(sd.discount+sd.gst),0)*1.15), 2) 'NIV',
case when p.PERFECT_STORE_LEVEL = '001' then 'No' else 'PS' end as 'PS staus'
from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO = c.DOC_NO
inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.town+cm.locality+cm.slocality+cm.pop
inner join SUB_ELEMENT se on p.SUB_ELEMENT=se.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR
left join scheme_discount_detail sd on sd.doc_no=c.doc_no and sd.sku=c.sku and sd.SUB_DOCUMENT=c.SUB_DOCUMENT 
where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  and cm.visit_type='02' and cm.Delv_date between @datefr and @dateto 
group by cm.distributor,d.NAME ,CM.POP_NAME , SE.LDESC,cm.town+cm.locality+cm.slocality+cm.POP,cm.DOC_DATE, Cm.DOC_NO,year(cm.DOC_DATE),
 Month(cm.DOC_DATE),pj.pjp, ds.NAME,S.LDESC,c.sku,c.amount, ((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)),p.PERFECT_STORE_LEVEL
order by DOC_DATE desc