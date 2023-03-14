select dt.name,ph.LDESC as DSR_Name,
--PP.distributor+pp.town+pp.locality+pp.slocality+pp.pop as POP_ID,
pp.NAME as Outlet_Name,pp.phone_no,sl.LDESC as Sub_Locality, pp.STREET, se.sdesc,pp.active,GETDATE() extract_date 
from pop pp
inner join distributor dt on pp.distributor = dt.distributor
inner join section_pop sp on pp.distributor = sp.distributor and pp.town = sp.town and pp.locality = sp.locality and pp.slocality = sp.slocality and pp.pop = sp.pop
inner join section se on sp.section = se.section
inner join sub_locality sl on sl.TOWN = pp.TOWN and sl.LOCALITY =pp.LOCALITY and sl.SLOCALITY =pp.LOCALITY
inner join PJP_HEAD ph on sp.pjp = ph.PJP
where sp.distributor+sp.town+sp.locality+sp.slocality+sp.pop not in (select distinct distributor+town+locality+slocality+pop from 
cashmemo where doc_date between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) and DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0))
and VISIT_TYPE='02' and DOCUMENT='CM' and SUB_DOCUMENT='01')