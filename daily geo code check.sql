select distinct  p.town+'~'+p.locality+'~'+p.slocality+'~'+p.POP POP_code, NAME, PHONE_NO, LATITUDE, LONGITUDE , cg.GeoCodeY Mob_lat, cg.GeoCodeX mob_lon,
GeoCodeDate, ph.LDESC PJP,s.LDESC section, POP_INDEX   from pop p
left join IG_O_CustomerGeoCode  cg on cg.customercode = p.town+'~'+p.locality+'~'+p.slocality+'~'+p.POP
inner join section_pop sp on sp.distributor+sp.TOWN+sp.LOCALITY+sp.SLOCALITY+sp.POP = p.DISTRIBUTOR+ p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP
inner join PJP_HEAD ph on ph.pjp=sp.PJP
inner join SECTION s on s.SECTION = sp.section
where GeoCodeDate >= '20221111'
order by GeoCodeDate desc, section asc, POP_INDEX asc