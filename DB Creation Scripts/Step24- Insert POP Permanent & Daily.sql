DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = '23'
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into SECTION_POP_PERMANENT
select distinct
@comp_code as  COMPANY,
TOWN as town,
LOCALITY as locality,
SUB_LOCALITY as slocality,
pop as pop,
@dist_code as  Distributor,
SELL_CATEGORY as Sell_category,
Case len(section_route) when 2 then section_route when NULL then '-' when '' then '-' when 1  then '0'+section_route End as Section,
NULL as POPNO,
[INDEX] as POP_Index,
99 as status_day,
NULL as status_time,
PJP as PJP,
1 as ischanged,
NULL as download,
NULL as REQUEST_TYPE,
NULL as REQUEST_DATE,
NULL as APPROVAL_STATUS,
NULL as DATE_APPROVE,
NULL as USER_APPROVE,
NULL as USER_COMMENTS,
NULL as ROW_VER
from DL_Section_Outlet where Section_Route is not NULL and Section_Route <> '' and Section_Route <> '-' and PJP is not nUll and
PJP <> '' and PJP <> '-' and PJP in (select distinct PJP from PJP_HEAD where ACTIVE=1)

insert into SECTION_POP
select distinct
@comp_code as  COMPANY,
TOWN as town,
LOCALITY as locality,
SUB_LOCALITY as slocality,
pop as pop,
@dist_code as  Distributor,
SELL_CATEGORY as Sell_category,
Case len(section_route) when 2 then section_route when NULL then '-' when '' then '-' when 1  then '0'+section_route End as Section,
NULL as POPNO,
[INDEX] as POP_Index,
99 as status_day,
NULL as status_time,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as working_date,
PJP as PJP,
1 as ischanged,
NULL as download,
NULL as ROW_VER
from DL_Section_Outlet where Section_Route is not NULL and Section_Route <> '' and Section_Route <> '-' and PJP is not nUll and
PJP <> '' and PJP <> '-' and PJP in (select distinct PJP from PJP_HEAD where ACTIVE=1)
go
UPDATE P SET POP_Index = A.P FROM SECTION_POP_PERMANENT P INNER JOIN (
SELECT CAST(ROW_NUMBER()OVER(ORDER BY DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP)+(select isNULL(MAX(pop_index),0)+24 from SECTION_POP_PERMANENT)  AS VARCHAR(5))P, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP FROM SECTION_POP_PERMANENT
WHERE POP_Index IS  NULL
) A ON A.COMPANY = P.COMPANY AND A.DISTRIBUTOR = P.DISTRIBUTOR AND A.TOWN = P.TOWN AND A.LOCALITY = P.LOCALITY AND A.SLOCALITY  = P.SLOCALITY AND A.POP = P.POP;

UPDATE P SET POP_Index = A.P FROM SECTION_POP P INNER JOIN (
SELECT CAST(ROW_NUMBER()OVER(ORDER BY DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP)+(select isNULL(MAX(pop_index),0)+24 from SECTION_POP)   AS VARCHAR(5))P, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP FROM SECTION_POP
WHERE POP_Index IS  NULL
) A ON A.COMPANY = P.COMPANY AND A.DISTRIBUTOR = P.DISTRIBUTOR AND A.TOWN = P.TOWN AND A.LOCALITY = P.LOCALITY AND A.SLOCALITY  = P.SLOCALITY AND A.POP = P.POP;