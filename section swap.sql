use centegy_sndpro_uet

Declare @pjpfrom varchar(4) = 'A001'
Declare @pjpTo varchar(4) = 'A002'
Declare @sectionfrom varchar(5) = '11'
Declare @sectionTo varchar(5) = '18'

select distinct pjp, section, count(*) 'total outlet' from section_pop_permanent where SECTION in (@sectionfrom, @sectionTo) AND SECTION IN (@sectionfrom, @sectionTo)
group by pjp, section

update SECTION_POP_PERMANENT set section=@sectionTo, pjp=@pjpTo where pop in ( select pop from SECTION_POP where section=@sectionfrom)
update SECTION_POP_PERMANENT set section=@sectionfrom, pjp=@pjpfrom where pop in ( select pop from SECTION_POP where section=@sectionTo)

update SECTION_POP set section=@sectionfrom, PJP= @pjpfrom where pop in ( select pop from SECTION_POP_PERMANENT where section=@sectionfrom)
update SECTION_POP set section=@sectionTo, PJP=@pjpTo where pop in ( select pop from SECTION_POP_PERMANENT where section=@sectionTo)
