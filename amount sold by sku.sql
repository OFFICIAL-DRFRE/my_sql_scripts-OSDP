use centegy_sndpro_uet
Declare @dateFrom date ='01-dec-2019'
Declare @dateto   date ='29-feb-2020'
select d.NAME 'KD Name',
convert (varchar,cm.DOC_DATE,23) DOC_DATE,pj.pjp as  'pjp',ds.NAME AS NAME,case when p.poptype='01' then 'Wholesale' when p.poptype='04' 
then 'Sub D' when p.poptype='03' then 'Key Account' else 'Retail' end as 'Outlet Type', S.LDESC 'SKU Name' , Sum(c.amount*1.15) 'GSV',
sum(convert( int,(C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))) 'Number of pcs' from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.Town+cm.locality+cm.slocality+cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR
where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  and 
cm.Delv_date between @datefrom and @dateto 
group by d.name, cm.doc_date,pj.pjp,ds.name,p.poptype, s.ldesc
order by cm.DOC_DATE desc