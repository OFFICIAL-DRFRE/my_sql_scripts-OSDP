update pop set account_type='16' where account_type is null
go
select * from ACCOUNT_TYPE
delete from pop_account
go

DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = '23'
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into POP_account
select distinct @comp_code as Company,
@dist_code as distributor,
TOWN,
LOCALITY,
SLOCALITY,
pop,
account_type,
'1' as ischanged,
NULL as Download,
NULL as ROW_VER
from pop
where account_type is not null