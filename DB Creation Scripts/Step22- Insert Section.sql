delete from section
go
DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = (select COMPANY from COMPANY)
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

--insert into SECTION
select distinct
@comp_code as  COMPANY,
@dist_code as  Distributor,
SELL_CATEGORY as Sell_category,
Case len(section_route) when 2 then section_route when NULL then '-' when '' then '-' when 1  then '0'+section_route End as Section,
left(section_description,15) as sdesc,
section_description as ldesc,
'N' as rural,
1 as ischanged,
NULL as download,
NULL as ROW_VER
from DL_Section_Outlet where Section_Route is not NULL and Section_Route <> '' and Section_Route <> '-'
go