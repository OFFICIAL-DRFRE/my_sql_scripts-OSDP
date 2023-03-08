Declare @popcode varchar(10)='00001079'
select * from pop where pop >=@popcode order by pop asc

update pop set 
ACCOUNT_TYPE=Null,
owner_name= case 
				when owner_name is null then pop_name 
				else Owner_name 
				end,
Active='1', 
AREATYPE='01',
TOTAL_TURNOVER='1',
COMPANY_TURNOVER='1',
COMPANY_RANK='03',
Rank='03',
POP_CODE=COMPANY+Distributor+TOWN+locality+sLocality+POP,
LEGACY_CODE=town+locality+sLocality+POP,
ASSET_SCHEME='0',
CHEQUE_AUTO_REALIZED='Y',
POP_BARCODE=town+locality+sLocality+POP,
LOCALITY_BILL_TO=LOCALITY, POP_BILL_TO=POP, TOWN_BILL_TO=town, SLOCALITY_BILL_TO=SLOCALITY,
LOCALITY_CORPORATE=LOCALITY, POP_CORPORATE=POP, TOWN_CORPORATE=town, SLOCALITY_CORPORATE=SLOCALITY,
USER_ENTRY= (select USER_ID from Users where status=1 and DESIGNATION=101),
POPTYPE= case 
			when sub_element in ('C10554','C21111') then '02' 
			when SUB_ELEMENT='C11629' then '04' else '01' 
			end,
GEO_BOUNDRY='12',
DOWNLOAD='1',
UPDATED_DATE=NULL,
AUTO_TAX_INVOICE='0',
TAX_EXCEPTION='N',
PREV_POP_CODE=pop,
DATE_ENTRY=cast(GETDATE() as date),
AMOUNT_LIMIT='0.00',
DAYS_LIMIT='0',
FREEZER='0',
COOL_CAB='0',
Sub_Distributor='N',
COUNTERSALE_YN='N',
PERFECT_STORE_LEVEL='001'
where pop >= @popcode and poptype is null 
