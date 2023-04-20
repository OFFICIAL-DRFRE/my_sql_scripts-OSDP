use centegy_sndpro_uet
Declare @startDate date='20230401'
Declare @endDate   date='20230414'

select d.DISTRIBUTOR,d.NAME Kd_name, ps.PJP,ph.LDESC PJP,ps.town+ps.LOCALITY+ps.SLOCALITY+ps.POP [pop code],p.name outlet_name, convert(VARCHAR,STATUS_DATE,23) STATUS_DATE, 
CONVERT(VARCHAR, MIN(ps.STATUS_TIME),22) 'Start time', CONVERT(varchar, MAX(EXIT_TIME),22) 'End Time' from POP_STATUS_DETAIL ps
left join SECTION_POP sp on sP.DISTRIBUTOR+sp.TOWN+sp.LOCALITY+sp.slocality+sp.POP=ps.DISTRIBUTOR+ps.TOWN+ps.LOCALITY+ps.SLOCALITY+ps.POP
inner join pop p on p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP=ps.town+ps.LOCALITY+ps.SLOCALITY+ps.POP
inner join PJP_HEAD ph on ph.pjp=ps.PJP
inner join Distributor d on d.distributor=ps.DISTRIBUTOR
where STATUS_DATE between @startDate and @enddate
group by d.DISTRIBUTOR,d.NAME, ps.pjp,ph.LDESC, status_date,ps.town+ps.LOCALITY+ps.SLOCALITY+ps.POP,p.name
order by STATUS_DATE,[Start time]
