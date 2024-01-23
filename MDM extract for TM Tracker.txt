use Centegy_sndpro_uet
go

-- Check the PJP and section mapping using this script
select sp.pjp, ph.LDESC PJP_desc, s.section, s.LDESC section, 
	replace( Mon, 0, '') Mon,
	replace( tue, 0, '') tue,
	replace( wed, 0, '') wed,
	replace( thu, 0, '') thu,
	replace( fri, 0, '') fri,
	replace( sat, 0, '') sat,
	replace( sun,  0, '') sun
from SECTION_POP sp 
inner join PJP_HEAD ph on ph.PJP=sp.PJP and ph.SELL_CATEGORY=sp.SELL_CATEGORY and ph.ACTIVE=1
inner join PJP_DETAIL pd on pd.PJP=sp.PJP and pd.SELL_CATEGORY=sp.SELL_CATEGORY and pd.SECTION=sp.SECTION
inner join section s on s.SELL_CATEGORY=sp.SELL_CATEGORY and s.SECTION=sp.SECTION
where mon+tue+wed+thu+fri+SAT = 0 and WEEK_NO between 1 and 4


--- EXtract the report using this script
select distinct 
	x.* ,
	row_number() over( partition by x.section order by distributor, x.section) as pop_index
from (
SELECT distinct 
	p.COMPANY, p.TOWN, p.LOCALITY, p.SLOCALITY, p.POP, p.DISTRIBUTOR, NAME, MARKET_NAME, STREET, PHONE_NO, 
	SUB_ELEMENT, right(p.distributor+p.town+p.LOCALITY+p.SLOCALITY+p.POP, 40) as Prev_code, POPTYPE,isNull( OWNER_NAME,p.NAME) Owner_name, 
	LATITUDE, LONGITUDE,Perfect_Store_Level, '' PJP,
	sp.SECTION prev_section,
	case
		when pd.MON = 1 and WEEK_NO % 2 = 1 then '01'
		when pd.TUE = 1 and WEEK_NO % 2 = 1 then '02'
		when pd.WED = 1 and WEEK_NO % 2 = 1 then '03'
		when pd.THU = 1 and WEEK_NO % 2 = 1 then '04'
		when pd.FRI = 1 and WEEK_NO % 2 = 1 then '05'
		when pd.SAT = 1 and WEEK_NO % 2 = 1 then '06'
		when pd.MON = 1 and WEEK_NO % 2 = 0 then '07'
		when pd.TUE = 1 and WEEK_NO % 2 = 0 then '08'
		when pd.WED = 1 and WEEK_NO % 2 = 0 then '09'
		when pd.THU = 1 and WEEK_NO % 2 = 0 then '10'
		when pd.FRI = 1 and WEEK_NO % 2 = 0 then '11'
		when pd.SAT = 1 and WEEK_NO % 2 = 0 then '12'
		else ''
	end as Section
FROM POP p 
inner join SECTION_POP sp on sp.DISTRIBUTOR+sp.TOWN+sp.LOCALITY+sp.SLOCALITY+sp.POP = p.DISTRIBUTOR+p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP
inner join PJP_DETAIL pd on pd.DISTRIBUTOR=sp.DISTRIBUTOR and pd.sell_category+pd.SECTION=sp.SELL_CATEGORY+sp.SECTION and pd.PJP=sp.PJP
where p.ACTIVE=1
)x
--where x.section = 13
order by DISTRIBUTOR, pjp, section, POP_Index 