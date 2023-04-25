use centegy_sndpro_uet
delete QS_UPDATED_VERSION 
where QS_TABLE_ID in (select QS_TABLE_ID from QS_TABLE where TABLE_NAME in('distributor','DAYEND_LOG', 'qs_queue'))