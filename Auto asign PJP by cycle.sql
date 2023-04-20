use centegy_sndpro_uet
Declare @weeks_in_cycle int = 2   --insert the number OF weeks by cycle

-- Setting the no. of weeks in a cycle
update PJP_HEAD set WEEKS_IN_CYCLE=@weeks_in_cycle where ACTIVE=1 and working_date=dateadd(day, 1, cast(getdate() as date))
go


-- Setup the First PJP manually then check it using the below script if everything is Ok run the below block
Declare @first_pjp varchar(4)= (Select top 1 pjp from PJP_HEAD)

select 
	pd.DISTRIBUTOR, ph.PJP, pd.SELL_CATEGORY as SELL_CAT, pd.SECTION, WEEK_NO 'week #', 
	case	when mon = 0 then ' ' else N'✓' end as MON, 
	case	when TUE = 0 then ' ' else N'✓' end as TUE, 
	case	when wed = 0 then ' ' else N'✓' end as WED, 
	case	when thu = 0 then ' ' else N'✓' end as THU, 
	case	when fri = 0 then ' ' else N'✓' end as FRI, 
	case	when sat = 0 then ' ' else N'✓' end as SAT, 
	--case	when sun = 0 then ' ' else N'✓' end as SUN, 
	ph.pjp as REF_PJP 
from (
	select company, DISTRIBUTOR, pjp, SELL_CATEGORY, SECTION, WEEK_NO, mon, TUE, wed, thu, fri, sat, sun, REF_PJP from PJP_DETAIL 
	where PJP='AA01' and WEEK_NO in (1, 2)
)pd
inner join PJP_HEAD ph on   pd.PJP <> ph.PJP and pd.SELL_CATEGORY=ph.SELL_CATEGORY and ph.ACTIVE=1
order by PJP, WEEK_NO, SECTION

-- to clear all the PJP_DETAIL to insert the cycle automatically
Delete from pjp_detail where PJP<> @first_pjp
go


-- To insert the PJP by cycle automatically
Declare @first_pjp varchar(4)= (Select top 1 pjp from PJP_HEAD)

INSERT INTO PJP_DETAIL 
	(company, DISTRIBUTOR, pjp, SELL_CATEGORY, SECTION, WEEK_NO, mon, TUE, wed, thu, fri, sat, sun, REF_PJP)
select 
	pd.company, pd.DISTRIBUTOR, ph.pjp, pd.SELL_CATEGORY, pd.SECTION, WEEK_NO, mon, TUE, wed, thu, fri, sat, sun, ph.pjp 
	from (
		select company, DISTRIBUTOR, pjp, SELL_CATEGORY, SECTION, WEEK_NO, mon, TUE, wed, thu, fri, sat, sun, REF_PJP from PJP_DETAIL 
		where PJP=@first_pjp
	)pd
inner join PJP_HEAD ph on   pd.PJP <> ph.PJP and pd.SELL_CATEGORY=ph.SELL_CATEGORY and ph.ACTIVE=1
order by pd.PJP, WEEK_NO, SECTION


