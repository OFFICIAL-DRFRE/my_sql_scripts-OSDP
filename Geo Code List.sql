select t.ldesc as Town,l.ldesc Locality, sl.LDESC as Sub_locality,p.TOWN+p.LOCALITY+p.SLOCALITY+p.pop POP_code, p.name as Outlet_Name, p.PHONE_NO as Phone_No,
se.ldesc as Channel_type, p.MARKET_NAME as Market_Name,DSR, ph.LDESC PJP,
p.LATITUDE,p.LONGITUDE from pop p 
inner Join SECTION_POP_PERMANENT spp on spp.POP =p.POP and spp.DISTRIBUTOR = p.DISTRIBUTOR 
inner Join PJP_HEAD ph on ph.PJP =spp.pjp and ph.DISTRIBUTOR=spp.DISTRIBUTOR
inner join LOCALITY l on l.TOWN=p.TOWN and l.LOCALITY=p.LOCALITY
Inner Join SUB_LOCALITY sl on sl.LOCALITY =p.LOCALITY and sl.SLOCALITY =p.SLOCALITY and sl.TOWN =p.TOWN 
inner jOIn TOWN t on t.TOWN =p.TOWN
inner Join SUB_ELEMENT se on se.SUB_ELEMENT = p.SUB_ELEMENT
where p.pop in (select POP from SECTION_POP_PERMANENT) and p.ACTIVE ='1'