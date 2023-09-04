use centegy_sndpro_uet
select  
	d.distributor DT_code,
	d.name DT_name,
	Town.ldesc as 'Town', 
	p.town+p.LOCALITY+p.SLOCALITY+p.POP as 'POP Code',
	p.name as 'Customer Name',
	p.PHONE_NO as 'Customer Contact', 
	se.LDESC as 'Channel Type',
	pt.LDESC as 'POP Type',
	p.STREET as 'LandMark',
	l.LDESC as 'Locality', 
	sl.LDESC as 'Sub Locality',
	s.LDESC as 'Day and Week No.',
	ph.PJP pjp_code,
	ph.LDESC as 'Sales man detail',
	spp.POP_INDEX as 'POP Index',
	p.latitude Lat,
	p.longitude long,
	REPLACE(ps.SDESC, 'ES','') 'Perfect store status'
from pop p
	inner join Distributor d on d.DISTRIBUTOR=p.DISTRIBUTOR
	inner JOIN SECTION_POP spp ON p.town+p.locality+p.slocality+p.pop = spp.town+spp.locality+spp.slocality+spp.pop and p.DISTRIBUTOR=d.DISTRIBUTOR
	inner JOIN section s ON spp.SECTION = s.SECTION and spp.sell_category=s.sell_category
	inner Join TOWN ON p.TOWN= town.TOWN
	inner join LOCALITY l ON p.LOCALITY = l.LOCALITY and p.TOWN = l.TOWN
	inner JOIN SUB_LOCALITY sl ON p.SLOCALITY = sl.SLOCALITY and sl.LOCALITY=p.LOCALITY and sl.TOWN = p.TOWN
	inner Join SUB_ELEMENT se ON p.SUB_ELEMENT = se.SUB_ELEMENT
	inner Join PJP_HEAD ph ON ph.PJP = spp.pjp and ph.DISTRIBUTOR = p.DISTRIBUTOR 
	inner join POP_TYPE pt on pt.POPTYPE=p.POPTYPE
	inner join perfect_store_level ps on ps.LEVEL_CODE = p.perfect_store_level
order by ph.ldesc, s.SECTION, POP_INDEX asc