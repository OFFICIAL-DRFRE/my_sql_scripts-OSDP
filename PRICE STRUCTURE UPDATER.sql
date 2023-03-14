Declare @price float= 70.07
Declare @psku varchar(20)= '68820843'
Declare @pstruc varchar(4)='0001'
Declare @e_date date = '20220715'
SELECT * from PRICE_STRUCTURE where sku=@psku

Update PRICE_STRUCTURE set 
  PRICE_UNIT3=@price,
  EFFECTIVE_DATE= @e_date,
  PRICE_UNIT1=(select sell_factor1 from sku where sku=@psku)*@price, 
  PRICE_UNIT2=(select sell_factor2 from sku where sku=@psku) *@price, 
  DISTRIBUTOR=(select DISTRIBUTOR from distributor), EFFECTIVE_TODATE= CAST('20501231' AS datetime)
where sku=@psku and PRICE_STRUC=@pstruc
update PRICE_STRUCTURE set 
  PRICE_STANDARD=PRICE_UNIT1, RPRICE_UNIT1=PRICE_UNIT1, 
  RPRICE_UNIT2=PRICE_UNIT2, RPRICE_UNIT3=PRICE_UNIT3,RPRICE_STANDARD=PRICE_UNIT1,GPRICE_UNIT1=PRICE_UNIT1, 
  GPRICE_UNIT2=PRICE_UNIT2, GPRICE_UNIT3=PRICE_UNIT3, GRPRICE_UNIT1=PRICE_UNIT1, GRPRICE_UNIT2=PRICE_UNIT2, 
  GRPRICE_UNIT3=PRICE_UNIT3, Commission=0, PRICE_PURCHASE1=PRICE_UNIT1, PRICE_PURCHASE2=PRICE_UNIT2, 
  PRICE_PURCHASE3=PRICE_UNIT3, GPRICE_PURCHASE1=PRICE_UNIT1, GPRICE_PURCHASE2=PRICE_UNIT2, GPRICE_PURCHASE3=PRICE_UNIT3, 
  SED=0, MRSP=0, FMR=0, UNLOADING_CHARGES=0, SPECIAL_DISCOUNT=0, FOODSERVICE_DISCOUNT=0, DIS_BUILDING_ALLOWANCE=0,
  GST_REGISTERED=15, GST_NREGISTERED=15
where sku=@psku and PRICE_STRUC=@pstruc

set @pstruc = (select max(PRICE_STRUC) from PRICE_STRUCTURE where sku=@psku)
Update PRICE_STRUCTURE set 
  PRICE_UNIT3=@price,
  EFFECTIVE_DATE= @e_date, 
  PRICE_UNIT1=(select sell_factor1 from sku where sku=@psku)*@price, 
  PRICE_UNIT2=(select sell_factor2 from sku where sku=@psku) *@price, 
  DISTRIBUTOR=(select DISTRIBUTOR from distributor), EFFECTIVE_TODATE= CAST('20501231' AS datetime)
where sku=@psku and PRICE_STRUC=@pstruc
update PRICE_STRUCTURE set 
  PRICE_STANDARD=PRICE_UNIT1, RPRICE_UNIT1=PRICE_UNIT1, 
  RPRICE_UNIT2=PRICE_UNIT2, RPRICE_UNIT3=PRICE_UNIT3,RPRICE_STANDARD=PRICE_UNIT1,GPRICE_UNIT1=PRICE_UNIT1, 
  GPRICE_UNIT2=PRICE_UNIT2, GPRICE_UNIT3=PRICE_UNIT3, GRPRICE_UNIT1=PRICE_UNIT1, GRPRICE_UNIT2=PRICE_UNIT2, 
  GRPRICE_UNIT3=PRICE_UNIT3, Commission=0, PRICE_PURCHASE1=PRICE_UNIT1, PRICE_PURCHASE2=PRICE_UNIT2, 
  PRICE_PURCHASE3=PRICE_UNIT3, GPRICE_PURCHASE1=PRICE_UNIT1, GPRICE_PURCHASE2=PRICE_UNIT2, GPRICE_PURCHASE3=PRICE_UNIT3, 
  SED=0, MRSP=0, FMR=0, UNLOADING_CHARGES=0, SPECIAL_DISCOUNT=0, FOODSERVICE_DISCOUNT=0, DIS_BUILDING_ALLOWANCE=0,
  GST_REGISTERED=15, GST_NREGISTERED=15
where sku=@psku and PRICE_STRUC=@pstruc

SELECT * from PRICE_STRUCTURE where sku=@psku

