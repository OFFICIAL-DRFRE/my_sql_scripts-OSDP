use Centegy_SNDPRO_UET
go

Declare @dateFrom date ='01-feb-2020'
Declare @Dateto date ='19-feb-2020'

;with Sales (distributor,pjp,doc_date,customer,sku,sku_code,gsv) as 
(
  select cm.distributor 'KD Code',cm.pjp, cm.DOC_DATE,p.NAME 'Customer Name', S.LDESC 'SKU Name',
  c.sku,c.amount*1.15 'GSV'
  from CASHMEMO_DETAIL c 
  inner join sku s on s.sku = c.sku 
  inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
  inner join pop p on p.pop =cm.pop
  inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
  where cm.sub_document in ('01','02','03','04') and cm.document ='cm' -- and cm.visit_type = '02'
  --and cm.Delv_date between '20190701' and '20190708' --order by DOC_DATE desc
)

select sku,count(distinct  customer) as 'Unique count' from Sales s
inner join PJP_HEAD p on p.PJP=s.pjp
where doc_date between @dateFrom and @Dateto 
group by sku
