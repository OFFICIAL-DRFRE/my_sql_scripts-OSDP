use centegy_sndpro_uet
;with channel_mismatch as (
select 
	town+locality+slocality+pop pop_code, 
	Name Customer_name, 
	PHONE_NO,
	pt.POPTYPE, 
	sep.ldesc POP_temp_channel,
	sec.SUB_ELEMENT hht_channel_code, 
	sec.LDESC hht_channel   
from POP_TEMP pt
	inner join IG_O_NewCustomer cg on replace(cg.Process_ReferenceNumber, '~', '') = pt.company+pt.distributor+pt.TOWN+LOCALITY+SLOCALITY+POP
	inner join SUB_ELEMENT sep on sep.SUB_ELEMENT=pt.SUB_ELEMENT
	inner join SUB_ELEMENT sec on sec.SUB_ELEMENT = cg.HierarchyCode
--where sep.LDESC <> sec.LDESC
)
--Comment out this line when update the script
select * from channel_mismatch


-- **** Make sure Data is accurate before running the below script *****
--update POP_TEMP set SUB_ELEMENT = cm.hht_channel_code,
--					POPTYPE= case 
--						when hht_channel_code in ('C10554','C21111') then '02' 
--						when hht_channel_code='C11629' then '04' else '01' 
--					end 
--	from pop_temp p 
--inner join channel_mismatch cm on cm.pop_code = town+locality+slocality+pop