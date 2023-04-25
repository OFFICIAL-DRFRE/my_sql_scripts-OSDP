declare @compcode varchar(02);
declare @distcode varchar(10);
declare @towncode varchar(10);
declare @phone varchar(20);
declare @email varchar(50);
declare @sales_organization varchar(50);
declare @default_VAT float(4);
declare @Name varchar(50);
declare @NTN varchar(40);
declare @GST varchar(50);
declare @Address1 varchar(255);
declare @Address2 varchar(255);
declare @Weekoff varchar(3);
declare @Cm_Roundoff varchar(2);
declare @Free_SKU_Claim varchar(10);
declare @Scheme_On_Date varchar(1);
declare @Currency varchar(10);
declare @Currency_Description varchar(50);
declare @PQC_Approval_Required varchar(1);
declare @Dist_SrNo varchar(4);

Set @Dist_SrNo = '0512' -- Input the 4 digit Distributor Code that will make the Distributor as Unique. E.g. 1st Pilot DT is 0001 then 2nd DT should be "0002" and goes on.

set @compcode=(select COMPANY from COMPANY);
set @distcode=(select DISTRIBUTOR from DISTRIBUTOR)
set @Name ='RENGER INDUSTRY AND TRADING PLC-AA/BNT';
set @NTN ='s';
set @GST ='as';
set @Address1 ='Addis Ababa';
set @Address2 ='';
set @Weekoff ='Sun';
set @Cm_Roundoff ='2';
set @Free_SKU_Claim ='Purchase';
set @Scheme_On_Date ='O';
set @Currency ='ETB';
set @Currency_Description ='Ethiopian Birrs';
set @towncode='T0001'
set @phone='++2519xxxxxxx';
set @email='';
set @default_VAT=(select MAX(gst_registered) from sku)
set @sales_organization='F611'        --- Sales Organization Code of Distributor associated with it in SAP
set @PQC_Approval_Required ='0';  --- either 1 (TRUE) or 0 (FALSE) if Approval is requried on return of damaged goods


update Distributor set name=@Name, GEOCODE=(select geocode from TOWN where TOWN=@towncode),
town=@towncode, NTN=@NTN, GST=@GST,ADDRESS1=@Address1, ADDRESS2=@Address2, MOBILE_NO=@phone,PHONE_NO_OFF=@phone, EMAIL=@email,
CORPORATE_CODE=Distributor, Default_CMGST=@default_VAT, WEEKOFF=@Weekoff,CM_ROUNDOFF=@Cm_Roundoff, FREE_SKU_CLAIM=@Free_SKU_Claim, SCHEME_ONDATE=@Scheme_On_Date,
CURRENCY=@Currency, PQC_APPROVAL_REQUIRED=@PQC_Approval_Required,SALES_ORGANIZATION=@sales_organization,
GST_REGISTERED=cast(Default_CMGST as varchar),GST_NREGISTERED=cast(Default_CMGST as varchar)

delete from DISTRIBUTOR_CONTACT
insert into DISTRIBUTOR_CONTACT
select @compcode as COmpany,
@distcode as Distributor,
'1' as SNO,
(select name from DISTRIBUTOR where DISTRIBUTOR=@distcode) as Contact,
NULL as Qualification,
'1' as Ischanged,
@phone as Phone_No,
NULL as DESIGNATION,
NULL as ROW_VER


update PR_GN_CR_CURRENCY set PCR_CURRDESC=@Currency_Description, PCR_CURRSHORT=@currency where PCR_CURRCODE='001'
update PR_GN_CR_CURRENCY set pcr_desc=PCR_CURRDESC, PCR_SHORTCODE=PCR_CURRSHORT where PCR_CURRCODE='001'

update DISTRIBUTOR_ASSOCIATION set value_comb=@Dist_SrNo where FIELD_COMB='DIST_SRNO' and isnumeric(value_comb)=1

update DISTRIBUTOR_ASSOCIATION set VALUE_COMB = 'E6242' where FIELD_COMB= 'compcode'