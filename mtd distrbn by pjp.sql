use Centegy_SNDPRO_UET
go
Declare @datefrom date = '20201101'
Declare @dateto   date = '20201112'

;with Sales (distributor,pjp,doc_date,[Customer Code],[Customer Name],sku,sku_code,gsv) as 
 (
	select cm.distributor ,pjp, cm.DOC_DATE, cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop  'Customer Code' ,
	p.NAME [Customer Name], S.LDESC 'SKU Name',c.sku,c.amount*1.15 'GSV'
	from CASHMEMO_DETAIL c 
	inner join sku s on s.sku = c.sku 
	inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
	inner join pop p on p.pop =cm.pop
	inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
	where cm.sub_document in ('01', '02', '03', '04') and cm.document ='cm'   
	--and cm.visit_type = '02'
	and cm.DOC_DATE between @datefrom
	 and @dateto
)

--select * from sales where doc_date between '20190701' and '20190708'

select pjp,
 SKU ,count(distinct [Customer Code]) as 'Unique count' from Sales 
where doc_date between '20201101'and'20201112'and 
sku_code in (21032795,67474368, 34087550,67154420,21163708, 21056179,67474454,
67469757,67576881,67647249,21106625 ,67474374,67474441,68359450,68359459,68187675,	67576885,68359454,68390859,
34089105,21166805 )
group by SKU,pjp


select PJP,d.NAME, COUNT(distinct POP) 'Unique Count' from POP_STATUS p
left outer join DSR d on p.DSR=d.DSR
where STATUS_DATE between '20201101'and '20201110'
 group by pjp,name