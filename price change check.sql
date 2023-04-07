use Centegy_sndpro_uet
select s.sku, s.ldesc, max(ps.price_struc)price_struc, convert(varchar,effective_date, 23) Effectvie_date, b.batch, convert(float, ps.price_unit3,2) 'Unit price',convert(float,round(ps.PRICE_UNIT3*1.15,2)) 'inc Vat'  from sku s
inner Join PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=ps.SKU)
left join batch b on b.PRICE_STRUC=ps.PRICE_STRUC and b.BatchIndex=1
where --s.ldesc like 'life%20g'
ps.effective_date >= '20230301'
group by ps.PRICE_STRUC,batch, s.SKU, s.LDESC,ps.price_unit3,effective_date

----- Comapny and 
with pr(price_type, sku, sku_desc, price_struc, effective_date, batch, unit_price, inc_vat) as (
select 'price structure' as price_type, s.sku, s.ldesc, max(ps.price_struc)price_struc, convert(varchar,effective_date, 23) Effective_date, b.batch, convert(float, ps.price_unit3,2) 'Unit price',
convert(float,round(ps.PRICE_UNIT3*1.15,2)) 'inc Vat'  from sku s
inner Join PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=ps.SKU)
left join batch b on b.PRICE_STRUC=ps.PRICE_STRUC and b.BatchIndex=1
group by ps.PRICE_STRUC,batch, s.SKU, s.LDESC,ps.price_unit3,effective_date
union
select 'company price' as price_type, s.sku, s.ldesc, max(ps.price_struc)price_struc, convert(varchar,effective_date, 23) Effective_date, b.batch, convert(float, ps.price_unit3,2) 'Unit price',
convert(float,round(ps.PRICE_UNIT3*1.15,2)) 'inc Vat'  from sku s
inner Join COMPANY_PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from company_PRICE_STRUCTURE where sku=ps.SKU)
left join batch b on b.PRICE_STRUC=ps.PRICE_STRUC and b.BatchIndex=1
group by ps.PRICE_STRUC,batch, s.SKU, s.LDESC,ps.price_unit3,effective_date
)
select * from pr
where sku_desc like 'sunl%200g'
--ps.effective_date >= '20230301'
