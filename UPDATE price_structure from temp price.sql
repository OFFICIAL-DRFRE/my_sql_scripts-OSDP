Update PRICE_STRUCTURE set 
	PRICE_UNIT3= w.price_unit3,
	EFFECTIVE_DATE= CAST(cast(getdate() as date)AS DATETIME),     --change the date if it's effective date is not today
	PRICE_UNIT1=(select sell_factor1 from sku where sku= w.sku)* w.price_unit3, 
	PRICE_UNIT2=(select sell_factor2 from sku where sku=w.sku) * w.price_unit3, 
	DISTRIBUTOR=(select DISTRIBUTOR from distributor), EFFECTIVE_TODATE= '20251231' 
from PRICE_STRUCTURE p
  right JOIN dbo.waga w on w.sku=p.SKU 
	and ( p.price_struc in (select min(price_struc) from PRICE_STRUCTURE where sku = p.SKU) 
		  OR p.PRICE_STRUC in (select max(price_struc) from PRICE_STRUCTURE where sku = p.SKU)
		  ) 
go
update PRICE_STRUCTURE set
	PRICE_STANDARD=p.price_unit1, RPRICE_UNIT1=p.price_unit1, 
	RPRICE_UNIT2=p.price_unit2, RPRICE_UNIT3=p.price_unit3,RPRICE_STANDARD=p.price_unit1,GPRICE_UNIT1=p.price_unit1, 
	GPRICE_UNIT2=p.price_unit2, GPRICE_UNIT3=p.price_unit3, GRPRICE_UNIT1=p.price_unit1, GRPRICE_UNIT2=p.price_unit2, 
	GRPRICE_UNIT3=p.price_unit3, Commission=0, PRICE_PURCHASE1=p.price_unit1, PRICE_PURCHASE2=p.price_unit2, 
	PRICE_PURCHASE3=p.price_unit3, GPRICE_PURCHASE1=p.price_unit1, GPRICE_PURCHASE2=p.price_unit2, GPRICE_PURCHASE3=p.price_unit3, 
	SED=0, MRSP=0, FMR=0, UNLOADING_CHARGES=0, SPECIAL_DISCOUNT=0, FOODSERVICE_DISCOUNT=0, DIS_BUILDING_ALLOWANCE=0,
	GST_REGISTERED=15, GST_NREGISTERED=15 
from PRICE_STRUCTURE p
 right JOIN dbo.waga w on w.sku=p.SKU 
	and ( p.price_struc in (select min(price_struc) from PRICE_STRUCTURE where sku = p.SKU) 
		  OR p.PRICE_STRUC in (select max(price_struc) from PRICE_STRUCTURE where sku = p.SKU)
		  )
PRINT 'UPDATE Done!'

 CREATE TABLE WAGA(
	sku varchar(20) PRIMARY KEY not NULL,
	price_unit3 decimal(22,8) not NULL
)

SELECT 
	w.sku, 
	p.PRICE_STRUC, 
	convert(money, round( w.price_unit3, 2) ) new_price,  
	convert(money, round( p.PRICE_UNIT3, 2) ) cur_price, 
	convert(money, round( w.price_unit3 - p.PRICE_UNIT3,2) )as Diff 
FROM PRICE_STRUCTURE P
right JOIN dbo.waga w on w.sku=p.SKU 
	and ( p.price_struc in (select min(price_struc) from PRICE_STRUCTURE where sku = p.SKU) 
		  OR p.PRICE_STRUC in (select max(price_struc) from PRICE_STRUCTURE where sku = p.SKU)
		  )
order by 1, 3