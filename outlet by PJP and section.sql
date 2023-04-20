use centegy_sndpro_uet

select distinct pd.pjp,ph.ldesc PJP_desc, s.ldesc, 
case when count(pop)<>0 then cast(count(sp.pop) as varchar) else '' end as 'outlet count' from PJP_DETAIL pd 
left join SECTION	s on pd.section= s.section and s.SELL_CATEGORY=pd.SELL_CATEGORY
left join section_pop sp on sp.SECTION=pd.SECTION and pd.SELL_CATEGORY=sp.SELL_CATEGORY
inner join PJP_HEAD ph on ph.pjp = pd.pjp and ph.SELL_CATEGORY=pd.SELL_CATEGORY and ph.active=1
where pd.WEEK_NO in (1, 2) --and pd.pjp = 'AA01'
group by pd.pjp, ph.ldesc, cast(s.SECTION as int), s.LDESC