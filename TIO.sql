use centegy_sndpro_uet

declare @date date = '20230513'
DECLARE @pjp varchar(4) = 'A006'

select distinct 
	vs.RouteCode,ph.ldesc PJP_desc, c.CustomerCode, c.CustomerName, 
	jp.SequenceNumber 'Pseq', VisitSequence 'Aseq', VisitStartDateTime 'Start time', VisitEndDateTime 'end time', 
	Right(convert(varchar(3),  datediff(SECOND, VisitStartDateTime, VisitEndDateTime)/60), 2) + ' m ' +
	Right( '0' + convert(varchar(2),  datediff(SECOND, VisitStartDateTime, VisitEndDateTime)%60), 2)+ ' s' as 'TIO mm:ss',
	cast(c.geocodeY as varchar)+', '+cast(c.GeoCodeX as varchar) 'Master Location', 
	cast(vs.StartGeoCodeY as varchar)+', '+ cast(vs.StartGeoCodeX as varchar) 'Actual Location',
	round(dbo.distance(vs.StartGeoCodeY,vs.StartGeoCodeX,c.GeoCodey, c.GeoCodeX),0) 'distance(m)'
from IG_O_VisitSummary vs
	inner join IG_I_Customer c on c.CustomerCode=vs.CustomerCode
	inner join IG_I_JourneyPlan jp on jp.JourneyPlanCode = vs.RouteCode and vs.CustomerCode=jp.CustomerCode
	inner join PJP_HEAD ph on ph.pjp=vs.RouteCode
where vs.ETL_DateTime between @date and dateadd(d,1, @date) 
	and vs.RouteCode = @pjp
order by  vs.routecode, 'pseq' 