DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = '23'
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into POP_CREDIT
select distinct @comp_code,
TOWN,
LOCALITY,
SUB_LOCALITY,
pop,
@dist_code,
SELL_CATEGORY,
0 as POPNO,
amount_action as Credit_allowed,
amount_limit as Amount_limit,
days_limit as Days_limit,
'0' as CreditMode, --Normal
days_action as credit_action,
'1' as ischanged,
NULL as Download,
NULL as ROW_VER
from DL_Section_Outlet
where Amount_Limit<>'0' and Days_Limit<>'0'