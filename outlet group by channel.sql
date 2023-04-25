

use centegy_sndpro_uet
select d.distributor,d.name,s.ldesc, count(p.town+locality+slocality+pop) 'total count'from pop p 
inner join sub_element s on s.sub_element=p.SUB_ELEMENT
inner join DISTRIBUTOR d on d.COMPANY=p.COMPANY and d.DISTRIBUTOR=p.DISTRIBUTOR
where ACTIVE=1
group by d.distributor,d.name,s.LDESC

