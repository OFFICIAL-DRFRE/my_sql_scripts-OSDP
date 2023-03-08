use centegy_sndpro_uet
select  
d.distributor DT_code,d.name DT_name,
Town.ldesc as 'Town', 
p.town+p.LOCALITY+p.SLOCALITY+p.POP as 'POP Code',
p.name as 'Customer Name',
p.PHONE_NO as 'Customer Contact', 
SUB_ELEMENT.LDESC as 'Channel Type',
pt.LDESC as 'POP Type',
p.STREET as 'LandMark',
l.LDESC as 'Locality', 
SUB_LOCALITY.LDESC as 'Sub Locality',
SECTION.LDESC as 'Day and Week No.',
ph.PJP pjp_code,
ph.LDESC as 'Sales man detail',
spp.POP_INDEX as 'POP Index',
p.latitude Lat,
p.longitude long 
from pop p
inner JOIN SECTION_POP spp ON p.town+p.locality+p.slocality+p.pop = spp.town+spp.locality+spp.slocality+spp.pop
inner JOIN section ON spp.SECTION = SECTION.SECTION and spp.sell_category=section.sell_category
inner Join TOWN ON p.TOWN= town.TOWN
inner join LOCALITY l ON p.LOCALITY = l.LOCALITY and p.TOWN = l.TOWN
inner JOIN SUB_LOCALITY ON p.SLOCALITY = SUB_LOCALITY.SLOCALITY and SUB_LOCALITY.LOCALITY=p.LOCALITY and SUB_LOCALITY.TOWN = p.TOWN
inner Join SUB_ELEMENT ON p.SUB_ELEMENT = SUB_ELEMENT.SUB_ELEMENT
inner Join PJP_HEAD ph ON ph.PJP = spp.pjp and ph.DISTRIBUTOR = p.DISTRIBUTOR 
inner join POP_TYPE pt on pt.POPTYPE=p.POPTYPE
inner join Distributor d on d.DISTRIBUTOR=p.DISTRIBUTOR
order by section.SECTION asc