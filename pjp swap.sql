Declare @pjpfrom varchar(4) = 'AA01'
Declare @pjpTo varchar(4) = 'G001'

select distinct pjp, section, count(*)  from section_pop_permanent where PJP in (@pjpfrom, @pjpTo)
group by pjp, section

update SECTION_POP_PERMANENT set pjp=@pjpTo where pop in ( select pop from SECTION_POP where pjp=@pjpfrom)
update SECTION_POP_PERMANENT set pjp=@pjpfrom where pop in ( select pop from SECTION_POP where pjp=@pjpTo)

update SECTION_POP set pjp=@pjpfrom where pop in ( select pop from SECTION_POP_PERMANENT where pjp=@pjpfrom)
update SECTION_POP set pjp=@pjpTo where pop in ( select pop from SECTION_POP_PERMANENT where pjp=@pjpTo)