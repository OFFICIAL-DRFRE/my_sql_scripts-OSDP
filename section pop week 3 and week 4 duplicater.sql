Declare @p varchar(4)='Y001'
Declare @weekno varchar(2)=1

;with sections (pjpcode,PJP_desc,week_no,cp_fr,sec_fr,cp_to,sec_to)
as (
select p.PJP as pjpcode,ph.LDESC PJP_desc, p.WEEK_NO, p.SECTION, ps.LDESC, pd.SECTION, pds.LDESC
from PJP_DETAIL p
inner join PJP_DETAIL pd on p.pjp=pd.PJP  and ((p.WEEK_NO=1 and pd.WEEK_NO=3) or (p.WEEK_NO=2 and pd.WEEK_NO=4) ) and
--p.mon=pd.mon + p.TUE = pd.Tue and p.wed=pd.wed and p.thu=pd.thu and p.fri=pd.fri and p.sat=pd.sat
p.mon+p.TUE+ p.wed+p.thu+p.fri+p.sat+p.sun = pd.mon+pd.TUE+ pd.wed+pd.thu+pd.fri+pd.sat+pd.sun
left join section ps on ps.SECTION=p.SECTION 
left join section pds on pds.SECTION=pd.SECTION 
inner join PJP_HEAD ph on ph.pjp=p.PJP
--where p.pjp=@p
) 
--select * from sections

select --COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR, SELL_CATEGORY,section, cp_to, POPNO, POP_INDEX, STATUS_DAY, STATUS_TIME, PJP 
 pjp,week_no,section,cp_to, count(pop) [total count]
from sections s
left join SECTION_POP_PERMANENT sp on sp.pjp=s.pjpcode and sp.SECTION=s.cp_fr
--where pjp=@p
group by pjp,week_no,section,cp_to
--order by pjp,cp_to,POP_INDEX

