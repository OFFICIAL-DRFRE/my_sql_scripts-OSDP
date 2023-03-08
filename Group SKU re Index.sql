use centegy_sndpro_uet

-- 												Index by SKU
with sku_order as (
select row_number() over ( order by master_sku, sku) as [orderOfSKU], SKU, ldesc from sku where sku in (select sku from SKU_CATEGORY) 
)
--select * from SKU_order
update SKU_CATEGORY set REF_SKU_IND=so.[orderOfSku] from SKU_CATEGORY sc
inner join sku_order so on so.sku=sc.SKU


--- 											Index by Category
with sku_order as (
select row_number() over (partition by m.prod1,m.prod2,m.prod3 order by m.prod1,m.prod2,m.prod3,m.prod4,m.prod5,m.prod6,m.prod7,m.prod8, sku) as [orderOfSKU], s.SKU, s.LDESC from sku s 
inner join MASTER_SKU m on m.MASTER_SKU=s.MASTER_SKU
)
--select * from SKU_order
update SKU_CATEGORY set REF_SKU_IND=so.[orderOfSku] from SKU_CATEGORY sc
inner join sku_order so on so.sku=sc.SKU
