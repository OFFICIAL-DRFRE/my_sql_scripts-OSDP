delete from SECTION_POP
go
delete from SECTION_POP_PERMANENT
go
delete from POP_LEDGER
go
delete from pop_credit
go
delete from pop_tax
go
delete from pop_attribute
go
delete from pop
go
delete from POP_TEMP
go

DECLARE @comp_code VARCHAR(2);
DECLARE @dist_code VARCHAR(10);

SET @comp_code = (select company from company);
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR);

with dl_POP as (
Select distinct @comp_code as  COMPANY,
TOWN as Town,
LOCALITY as Locality,
SUB_LOCALITY as Slocality,
POP as POP,
@dist_code as Distributor,
0 as POPNO,
Outlet_Name as Name,
case ACCOUNT_TYPE when NULL then (select ACCOUNT_TYPE from ACCOUNT_TYPE where SDESC='N/A') when '' then (select ACCOUNT_TYPE from ACCOUNT_TYPE where SDESC='N/A') else Account_type end as Account_type,
NULL as Shop_No,
left(Market_name,30) as Market_name,
left(Street,30) as Street,
NULL as Police_Station,
NULL as Tehsil,
NULL as Post_Code,
Case left(POPNO,1) when '0' then POPNO when NULL then popno when '' then popno else POPNo End as Phone_No,
NULL as FAX_NO,
Email as Email,
str(Company_turnover) as Company_Turnover,
str(Total_turnover) as Total_turnover,
Outlet_business_Type as Sub_element,
'03' as Company_Rank,
'03' as [Rank],
str(Amount_Limit) as Amount_limit,
Days_Limit as Days_Limit,
0 as Freezer,
0 as cool_cab,
1 as Active,
'ADMIN' as Identify_By,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as Identify_on,
'ADMIN' as User_Entry,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as date_entry,
outlet_type as POPtype,
AREATYPE as areatype,
NULL as Distribution_type,
'N' as Sub_distributor,
'ADMIN' as User_Modify,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as Date_modify,
NULL as shopper_type,
town_bill_to as Town_Bill_to,
Locality_bill_to as Locality_Bill_to,
SLocality_bill_to as sLocality_Bill_to,
POP_bill_to as POP_Bill_to,
0 as Air_conditioner,
NULL as Cheque_realized,
'N' as CounterSale_YN,
NULL as District,
locality_corporate as Locality_Corporate,
NULL as NIC_No,
NULL as Owner_Name,
POP as POP_Corporate,
Outlet_Ref_Code as POP_Prev_Code,
0 as  Prev_Town_Code,
0 as Refrigerator,
left(Outlet_Name,15) as Short_Name,
Slocality_Corporate as Slocality_Corporate,
town_corporate as town_corporate,
'Y' as Cheque_Auto_Realized,
1 as ischanged,
'N' as Tax_Exception,
0 as holding_capacity,
0 as selling_capacity,
str(isnull(longitude,0.00000)) as longitude,
str(isnull(latitude,0.00000)) as latitude,
NULL as geo_boundry,
0 as asset_scheme,
NULL as POP_Image,
NULL as POP_Code,
NULL as conversion_status,
NULL as Csd_status,
NULL as GPS_Coordinates,
NULL as active_remarks,
Perfect_Store_Level as perfect_store_level,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as perfect_store_date,
0 as pop_bank,
1 as Download,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as Updated_date,
NULL as Wf_serial,
NULL as OLD_WF_SERIAL,
NULL as UPLOADED,
NULL as WF_STATUS,
NULL as DATE_APPROVE,
NULL as USER_APPROVE,
NULL as POP_BARCODE,
NULL as KEY_CUSTOMER,
NULL as AUTO_TAX_INVOICE,
Outlet_Code as LEGACY_CODE,
NULL as ROW_VER,
NULL as FIN_SUBLEDGER,
NULL as distributor_district
from Dl_Section_Outlet)

insert into pop
select * from dl_pop


----FOLLOWING SCRIPT WILL BE EXECUTED IF PREV_POP_CODE IS NULL IN THE POP TABLE OTHERWISE NO NEED TO RUN FOLLOWING SCRIPT;

UPDATE P SET PREV_POP_CODE = A.P FROM POP P INNER JOIN (
SELECT RIGHT(('000000'+CAST(ROW_NUMBER()OVER(ORDER BY DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP)+24  AS VARCHAR(5))),6)P, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP FROM POP
WHERE PREV_POP_CODE IS  NULL or PREV_POP_CODE='' and exists (select 1 from DL_Section_Outlet dl where town+locality+slocality+pop=dl.TOWN+dl.LOCALITY+dl.Sub_Locality+dl.pop)
) A ON A.COMPANY = P.COMPANY AND A.DISTRIBUTOR = P.DISTRIBUTOR AND A.TOWN = P.TOWN AND A.LOCALITY = P.LOCALITY AND A.SLOCALITY  = P.SLOCALITY AND A.POP = P.POP;



