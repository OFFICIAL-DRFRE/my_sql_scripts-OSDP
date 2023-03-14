use centegy_sndpro_uet
insert into batch
(company,sku,batch,price_struc,MANUFACTRING,expiry,batchindex,salealertdays,SaleStopDays,standard_unit,standard_weight,standard_factor,sell_unit1,sell_weight1,
sell_factor1,sell_unit2,sell_factor2,sell_unit3,sell_weight3,sell_factor3,scheme_weight1,scheme_weight2,SCHEME_WEIGHT3,PURCHASE_UNIT1,PURCHASE_UNIT2,purchase_unit3,
PURCHASE_WEIGHT1,PURCHASE_WEIGHT2,purchase_weight3,PURCHASE_FACTOR1,PURCHASE_FACTOR2,PURCHASE_FACTOR3,SELL_LENGTH1,SELL_LENGTH2,sell_length3,SELL_WIDTH1,sell_width2,
sell_width3,SELL_HEIGHT1,sell_height2,SELL_HEIGHT3)
select '23',sku,'1-1','0001',cast(getdate() as date),'20501231',1,90,30,standard_unit,STANDARD_WEIGHT,standard_factor,sell_unit1,sell_weight1,
sell_factor1,sell_unit2,sell_factor2,sell_unit3,sell_weight3,sell_factor3,scheme_weight1,scheme_weight2,SCHEME_WEIGHT3,PURCHASE_UNIT1,PURCHASE_UNIT2,purchase_unit3,
PURCHASE_WEIGHT1,PURCHASE_WEIGHT2,purchase_weight3,PURCHASE_FACTOR1,PURCHASE_FACTOR2,PURCHASE_FACTOR3,0,0,0,0,0,0,0,0,0   from SKU 
where SKU not in ( select sku from BATCH where batch='1-1') and sku in ( select sku from PRICE_STRUCTURE)


select s.sku, s.ldesc,b.batch, max(ps.price_struc)price_struc, convert(float, ps.price_unit3,2) 'Unit price',convert(float,round(ps.PRICE_UNIT3*1.15,2)) 'inc Vat'  from sku s
inner Join PRICE_STRUCTURE ps on s.sku=ps.sku  and ps.PRICE_STRUC =(select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=ps.SKU)
inner join Batch b on b.sku=s.SKU
where MANUFACTRING= cast(getdate() as date)
group by b.batch,ps.PRICE_STRUC, s.SKU, s.LDESC,ps.price_unit3