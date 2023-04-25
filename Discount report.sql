use centegy_sndpro_uet
;with schemes as (
select d.DISTRIBUTOR,d.NAME KD_Name,  sd.PROJECT_CODE Promo_Code, convert(varchar,sd.DOC_DATE,23) Doc_date , 
 c.pop,c.POP_name,s.SKU,s.LDESC SKU_Desc,
sum(sd.SCHEME_ON_QTY) 'Quantity',sum(sd.Scheme_On*1.15) [Gross amount], sum(sd.discount+sd.) [Discount Value] 
 from SCHEME_DISCOUNT sd
inner join distributor d on d.DISTRIBUTOR=sd.DISTRIBUTOR
inner join CASHMEMO c on c.DOC_NO=sd.DOC_NO
inner join SCHEME_DISCOUNT_DETAIL sdd on sdd.DOC_NO=sd.DOC_NO and sdd.DOCUMENT=sd.DOCUMENT and sdd.SUB_DOCUMENT=sd.SUB_DOCUMENT
inner join sku s on s.sku=sdd.SKU
where sd.PROJECT_CODE in ('485','486')
group by d.DISTRIBUTOR,d.NAME,  sd.PROJECT_CODE, sd.DOC_DATE,c.pop,c.POP_name ,s.SKU, s.LDESC
)  select *,[Gross amount]-[Discount Value] as 'Net Amount' from schemes t
order by t.DOC_DATE asc