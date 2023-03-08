use centegy_sndpro_uet
select distinct d.distributor,d.name,s.ldesc Channel, count(p.town+P.locality+P.slocality+P.pop) over(partition by p.sub_element) as  'channel count',
count(p.town+P.locality+P.slocality+p.pop) over(partition by p.distributor) as  'Total count' from pop p 
--INNER JOIN SECTION_POP SP ON SP.TOWN+SP.LOCALITY+SP.SLOCALITY+SP.POP = P.TOWN+P.LOCALITY+P.SLOCALITY+P.POP
inner join sub_element s on s.sub_element=p.SUB_ELEMENT
inner join DISTRIBUTOR d on d.COMPANY=p.COMPANY and d.DISTRIBUTOR=p.DISTRIBUTOR
where ACTIVE=1