use centegy_sndpro_uet

-- Delete table if it EXISTS
IF OBJECT_ID('sectionpop_temp', 'U') IS NOT NULL
DROP TABLE sectionpop_temp;
go

-- Create a temp TABLE
CREATE TABLE sectionpop_temp (
    [COMPANY] [varchar](10) NOT NULL,
    [DISTRIBUTOR] [varchar](10) NOT NULL,
    [SELL_CATEGORY] [varchar](3) NOT NULL,
    TOWN varchar(6) NOT NULL, 
    LOCALITY varchar(3) NOT NULL,
    SLOCALITY varchar(3) NOT NULL,
    POP varchar(10) NOT NULL,
    PJP varchar(4) NOT NULL,
    SECTION varchar(5) NOT NULL,
    POP_INDEX smallint NOT NULL,
    CONSTRAINT FK_sectionpop_temp_section 
        FOREIGN KEY (COMPANY, DISTRIBUTOR, SELL_CATEGORY, section)
        REFERENCES [dbo].[SECTION] (COMPANY, DISTRIBUTOR, SELL_CATEGORY, SECTION),
    CONSTRAINT FK_sectionpop_temp_pop 
        FOREIGN KEY (COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR)
        REFERENCES [dbo].[POP] (COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR)
);
go

insert into SECTION_POP_PERMANENT
	(COMPANY, distributor,TOWN,LOCALITY,SLOCALITY,POP,SELL_CATEGORY,STATUS_DAY,SECTION,PJP, pop_index)
select 
	COMPANY, distributor, TOWN,LOCALITY,slocality,pop,sell_category,'99',section,pjp, pop_index  from sectionpop_temp
where 
	town+locality+slocality+pop not in ( select town+locality+slocality+pop from SECTION_POP_PERMANENT)

insert into SECTION_POP
	(COMPANY,TOWN,LOCALITY,SLOCALITY,POP,DISTRIBUTOR,SELL_CATEGORY,STATUS_DAY,SECTION,PJP, pop_index, working_date)
select 
	COMPANY,TOWN,LOCALITY,slocality,pop,distributor,sell_category,'99',section,pjp, pop_index , 
	(select working_date from distributor) 
	from sectionpop_temp
where 
	town+locality+slocality+pop not in ( select town+locality+slocality+pop from SECTION_POP)

