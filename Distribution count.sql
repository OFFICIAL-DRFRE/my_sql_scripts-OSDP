use Centegy_SNDPRO_UET
go
Declare @dateFrom date ='26-jul-2020'
Declare @Dateto date   ='29-jul-2021'

;with Sales (distributor,pjp,doc_date,customer,sku,sku_code,discount,gsv) as 
(
  select cm.distributor 'KD Code',cm.pjp, cm.DOC_DATE,p.NAME 'Customer Name', S.LDESC 'SKU Name',
  c.sku,sd.DISCOUNT, amount*1.15 'GSV'
  from CASHMEMO_DETAIL c 
  inner join sku s on s.sku = c.sku 
  inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
  left join SCHEME_DISCOUNT_DETAIL sd on sd.DOC_NO=c.doc_no and sd.sku=c.SKU
  inner join pop p on p.pop =cm.pop
  inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
  where cm.sub_document in ('01','02','03','04') and cm.document ='cm' and cm.visit_type = '02'
)
select d.distributor,d.name, sku,count(distinct  customer) as 'Unique count' from Sales s
inner join PJP_HEAD p on p.PJP=s.pjp
inner join distributor d on d.distributor =s.distributor
where doc_date between @dateFrom and @Dateto --and s.sku like 'Sunsilk%'
group by d.distributor,d.name, sku
order by SKU asc
