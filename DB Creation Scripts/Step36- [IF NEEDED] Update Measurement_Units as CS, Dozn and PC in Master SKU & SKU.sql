update MASTER_SKU set STANDARD_UNIT='CS',SELL_UNIT1='CS',SELL_UNIT2='DZ',SELL_UNIT3='PC', PURCHASE_UNIT1='CS',PURCHASE_UNIT2='DZ', PURCHASE_UNIT3='PC'
go

update sku set STANDARD_UNIT='CS',SELL_UNIT1='CS',SELL_UNIT2='DZ',SELL_UNIT3='PC', PURCHASE_UNIT1='CS',PURCHASE_UNIT2='DZ', PURCHASE_UNIT3='PC'
go
update BATCH set STANDARD_UNIT='CS',SELL_UNIT1='CS',SELL_UNIT2='DZ',SELL_UNIT3='PC', PURCHASE_UNIT1='CS',PURCHASE_UNIT2='DZ', PURCHASE_UNIT3='PC'
go

----- Update Active selling/ purchasing Units---
update  sku set SELL_UNIT2_ACTIVE='N' 
where SELL_FACTOR2='0' and SELL_UNIT2_ACTIVE='Y'

update  sku set SHIP_UNIT2_ACTIVE='N' 
where PURCHASE_FACTOR2='0' and ship_UNIT2_ACTIVE='Y'
