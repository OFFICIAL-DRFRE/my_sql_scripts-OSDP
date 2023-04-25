use centegy_sndpro_uet
Declare @dateFrom date ='26-mar-2022'
Declare @dateto   date ='26-mar-2022'
Declare @van int = '01'
select --d.NAME 'KD Name',
 convert(varchar, c.DOC_DATE, 103) 'Invoice Date', --ds.NAME,
case when p.poptype='01' then 'Retail' when p.poptype='04'
then 'Sub D' when p.poptype='03' then 'Key Account' else 'Wholesale' end as 'Outlet Type',   v.DESCRIPTION as VAN, s.SKU 'SKU Code', S.LDESC 'SKU Name' ,
sum(convert(int,c.QTY1)) CS,SUM(convert(int,c.Qty2)) DZ,sum(convert(int,QTY3)) PC,   
sum(convert( int,(C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))'Total No. of PCs',
convert(money, sum( (c.amount+isNull(sdd.discount,0))*1.15),2) 'Net Amount'
from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.Town+cm.locality+cm.slocality+cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
left join  SCHEME_DISCOUNT_DETAIL sdd on sdd.doc_no=c.doc_no and sdd.DOCUMENT=c.DOCUMENT and sdd.SUB_DOCUMENT=c.SUB_DOCUMENT and sdd.sku=c.SKU
inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR
inner join VEHICLE v on v.VEHICLE= ds.VEHICLE
where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  and 
cm.Delv_date between @datefrom and @dateto  and ds.VEHICLE =@van
--and s.LDESC like 'Lifebuoy%'  -- for specific SKU extract
--and p.poptype='01'  --Retail outlets = 01 and WS outlet =02
group by d.name, c.doc_date,v.DESCRIPTION, --ds.NAME, 
p.poptype,s.SKU, s.ldesc 
order by c.DOC_DATE, --ds.NAME, 
[Outlet Type],s.LDESC asc