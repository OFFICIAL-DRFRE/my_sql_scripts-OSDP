---- PLEASE ADD "JOB_TYPE" HERE AS WELL----
delete from PJP_DETAIL
go
delete from PJP_HEAD
go
delete from DSR
go
delete from QUALIFICATION
go
DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = (select company from COMPANY)
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into QUALIFICATION
select @comp_code, '01' , 'N/A', 'N/A',null

insert into DSR
select distinct @comp_code as Company,
@dist_code as Distributor,
dsr as DSR,
left(Name_of_dsr,40) as Name,
NULL as father_Name,
'1234' as NIC_NO,
(select distinct VEHICLE from VEHICLE v join dl_vehicle dlv on v.vehicle=dlv.vehicle_code and dlv.[Delivery Man]=p.DSR where p.DSR=dlv.[Delivery Man]) as vehicle,
'01' as qualification,
case JOB_TYPE when 'Delivery man' then '02' when 'order booker' then '01' when 'Spot Seller' then '03' end as Job_Type,
NULL as address1,
NULL as address2,
(select working_date-1 from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as DOB,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as DOA,
NULL as blood_group,
0 as emp_code,
NULL as phone_no,
NULL as mobile_no,
NULL as PREV_EXPERIENCE,
NULL as d_license_no,
NULL as ledger_code,
'Y' as STATUS,
dsr as P_word,
NULL as dsr_Manager,
'Y' as countersale_yn,
'L' as working_nature,
1 as ischanged,
(select c.COMP1 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp1,
(select c.COMP2 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp2,
(select c.COMP3 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp3,
(select c.COMP4 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp4,
(select c.COMP5 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp5,
(select c.COMP6 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp6,
(select c.COMP7 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp7,
(select c.COMP8 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp8,
(select c.COMP9 from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp9,
(select c.COMPCODE from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as compcode,
0.0 as commission_rate,
0.0 as commision_rate,
10 as comp_level,
(select c.COMP1+'~'+c.COMP2+'~'+c.COMP3+'~'+c.COMPCODE from COMP_TABLE c where c.COMPCODE=p.Territory_Manager) as comp_level_code,
NULL as towerlocationID,
'Y' as iq,
1 as fcs,
NULL as WF_Serial,
NULL as OLD_WF_Serial,
'ADMIN' as user_approve,
getdate() as date_approve,
GETDATE() as updated_date,
CASE [Device_Sr_No] WHEN '' then NULL when NULL then NULL else [Device_Sr_No] end as device_serial_no,
NULL as  ROW_VER,
--NULL as iROW_VER,
NULL as civil_status,
NULL as spouse_name,
NULL as passport_no,
NULL as FIN_SUBLEDGER
from DL_DSR p
