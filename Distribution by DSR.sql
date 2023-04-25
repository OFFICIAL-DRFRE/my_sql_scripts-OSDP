use Centegy_SNDPRO_UET
go
Declare @datefrom date = '20200401'
Declare @dateto   date = '20200406'

;with Sales (distributor,pjp,doc_date,[Customer Code],[Customer Name],sku,sku_code,gsv) as 
 (
	select cm.distributor ,pjp, cm.DOC_DATE, cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop  'Customer Code' ,
	p.NAME [Customer Name], S.LDESC 'SKU Name',c.sku,c.amount*1.15 'GSV'
	from CASHMEMO_DETAIL c 
	inner join sku s on s.sku = c.sku 
	inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
	inner join pop p on p.pop =cm.pop
	inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
	where cm.sub_document in ('01', '02', '03', '04') and cm.document ='cm' --and cm.visit_type = '02'
	and cm.DOC_DATE between @datefrom and @dateto
)
select * from (
select d.NAME 'DSR',SKU, count(distinct [Customer Name]) [uniqe count] from Sales 
inner join SECTION_POP_PERMANENT p on p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP=[Customer Code] and p.PJP=sales.pjp
inner join Pjp_head ph on ph.pjp=sales.pjp
inner join DSR D on d.dsr=ph.dsr
where doc_date between @datefrom and @dateto 
--and sku_code in (21032795,67474368, 34087550,67154420,21163708,32541243, 21056179,67474454,67469757,67576881,67647249,68117470)
group by sku,d.NAME
)t
pivot(  sum(t.[uniqe count])
for [DSR] in (
 [Serkalm kifle],
 [faysel],
 [zelalem ],
 [Luelseged girma]) ) as pivot_table

--select PJP,d.NAME, ( p.town+p.locality+p.slocality+p.POP) 'Unique Count',pp.NAME from POP_STATUS p
--left outer join DSR d on p.DSR=d.DSR
--inner join pop pp on p.town+p.LOCALITY+p.SLOCALITY+p.POP=pp.town+pp.LOCALITY+pp.SLOCALITY+pp.POP
--where STATUS_DATE between @datefrom and @dateto  and PJP='K002'
--group by pjp,d.NAME
