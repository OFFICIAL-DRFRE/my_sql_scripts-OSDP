use centegy_sndpro_uet
select distinct 
	vs.routecode, ph.ldesc 'PJP desc',	vs.CustomerCode, c.CustomerName, jp.SequenceNumber pop_index, VisitSequence, VisitStartDateTime 'Start time', VisitEndDateTime 'end time', 
	Right(convert(varchar(2),  datediff(SECOND, VisitStartDateTime, VisitEndDateTime)/60), 2) + ' m ' +
	Right( '0' + convert(varchar(2),  datediff(SECOND, VisitStartDateTime, VisitEndDateTime)%60), 2)+ ' s' as 'TIO mm:ss' 
from IG_O_VisitSummary vs
inner join IG_I_Customer c on c.CustomerCode=vs.CustomerCode
inner join IG_I_JourneyPlan jp on jp.JourneyPlanCode = vs.RouteCode and vs.CustomerCode=jp.CustomerCode
inner join pjp_head ph on ph.pjp = vs.RouteCode
where vs.ETL_DateTime>'20230419' and vs.RouteCode='A006'
order by pop_index 