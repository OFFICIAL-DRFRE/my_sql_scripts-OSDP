SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER On 
SET ANSI_WARNINGS On
SET ANSI_PADDING On
go
DELETE FROM QS_DELETE_TRACK
delete from QS_log_detail
delete from QS_log
delete from  QS_QUEUE
delete from QS_SCHEDULE_DETAIL
delete from QS_SCHEDULE
delete from QS_SCHEDULE_MAPPING
delete from QS_UPDATED_VERSION
delete from qs_synchronizer

--insert into QS_SYNCHRONIZER
select COMPANY as company,
DISTRIBUTOR as synchronizer,
GETDATE() created_date,
'DISTRIBUTOR' as REf_table,
'COMPANY~DISTRIBUTOR' as ref_feild_Comb,
COMPANY+'~'+DISTRIBUTOR as ref_feild_value,
getdate() as row_ver,
getdate() as irow_ver,
NULL as Auth_key,
NULL as versionID
from DISTRIBUTOR where SALES_ORGANIZATION is not null

update QS_CONFIG_SYNCHRONIZER set SYNCHRONIZER=(select distributor from distributor)


