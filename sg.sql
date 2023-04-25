select p.name,s.LDESC,x.SDESC,sp.PJP ,p.town+p.locality+p.slocality+p.pop,PHONE_NO,l.LDESC Address from pop p
inner join section_pop sp on sp.town+sp.LOCALITY+sp.SLOCALITY+sp.POP=p.town+p.locality+
p.slocality+p.pop and active=1
inner join section x on sp.SECTION=x.SECTION
inner join SUB_LOCALITY l on l.TOWN=p.TOWN and l.LOCALITY=p.LOCALITY and l.SLOCALITY=p.SLOCALITY
inner join sub_element s on p.SUB_ELEMENT=s.SUB_ELEMENT
where s.ldesc like 'ph%' 
--and PJP like 'A001'
 --and sk.SDESC!='Signal TP CF 60'

