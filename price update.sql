--update PRICE_STRUCTURE set EFFECTIVE_TODATE='20-May-2019' from dbo.PRICE_STRUCTURE as ps
--inner join sku s on s.SKU = ps.SKU and ps.PRICE_STRUC !=(select MAX(price_struc) from PRICE_STRUCTURE where sku =s.SKU) 
--where ps.EFFECTIVE_TODATE >'20-May-2019'

update BATCH  set PRICE_STRUC = (select MAX(price_struc) from PRICE_STRUCTURE where sku =s.SKU) from dbo.batch as b
inner join sku s on s.SKU = b.SKU and b.batch in ('1-1')

select ps.SKU ,s.LDESC sku, ps.PRICE_STRUC, ps.PRICE_UNIT3,b.BATCH, b.BatchIndex, ps.EFFECTIVE_TODATE Expiry from PRICE_STRUCTURE ps
inner join sku s on s.SKU = ps.SKU and ps.PRICE_STRUC in (select MAX(price_struc) from PRICE_STRUCTURE where sku =s.SKU)
left outer join BATCH b on b.SKU=s.SKU 
where b.batch='1-1' and s.LDESC like 'dov sw%'
order by ps.SKU asc