use centegy_sndpro_uet
Declare @sku varchar(20)= 68820838
Declare @amt numeric= 308
DECLARE @wk_no NUMERIC = 31
update STOCK_BATCH set open_3 =open_3 + @amt   where BATCH='1-1' and WEEK_NO=@wk_no and sku=@sku and WAREHOUSE ='01'
update STOCK_BATCH set open_3 =open_3 - @amt   where BATCH='1-1-1' and WEEK_NO=@wk_no and sku=@sku and WAREHOUSE ='01'
