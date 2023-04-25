SELECT pop.TOWN+pop.LOCALITY+pop.SLOCALITY+pop.POP 'POP_code',pop.NAME,pop.PHONE_NO,l.LDESC,pt.LDESC,c.ldesc,s.LDESC 'Channel Type',d.NAME,ss.LDESC
FROM POP POP
 inner JOIN SECTION_POP_PERMANENT SE ON se.town+se.locality+se.slocality+se.pop = pop.town+pop.locality+pop.slocality+pop.pop
 inner join SUB_ELEMENT s on pop.SUB_ELEMENT=s.SUB_ELEMENT
 inner join PJP_HEAD sp on sp.pjp=se.PJP
 inner join DSR d on d.dsr=sp.dsr
 inner join POP_TYPE pt on pt.POPTYPE=pop.POPTYPE
 inner join SECTION ss on ss.SECTION=SE.section
 inner join SUB_LOCALITY l on l.TOWN=pop.TOWN and l.LOCALITY=pop.LOCALITY and l.SLOCALITY=pop.SLOCALITY
 inner join COMPANY_RANK c on c.COMPANY_RANK=pop.COMPANY_RANK
 --where d.NAME like 'NEW%'