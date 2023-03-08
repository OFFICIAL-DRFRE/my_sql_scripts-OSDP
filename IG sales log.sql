/* 
	0 = not processed
	1 = Success
	2 = failure
	3 = partial
	4 = already exist
*/
use centegy_sndpro_uet
select distinct tenantcode,synckey, routecode, convert(date, documentdate) Doc_date, convert(date, deliverydate) Delv_date, 
process_status,process_description,convert(date, process_datetime) process_date   
from IG_O_SalesOrderHeader 
where process_status is null
group by  tenantcode, synckey,routecode, documentdate, deliverydate, process_status, process_description, process_datetime
order by 4, 5