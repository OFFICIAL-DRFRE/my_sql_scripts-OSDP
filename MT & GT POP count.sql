use centegy_sndpro_uet
select distinct d.distributor,d.name,s.ldesc Channel, 
count( Case when sp.Pjp ='MORD' then   p.town+p.locality+p.slocality+p.pop end) as 'Modern Trade',
count( Case when sp.Pjp <>'MORD' then   p.town+p.locality+p.slocality+p.pop end) as 'General Trade'
from pop p 
inner join sub_element s on s.sub_element=p.SUB_ELEMENT
inner join DISTRIBUTOR d on d.COMPANY=p.COMPANY and d.DISTRIBUTOR=p.DISTRIBUTOR
inner join section_POP sp on sp.town+sp.locality+sp.slocality+sp.pop=p.town+p.locality+p.slocality+p.pop
where ACTIVE=1
group by d.distributor,d.name,s.LDESC