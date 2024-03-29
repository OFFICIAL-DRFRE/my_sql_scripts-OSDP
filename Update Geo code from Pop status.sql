use centegy_sndpro_uet
go

Declare @dateFrom	date='20230801'
Declare @dateTo		date='20230818'

;with visit_summary as (
select 
	psd.PJP,ph.ldesc PJP_name, p.distributor,p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP pop_code, psd.STATUS,
	convert(varchar, STATUS_DATE,23) Status_time,
	STATUS_TIME Start_time, EXIT_TIME end_time, DATEDIFF(MINUTE, status_time, exit_time) Time_spent,
	TOTAL_VISIT_TIME, 
	isNull(coalesce(cm.net_amount, cm.received_amt), 0) total_sales,
	ROW_NUMBER() over ( partition by pop_code order by Net_amount, DATEDIFF(MINUTE, status_time, exit_time) desc ) as Recommendation_level,
	p.LONGITUDE Mas_long, p.LATITUDE Mas_lat,
	psd.LONGITUDE vis_long, psd.LATITUDE vis_lat, 
	cast(round(dbo.distance(p.latitude,p.longitude, psd.LATITUDE, psd.longitude), 2) as money) 'Distance (m)',
	VISIT_DISTANCE
from POP_STATUS_DETAIL psd
	inner join POP p on p.distributor+p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP = psd.distributor+psd.town+psd.LOCALITY+psd.SLOCALITY+psd.POP
	inner join PJP_HEAD ph on ph.pjp = psd.PJP and ph.SELL_CATEGORY=psd.SELL_CATEGORY
	left join CASHMEMO cm on psd.distributor+p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP = cm.distributor+cm.town+cm.LOCALITY+cm.SLOCALITY+cm.POP 
								and psd.PJP= cm.PJP and psd.STATUS_DATE=cm.DOC_DATE and psd.SECTION=cm.SECTION
where 
	status_date between @dateFrom and @dateTo
	and psd.LONGITUDE <> 0 --and Total_visit_time between 2 and 20

)
--select * from visit_summary
--where 
--	Recommendation_level = 1
--	and [Distance (m)] > 20
--	and Time_spent <= 20
--	--and pop_code = 'T000100600400002746'
--order by pop_code, Recommendation_level,  [Distance (m)] desc, Time_spent desc

update pop set LONGITUDE=vs.vis_long, LATITUDE=vs.vis_lat from pop p
inner join visit_summary vs on vs.pop_code = p.town+p.locality+p.slocality+p.pop and p.DISTRIBUTOR=vs.DISTRIBUTOR
where 
	Recommendation_level = 1
	and [Distance (m)] > 20
	and Time_spent <= 20

 