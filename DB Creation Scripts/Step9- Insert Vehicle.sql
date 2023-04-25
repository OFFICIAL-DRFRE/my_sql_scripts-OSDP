DECLARE @comp_code VARCHAR(2)
DECLARE @Dist_code VARCHAR(8)

SET @comp_code = (select top 1 company from company)
SET @Dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

delete from SECTION_POP

delete from SECTION_POP_PERMANENT

delete from PJP_DETAIL

delete from PJP_HEAD

delete from DSR

delete from VEHICLE

insert into VEHICLE
select 
@comp_code as  COMPANY,
@dist_code as DISTRIBUTOR,
Vehicle_code as VEHICLE,
'Owned' as NATURE,
[DESCRIPTION] as description,
registration_no as REG_NO,
'N/A' as ENG_NO,
'N/A' as CHS_NO,
MAKE as MAKE,
'N/A' as MODEL,
Colour as color,
NULL as SUPPLIER,
'N/A' as OWNER_NAME,
'N/A' as OWNER_NIC,
Year as YEAR_MFG,
0 as AVG_RATE,
GETDATE() as  DATE_ENTRY,
'System' as USER_ENTRY,
GETDATE() as DATE_MODIFY,
'System' as USER_MODIFY,
'01' as FUELID,
NULL as meter_reading_type,
NULL as VEHICLE_CAPACITY,
'001' as GEO_BOUNDRY,
0 as APPROVED_MILEAGE,
'001' as VEHICLETYPE,
1 as isChanged,
0 as HOLDING_CAPACITY,
0 as CAPACITY_VOL,
0 as CAPACITY_WEIGHT,
0 as CAPACITY_VOL_PER,
0 as CAPACITY_WEIGHT_PER,
'N/A' as IMAGE,
NULL as CONTAINER,
NULL as ROW_Ver
from DL_vehicle
go