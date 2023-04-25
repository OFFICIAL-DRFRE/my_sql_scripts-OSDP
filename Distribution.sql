with Sales (distributor,doc_date,customer,sku,sku_code,gsv,qty) as (

select cm.distributor 'KD Code', cm.DOC_DATE,p.NAME 'Customer Name', S.LDESC 'SKU Name' ,c.sku,c.amount*1.15 'GSV',Convert(int, (C.QTY1*s.SELL_FACTOR1)+(QTY2*s.SELL_FACTOR2)+(QTY3)) 'Total number in PCs'
from CASHMEMO_DETAIL c 
inner join sku s on s.sku = c.sku 
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
where cm.sub_document in ('01','02','04') and cm.document ='cm' and cm.visit_type = '02'
--and cm.Delv_date between @datefrom and @dateto --order by DOC_DATE desc
)

--select * from sales where doc_date between '20190701' and '20190708'

select sku,count(distinct customer) as 'Unique count'   from Sales where doc_date between '20190701' and '20190708' and
sku_code in (21032795,34087550,67154420,21163708,32541243, 21056179,67474454 )
group by sku
