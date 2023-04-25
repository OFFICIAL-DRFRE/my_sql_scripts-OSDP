declare @working_date datetime
declare @closing_date datetime

set @working_date='11-sep-2022';
set @closing_date='11-sep-2022';

update DISTRIBUTOR set WORKING_DATE=@working_date, CLOSING_DATE=@closing_date
update PJP_HEAD set WORKING_DATE=@working_date, CLOSING_DATE=@closing_date
update SECTION_POP set WORKING_DATE=@working_date
update STOCK_BATCH set YEAR=(select max(year) from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE), 
JCNO=(select max(JCNO) from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE)
,WEEK_NO = (select max(WEEK_NO) from JC_WEEK where (select top 1 working_date from distributor) between START_DATE and END_DATE)
update POP set UPDATED_DATE=(select top 1 working_date from distributor)

delete from DISTRIBUTOR_ASSOCIATION where FIELD_COMB='enc_working_date'