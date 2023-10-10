declare @working_date datetime 
declare @working_date datetime
 
set @working_date='20230620';

 
 update DISTRIBUTOR set WORKING_DATE=@working_date, CLOSING_DATE=@working_date
 update PJP_HEAD set WORKING_DATE=@working_date, CLOSING_DATE=@working_date
 update SECTION_POP set WORKING_DATE=@working_date
 delete from stock_batch where year+'-'+jcno+'-'+week_no not in (select max(year+'-'+jcno+'-'+week_no) from stock_batch)
 go
 
update STOCK_BATCH set YEAR=(select year from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE),
 JCNO=(select JCNO from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE)
 ,WEEK_NO = (select WEEK_NO from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE)
 
----incase below script returns 0 rows affected, change ENC_WORKING_DATE to lower case i.e. enc_working_date ----

delete from DISTRIBUTOR_ASSOCIATION where FIELD_COMB = 'enc_working_date'
