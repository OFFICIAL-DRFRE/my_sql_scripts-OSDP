use centegy_sndpro_uet

-- For Daily Report
select ph.LDESC PJP,p.Market_name, STATUS_DATE,CONVERT(varchar(15),CAST(min(ps.status_time) AS TIME),100) 'Start time', 
CONVERT(varchar(15),CAST(min(ps.Exit_time) AS TIME),100) 'End Time', count(ps.POP) 'Total POP visited' from POP_STATUS_DETAIL ps
inner join SECTION_POP_PERMANENT sp on sp.DISTRIBUTOR+sp.TOWN+sp.LOCALITY+sp.slocality+sp.POP=ps.DISTRIBUTOR+ps.TOWN+ps.LOCALITY+ps.SLOCALITY+ps.POP
inner join PJP_HEAD ph on ph.pjp=ps.PJP
inner join pop p on P.DISTRIBUTOR+p.TOWN+p.LOCALITY+p.slocality+p.POP=ps.DISTRIBUTOR+ps.TOWN+ps.LOCALITY+ps.SLOCALITY+ps.POP
where STATUS_DATE between '20190611' and '20190611'
group by ph.LDESC, market_name, status_date
order by ph.LDESC,STATUS_DATE asc

-- For Daily Time Stamp Report
select ph.LDESC PJP, p.name,Market_name, convert(varchar,STATUS_DATE,103) 'Visit Date',CONVERT(varchar(15),CAST(ps.status_time AS TIME),100) 'Start time', 
CONVERT(varchar(15),CAST(ps.Exit_time AS TIME),100) 'End Time', sp.POP_INDEX ,
STUFF(CONVERT(VARCHAR(20),EXIT_TIME-ps.STATUS_TIME,114),1,2,DATEDIFF(hh,0,EXIT_TIME-ps.STATUS_TIME)) 'Market Duration' from POP_STATUS_DETAIL ps
inner join SECTION_POP_PERMANENT sp on sP.DISTRIBUTOR+sp.TOWN+sp.LOCALITY+sp.slocality+sp.POP=ps.DISTRIBUTOR+ps.TOWN+ps.LOCALITY+ps.SLOCALITY+ps.POP and sp.PJP=ps.PJP
inner join PJP_HEAD ph on ph.pjp=ps.PJP
inner join pop p on P.DISTRIBUTOR+p.TOWN+p.LOCALITY+p.slocality+p.POP=ps.DISTRIBUTOR+ps.TOWN+ps.LOCALITY+ps.SLOCALITY+ps.POP
where STATUS_DATE ='20190611'
order by Ph.LDESC,EXIT_TIME asc