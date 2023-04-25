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
delete from POP_ATTRIBUTE
go
delete from pop
go
delete from POP_TEMP
go


delete from SUB_LOCALITY where TOWN = (select top 1 TOWN from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
go
delete from LOCALITY where TOWN = (select top 1 TOWN from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
go



DECLARE @comp_code VARCHAR(2)

SET @comp_code = (select top 1 company from company)
insert into LOCALITY
Select distinct @comp_code as  COMPANY,
TOWN as Town,
LOCALITY as Locality,
left(LOCALITY_description,15) as Sdesc,
LOCALITY_description as Ldesc,
1,
NULL AS ROW_VER
from Dl_Section_Outlet DLS WHERE NOT EXISTS (SELECT 1 FROM LOCALITY L WHERE DLS.TOWN=L.TOWN AND DLS.Locality=L.LOCALITY)
go



DECLARE @comp_code VARCHAR(2)

SET @comp_code = (select top 1 company from company)
insert into Sub_LOCALITY
Select distinct @comp_code as  COMPANY,
TOWN as Town,
LOCALITY as Locality,
SUB_LOCALITY as slocality,
(select MAX(areatype) from Dl_Section_outlet so2 where so1.town=so2.town and so1.locality=so2.locality and so1.sub_locality=so2.sub_locality),
left(Sub_LOCALITY_description,15) as Sdesc,
Sub_LOCALITY_description as Ldesc,
1,
NULL AS ROW_VER
from Dl_Section_Outlet so1 WHERE NOT EXISTS (SELECT 1 FROM SUB_LOCALITY L WHERE SO1.TOWN=L.TOWN AND SO1.Locality=L.LOCALITY AND SO1.Sub_Locality=L.SLOCALITY AND SO1.Sub_Locality_Description=L.LDESC)


----- Insert Delta Localities if needed

/*
----- Insert Delta Localities if needed

DECLARE @comp_code VARCHAR(2)

SET @comp_code = (select top 1 company from company)
insert into LOCALITY
Select distinct @comp_code as  COMPANY,
TOWN as Town,
LOCALITY as Locality,
left(LOCALITY_description,15) as Sdesc,
LOCALITY_description as Ldesc,
1,
NULL AS ROW_VER
from DL_delta_Local_slocal DLS WHERE NOT EXISTS (SELECT 1 FROM LOCALITY L WHERE DLS.TOWN=L.TOWN AND DLS.Locality=L.LOCALITY)
Go

---- Insert Delta Sub Localities if needed
  
DECLARE @comp_code VARCHAR(2)

SET @comp_code = (select top 1 company from company)
insert into Sub_LOCALITY
Select distinct @comp_code as  COMPANY,
TOWN as Town,
LOCALITY as Locality,
SUB_LOCALITY as slocality,
max(areatype),
left(Sub_LOCALITY_description,15) as Sdesc,
Sub_LOCALITY_description as Ldesc,
1,
NULL AS ROW_VER
from DL_delta_Local_slocal so1 WHERE NOT EXISTS (SELECT 1 FROM SUB_LOCALITY L WHERE SO1.TOWN=L.TOWN AND SO1.Locality=L.LOCALITY AND SO1.Sub_Locality=L.SLOCALITY)
group by TOWN,LOCALITY,SUB_LOCALITY,Sub_Locality_Description
Go

*/