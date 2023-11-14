use centegy_sndpro_uet
select  
	d.distributor DT_code,d.name DT_name,
	Town.ldesc as 'Town', 
	convert(varchar, getdate(), 23) 'Report Date',
	p.distributor+p.town+p.LOCALITY+p.SLOCALITY+p.POP as 'POP Code',
	p.name as 'Customer Name',
	p.PHONE_NO as 'Customer Contact', 
	SUB_ELEMENT.LDESC as 'Channel Type',
	pt.LDESC as 'POP Type',
	p.STREET as 'LandMark',
	l.LDESC as 'Locality', 
	SUB_LOCALITY.LDESC as 'Sub Locality',
	ISNULL( SECTION.LDESC, 'N/A') as 'Day and Week No.',
	ISNULL( ph.PJP, 'N/A') pjp_code,
	ISNULL( ph.LDESC, 'Not Assigned') as 'Sales man detail',
	spp.POP_INDEX as 'POP Index',
	p.latitude Lat,
	p.longitude long,
	REPLACE( ps.sdesc, 'ES', '') 'PS status'
from pop p
	LEFT JOIN SECTION_POP spp ON p.distributor+p.town+p.locality+p.slocality+p.pop = spp.distributor+spp.town+spp.locality+spp.slocality+spp.pop
	LEFT JOIN section ON spp.SECTION = SECTION.SECTION and spp.sell_category=section.sell_category and section.distributor = spp.DISTRIBUTOR
	INNER JOIN TOWN ON p.TOWN= town.TOWN
	INNER JOIN LOCALITY l ON p.LOCALITY = l.LOCALITY and p.TOWN = l.TOWN
	INNER JOIN SUB_LOCALITY ON p.SLOCALITY = SUB_LOCALITY.SLOCALITY and SUB_LOCALITY.LOCALITY=p.LOCALITY and SUB_LOCALITY.TOWN = p.TOWN
	INNER JOIN SUB_ELEMENT ON p.SUB_ELEMENT = SUB_ELEMENT.SUB_ELEMENT
	LEFT JOIN PJP_HEAD ph ON ph.PJP = spp.pjp and ph.DISTRIBUTOR = p.DISTRIBUTOR 
	INNER JOIN POP_TYPE pt on pt.POPTYPE=p.POPTYPE
	INNER JOIN Distributor d on d.DISTRIBUTOR=p.DISTRIBUTOR
	INNER JOIN perfect_store_level ps on ps.level_code=p.perfect_store_level	
WHERE P.ACTIVE = 1 
order by section.SECTION asc
