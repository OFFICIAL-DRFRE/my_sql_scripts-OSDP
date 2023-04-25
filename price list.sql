select s.sku, s.ldesc, max(ps.price_struc), ps.price_unit3, ps.PRICE_UNIT3*1.15  from sku s
left Join PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=ps.SKU)
where s.ldesc like 'dov sw%'
group by PRICE_STRUC, s.SKU, s.LDESC,ps.price_unit3 