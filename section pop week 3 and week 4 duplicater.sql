use centegy_sndpro_uet
Declare @p varchar(4)='AA01'
Declare @week_in_cycle int=2
Declare @weekno int

insert into SECTION_POP_PERMANENT
	( COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR, SELL_CATEGORY, SECTION, POP_INDEX, STATUS_DAY, PJP)
select COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR, SELL_CATEGORY, /*sp.SECTION,*/ new_section as Section, POP_INDEX, STATUS_DAY, pjpcode as PJP from
 --Select pjp,week_no,prev_section,new_section, count(sp.pop) [total count] from
 (
	-- Run this inner block to check for the cycle mappping
	--Declare @week_in_cycle int=2
	select 
		p.PJP as pjpcode,ph.LDESC PJP_desc, p.WEEK_NO, p.SECTION as prev_section, ps.LDESC prev_sec_desc, pd.SECTION as new_section, pds.LDESC new_sec_desc
	from PJP_DETAIL p
		inner join PJP_DETAIL pd on p.pjp=pd.PJP  and 
			p.mon+p.TUE+ p.wed+p.thu+p.fri+p.sat+p.sun = pd.mon+pd.TUE+ pd.wed+pd.thu+pd.fri+pd.sat+pd.sun and
			(	(p.WEEK_NO = 1 and pd.WEEK_NO = (@week_in_cycle / 2) + 1) or 
				(p.WEEK_NO = 2 and pd.WEEK_NO = @week_in_cycle) )
		inner join section ps on ps.SECTION=p.SECTION and ps.SELL_CATEGORY=p.SELL_CATEGORY
		inner join section pds on pds.SECTION=pd.SECTION and pds.SELL_CATEGORY=p.SELL_CATEGORY
		inner join PJP_HEAD ph on ph.pjp=p.PJP and ph.SELL_CATEGORY=p.SELL_CATEGORY and ph.ACTIVE=1
		where p.WEEK_NO <= @week_in_cycle/2
		--order by p.pjp,p.week_no, p.section
) ns
inner join SECTION_POP_PERMANENT sp on sp.pjp=ns.pjpcode and sp.SECTION=ns.prev_section
--where pjp=@p
--group by pjp,week_no,prev_section,new_section
order by pjp, week_no, ns.new_section
,POP_INDEX
