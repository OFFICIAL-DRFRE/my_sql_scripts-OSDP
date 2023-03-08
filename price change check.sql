use Centegy_sndpro_uet
select s.sku, s.ldesc, max(ps.price_struc)price_struc, convert(varchar,effective_date, 23) Effectvie_date, b.batch, convert(float, ps.price_unit3,2) 'Unit price',convert(float,round(ps.PRICE_UNIT3*1.15,2)) 'inc Vat'  from sku s
inner Join PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=ps.SKU)
left join batch b on b.PRICE_STRUC=ps.PRICE_STRUC and b.BatchIndex=1
where s.ldesc like 'life%20g'
--ps.effective_date >= '20230101'
group by ps.PRICE_STRUC,batch, s.SKU, s.LDESC,ps.price_unit3,effective_date


--update BATCH  set PRICE_STRUC = (select max(price_struc) from PRICE_STRUCTURE where sku =s.SKU) from dbo.batch as b
--inner join sku s on s.SKU = b.SKU and b.batch in ('1-1')


