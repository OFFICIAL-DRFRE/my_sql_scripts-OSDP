use centegy_sndpro_uet
Declare @startdate date = '20220601'
Declare @endDate   date = '20220630'
select t.ldesc as Town,l.ldesc Locality, sl.LDESC as Sub_locality,p.TOWN+p.LOCALITY+p.SLOCALITY+p.pop POP_code, p.name as Outlet_Name, 
p.PHONE_NO as Phone_No, se.ldesc as Channel_type, p.MARKET_NAME as Market_Name,DSR, ph.LDESC PJP,
spp.POP_INDEX 'Seq Master', p.LATITUDE Master_lat,p.LONGITUDE Master_lon,
vs.visitsequence, vs.StartGeoCodeY visit_lat, vs.StartGeoCodeX visit_long,vs.VISIT_DISTANCE,vs.VisitStartDateTime , 
convert(varchar, p.UPDATED_DATE,23) as updated_date from pop p 
inner Join SECTION_POP_PERMANENT spp on spp.POP =p.POP and spp.DISTRIBUTOR = p.DISTRIBUTOR 
inner Join PJP_HEAD ph on ph.PJP =spp.pjp and ph.DISTRIBUTOR=spp.DISTRIBUTOR
inner join LOCALITY l on l.TOWN=p.TOWN and l.LOCALITY=p.LOCALITY
Inner Join SUB_LOCALITY sl on sl.LOCALITY =p.LOCALITY and sl.SLOCALITY =p.SLOCALITY and sl.TOWN =p.TOWN 
left join IG_O_VisitSummary vs on replace(vs.CustomerCode, '~', '') =  p.town+p.locality+p.slocality+p.pop
inner jOIn TOWN t on t.TOWN =p.TOWN
inner Join SUB_ELEMENT se on se.SUB_ELEMENT = p.SUB_ELEMENT
where p.ACTIVE ='1' and vs.ETL_DateTime BETWEEN @startdate and @endDate

