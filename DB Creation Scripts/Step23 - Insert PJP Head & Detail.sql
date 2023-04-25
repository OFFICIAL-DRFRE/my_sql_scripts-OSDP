
DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = (select COMPANY from COMPANY)
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into PJP_HEAD
select distinct
@comp_code as  COMPANY,
@dist_code as  Distributor,
PJP_Code as PJP,
Salesman as DSR,
SELLING_CATEoGRY as Sell_category,
1 as Active,
'D' as HHT_status,
0 as credit_allowed,
0 as amount_limit,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as working_date,
NULL as Report_SrNO,
1 as Deadalive,
1 as workingnature,
1 as workingdays,
'ADMIN' as User_Entry,
GETDATE() as date_entry,
'ADMIN' as User_Modify,
GETDATE() as date_modify,
NULL as fast_order,
1 as Weeks_in_cycle,
1 as ischanged,
NULL as geo_boundry,
NULL as device_special_disocunt,
NULL as upload_date,
NULL as download_date,
NULL as pjp_index,
left(PJP_Short_Description,15) as Sdesc,
PJP_Long_Description as Ldesc,
0 as partial_upload,
warehouse as warehouse,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as closing_date,
'01' as suggested_gin,
0 as default_gin_factor,
1 as chk_order,
1 chk_delivery,
@dist_code AS wh_DISTRIBUTOR,
0 AS MOBILE_BOOKING,
NULL AS GPSCOORDINATE,
nuLL AS AUTO_UPLOAD,
NULL AS GPS_COORDINATES,
NULL AS BAR_CODE,
'N' AS DS_CHECK_DE,
3 AS DS_DAYS_DE,
NULL AS UPDATED_DATE,
(SELECT MIN(BANK) BANK_CODE FROM BANK) AS BANK,
(SELECT MAX(BRANCH) FROM BRANCH B WHERE B.BANK=(SELECT MIN(BANK) BANK_CODE FROM BANK)) AS BRANCH,
case (select d.JOB_TYPE from DSR d where d.DSR=DLP.SalesMan) when '01' then '1' else '0' end,
1 as ALLOW_COLLECTION,
NULL AS ROW_VER,
null as mhsku,
null as restrict_visit_sequence,
null as chk_asset_order,
null as chk_crosspromotion,
null as chk_activebatch
from DL_PJP DLP 

Declare DSR_CUR Cursor for Select distinct cast(week_no as smallint) from jc_week order by cast(week_no as smallint)
Open DSR_CUR
Declare @KEY smallint
--Declare @SR NUMERIC(3)
--SET @SR = 0
Fetch Next From DSR_CUR INTO @KEY
While @@fetch_status=0 --and @SR<>200
Begin 
	IF(@@fetch_status=-1) BREAK
	--SET @SR = @SR+1
	insert into PJP_DETAIL
select 
@comp_code as  COMPANY,
@dist_code as  Distributor,
PJP_Code as PJP,
SELLING_CATEoGRY as Sell_category,
SECTION_ROUTE AS sECTION,
@KEY AS WEEK_NO,
SAT = max(CASE DAY WHEN 'Saturday' then 1 else 0 end),
SUN = max(CASE DAY WHEN 'Sunday' then 1 else 0 end),
MON = max(CASE DAY WHEN 'Monday' then 1 else 0 end),
TUE = max(CASE DAY WHEN 'Tuesday' then 1 else 0 end),
WED = max(CASE DAY WHEN 'Wednesday' then 1 else 0 end),
THU = max(CASE DAY WHEN 'Thursday' then 1 else 0 end),
FRI = max(CASE DAY WHEN 'Friday' then 1 else 0 end),
NULL as status,
Ref_PJP as Ref_PJP,
1 as ischanged,
NULL as download,
NULL AS ROW_VER
from DL_PJP
group by 
PJP_Code,
SELLING_CATEoGRY ,
SECTION_ROUTE ,
Ref_PJP
	PRINT(@@fetch_status)
	Fetch Next From DSR_CUR INTO @KEY
End
Close DSR_CUR
Deallocate DSR_CUR
