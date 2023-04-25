Declare @p varchar(4) ='A002'

--This list the PJP that are created for your DSR
select p.pjp,ph.LDESC PJP, p.section, s.LDESC SEction, WEEK_NO, MON, TUE, WED, THU, FRI, SAT, SUN from PJP_DETAIL p
inner join section s on s.section=p.section
inner join PJP_HEAD ph on ph.PJP=p.PJP
where week_no in (1,2) and p.PJP =@p
--and TUE=1
order by p.pjp,WEEK_NO,p.SEction

-- the List of the sections that are mapped on PJP
select distinct sp.pjp,ph.LDESC PJP, sp.section, s.LDESC SEction /*, WEEK_NO, MON, TUE, WED, THU, FRI, SAT, SUN*/  from section_pop_permanent sp
left join section s on s.section=sp.section
inner join PJP_HEAD ph on ph.PJP=sp.PJP
--right join PJP_DETAIL pd on pd.pjp=sp.PJP and pd.SECTION=sp.SECTION
where  sp.PJP =@p --and s.LDESC like '%TUE%'
order by 1,3

-- this script lists the sections that are not fixed
select distinct PJP,SECTION from SECTION_POP_PERMANENT where pjp=@p and section not in (select section from PJP_DETAIL where PJP=@p)
