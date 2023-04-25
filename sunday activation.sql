update dbo.PJP_DETAIL set sun=1 where WEEK_NO in (13) and SECTION in (select min(sp.section) from section_pop_permanent sp
inner join SECTION s on s.SECTION=sp.SECTIOn
where s.LDESC like '%mon%'
group by pjp
)
update PJP_DETAIL set sun=1 where WEEK_NO in (14) and pjp_detail.SECTION in (select max(sp.section) from section_pop_permanent sp
inner join SECTION s on s.SECTION=sp.SECTION
where s.LDESC like '%mon%'
group by pjp
)

select  pj.ldesc PJP, s.LDESC Section,week_no,SUN from PJP_DETAIL pd 
inner join PJP_HEAD pj on pj.pjp=pd.PJP and pj.distributor=pd.DISTRIBUTOR
inner join SECTION s on s.SECTION=pd.SECTION
where WEEK_NO in (13,14) and sun=1
order by pj.ldesc,WEEK_NO asc