use Centegy_SNDPRO_UET

Declare @datefrom Date ='01-april-2020'
declare @dateto date  = '28-april-2020'
;with sales as (
select distinct p.NAME [Customer Name],pt.SDESC [poptype],cm.DOC_NO, cm.DOC_DATE,cm.TOWN+cm.locality+cm.SLOCALITY+cm.POP [Customer Code], c.sku,S.LDESC 'SKU Name'
, ((QTY1*SELL_FACTOR2)+(QTY2*SELL_FACTOR2)+qty3) [QTY]
	from CASHMEMO_DETAIL c 
	inner join sku s on s.sku = c.sku 
	inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
	inner join pop p on p.town+p.locality+p.slocality+p.pop =cm.town+cm.locality+cm.slocality+cm.pop and p.ACTIVE=1
	inner join POP_TYPE pt on pt.POPTYPE=p.POPTYPE
	inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
	where cm.sub_document in ('01','02','03','04') and cm.document ='cm' and cm.visit_type = '02'
	and cm.doc_date between @datefrom and @dateto and 
	c.sku in (21032795,67154420,68647412,67576885,67474454,67474368,68187675,67474374,67474441)
	
)select * from (
select distinct ph.LDESC 'PJP',s.LDESC [section],spp.POP_INDEX, [Customer Name],Street 'Address',[sku name],convert(int,count (QTY)) distro
 from Sales c
left join SECTION_POP_PERMANENT spp on spp.TOWN+ spp.LOCALITY+spp.slocality+spp.POP = c.[Customer Code]
inner join PJP_HEAD ph on ph.pjp=spp.PJP
inner join pop p on p.town+p.locality+p.slocality+p.pop =[Customer Code]
inner join section s on s.section=spp.section
group by s.LDESC,spp.POP_INDEX, [Customer Name], street,[SKU Name],ph.LDESC 
)t
 pivot( 
sum(t.Distro)
 FOR [SKU name] IN (
 [Knorr All  8g], 
 [KNORR CHICKEN],
 [LIFEBUOY SKIN CLEANSING BAR 70G],
 [LIFEBUOY SKN CLSNG BAR LEMON FRESH 70G],
 [Sunlight POWDER SKY + CHEETAH 72*120GM],
 [Signal TP CF 30g],
 [SUNLIGHT BAR SOAP 220],
 [lUX ST 70g],
 [lUX SC 70g])
 ) as Pivot_Table 
 order by pop_index asc

