use Centegy_sndpro_uet
select ph.pjp,ph.LDESC,s.section,s.ldesc section,min(POP) 'First POP',Max(POP) 'last POP', isnull( cast(min(pop_index) as varchar(4)),'N/A') Index_from, 
isNULL(cast(max(pop_index) as varchar(4)), 'N/A') Index_to, count(*) total_outlets from SECTION_POP_PERMANENT sp 
inner join PJP_HEAD ph on sp.pjp=ph.PJP
inner join SECTION s on sp.SECTION=s.SECTION
group by ph.pjp,ph.ldesc,s.section, s.LDESC
