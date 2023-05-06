create table sectionpop_temp(
town varchar(6), 
locality varchar(3),
slocality varchar(3),
pop varchar(10),
pjp varchar(4),
section varchar(5),
pop_index smallint)


alter table section_pop_permanent nocheck constraint FK_SECTION_POP_PERMANENT__POP
alter table section_pop nocheck constraint FK_SECTION_POP__POP
go

declare @dtcode varchar(10) = (select top 1 DISTRIBUTOR from DISTRIBUTOR)

insert into SECTION_POP_PERMANENT
(COMPANY,TOWN,LOCALITY,SLOCALITY,POP,DISTRIBUTOR,SELL_CATEGORY,STATUS_DAY,SECTION,PJP, pop_index)
select '23',TOWN,LOCALITY,slocality,pop,@dtcode,'001','99',section,pjp, pop_index  from sectionpop_temp
where town+locality+slocality+pop not in ( select town+locality+slocality+pop from SECTION_POP_PERMANENT)

insert into SECTION_POP
(COMPANY,TOWN,LOCALITY,SLOCALITY,POP,DISTRIBUTOR,SELL_CATEGORY,STATUS_DAY,SECTION,PJP, pop_index)
select '23',TOWN,LOCALITY,slocality,pop,@dtcode,'001','99',section,pjp, pop_index  from sectionpop_temp
where town+locality+slocality+pop not in ( select town+locality+slocality+pop from SECTION_POP)
go


update section_pop set working_date = (select working_date from distributor) where working_date is null
go
alter table section_pop_permanent check constraint FK_SECTION_POP_PERMANENT__POP
alter table section_pop check constraint FK_SECTION_POP__POP