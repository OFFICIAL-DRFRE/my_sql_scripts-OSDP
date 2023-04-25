use centegy_sndpro_uet
Declare @dateFrom date ='01-jan-2020'
Declare @dateto   date ='31-dec-2021'
;with sales as (
select d.Distributor 'DT CODE' ,d.NAME 'KD Name',pt.LDESC as 'Outlet Type',cm.DOC_DATE,c.sku, S.LDESC 'SKU Name',
p.name Customer_name, se.ldesc Channeltype, convert(int, sum(QTY1)) CS,convert(int, sum(QTY2)) DZ,convert(int, sum(QTY3)) PC,
sum(convert( int,(C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))) 'Number of pcs',
sum (convert(money,c.amount)) 'GSV' ,sum(Convert(money,isNull(sdd.discount,0),2)) 'Discount ' ,
Sum(convert(money, (c.AMOUNT+IsNull(sdd.DISCOUNT,0))*0.15,2)) 'GST', convert(money,
sum( (c.amount+isNull(sdd.discount,0))*1.15),2) 'Net Amount',
SELL_FACTOR1,SELL_FACTOR2,SELL_FACTOR3 from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
left join SCHEME_DISCOUNT_DETAIL sdd on sdd.doc_no=c.doc_no and sdd.DOCUMENT=c.DOCUMENT and sdd.SUB_DOCUMENT=c.SUB_DOCUMENT and sdd.sku=c.SKU
inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.Town+cm.locality+cm.slocality+cm.pop
inner join POP_TYPE pt on pt.POPTYPE=p.POPTYPE
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
where cm.sub_document in ('01','02','03','04') and cm.document ='cm' and
cm.Delv_date between @datefrom and @dateto 
group by d.distributor,d.name,pt.LDESC,p.name,cm.DOC_DATE, c.sku,s.ldesc, se.ldesc,s.SELL_FACTOR1,SELL_FACTOR2,SELL_FACTOR3
)
select [DT CODE],[KD Name], [Channeltype],MONTH(doc_date) 'Month',doc_date,customer_name, UPPER([sku name]) SKU_desc, floor( [Number of pcs]/SELL_FACTOR1) Cs,
ISNULL(FLOOR(([Number of pcs]-(floor([Number of pcs]/SELL_FACTOR1)*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0))),0) DZ,
ISNULL( floor([Number of pcs] -((floor( [Number of pcs] /NullIF(SELL_FACTOR1,0))*SELL_FACTOR1)+
(FLOOR(([Number of pcs]-(floor([Number of pcs]/NullIF(SELL_FACTOR1,0))*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0)))*SELL_FACTOR2))) ,0) PC,
convert(int,[NUMBER of PCS],2) TOTAL_PCs,GSV,GST,[Net Amount]
from sales
where sales.[Outlet Type]='sub Distributor' or sales.[channeltype] ='MINI SUB_D'
order by [DT CODE],[KD Name], [Outlet Type], [SKU Name] asc
