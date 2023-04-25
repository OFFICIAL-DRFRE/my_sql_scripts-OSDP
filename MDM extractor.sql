SELECT POP_index,pop.TOWN+pop.LOCALITY+pop.SLOCALITY+pop.POP 'POP_code',pop.NAME,pop.PHONE_NO,l.LDESC Address,pt.LDESC 'Pop type',
c.ldesc 'Company Rank',
s.LDESC 'Channel Type',d.NAME DSR,ss.LDESC Section,sp.LDESC PJP,'' 'Reason','' Sale
FROM POP POP
 left JOIN SECTION_POP_PERMANENT SE ON pop.town+pop.locality+pop.slocality+POP.POP=se.town+se.locality+se.slocality+SE.POP
 inner join SUB_ELEMENT s on pop.SUB_ELEMENT=s.SUB_ELEMENT
 left join PJP_HEAD sp on sp.pjp=se.PJP
 left join DSR d on d.dsr=sp.dsr
 inner join POP_TYPE pt on pt.POPTYPE=pop.POPTYPE
 left join SECTION ss on ss.SECTION=SE.section
 inner join SUB_LOCALITY l on l.TOWN=pop.TOWN and l.LOCALITY=pop.LOCALITY and l.SLOCALITY=pop.SLOCALITY
 inner join COMPANY_RANK c on c.COMPANY_RANK=pop.COMPANY_RANK
 order by se.pjp,se.SECTION,se.POP_INDEX