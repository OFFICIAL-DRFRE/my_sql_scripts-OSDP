declare @date date ='20200225'

;with tvo as (select PJP,d.NAME,count(  p.DISTRIBUTOR+town+LOCALITY+SLOCALITY+POP) as 'Total no. of visited outlet' from pop_status_detail p 
left outer join DSR d on d.DSR=p.DSR and d.DISTRIBUTOR=p.DISTRIBUTOR
where STATUS_DATE= @date
group by pjp,NAME
),
tpj as (SELECT spp.distributor, spp.PJP, spp.SECTION,s.ldesc,jw.year ,pd.Week_no, COUNT(spp.distributor+spp.town+spp.locality+spp.slocality+spp.POP) as [Total PJP]
from section_pop_permanent spp
inner join PJP_detail pd on pd.distributor = spp.distributor and pd.PJP = spp.PJP and pd.section=spp.section
inner join JC_WEEK jw on jw.WEEK_NO = pd.WEEK_NO
inner join SECTION s on s.SECTION=spp.SECTION
where jw.START_DATE <=@date  and jw.END_DATe >= @date    --and  day_of_week = DATENAME(dw,GETDATE())
group by spp.distributor,spp.PJP,spp.section,s.LDESC,jw.year,pd.week_no ),
sales as
(
select cm.distributor 'KD Code', cm.DOC_DATE,p.NAME 'Customer Name',pjp, S.LDESC 'SKU Name' ,c.sku,c.amount*1.15 'GSV',
Convert(int, (C.QTY1*s.SELL_FACTOR1)+(QTY2*s.SELL_FACTOR2)+(QTY3)) 'Total number in PCs'
from CASHMEMO_DETAIL c 
inner join sku s on s.sku = c.sku and s.SKU in (21032795,34087550,67154420,21163708,32541243, 21056179,67474454 )
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
where cm.sub_document in ('01','02','04') and cm.document ='cm' and cm.visit_type = '02'
and cm.DOC_DATE = @date
)

select DISTRIBUTOR,tvo.pjp,name,YEAR,WEEK_No,[total pjp],[Total no. of visited outlet],[SKU Name],count(Distinct [Customer Name]) [total Productive Outlets]from tpj
inner join tvo on tpj.PJP=tvo.PJP
inner join sales on sales.[KD Code]=tpj.DISTRIBUTOR and sales.PJP =tvo.pjp
 where SECTION in (select distinct section from PJP_DETAIL where WED=1 ) 
 group by distributor,tvo.PJP,name,YEAR,WEEK_NO,[Total PJP], [SKU Name] ,[Total no. of visited outlet]