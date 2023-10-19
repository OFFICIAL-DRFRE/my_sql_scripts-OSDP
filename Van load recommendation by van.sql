use centegy_sndpro_uet
go

Declare @sdate date = '20230530'
Declare @weekno varchar(2)=(select week_no from JC_WEEK where START_DATE <= @sdate and END_DATE >= @sdate)
Declare @col varchar(3) =  upper(left(datename(weekday, @SDATE), 3))
Declare @sqlscript NVARCHAR(max);

set @sqlscript = 
'select * from (
	select distinct v.description Vehicle,  
	 convert(varchar, @sdate, 23) as doc_date, 
	m.LDESC SKU_desc, 
	case 
		when cast( round(Sum(norms_qty - isnull(achive_qty, 0)) / m.sell_factor1, 1) as int) <= 0 then 0
		else cast( round(Sum(norms_qty - isnull(achive_qty, 0)) / m.sell_factor1, 1) as int) end
		as total_case
	 from SUGGESTED_ORDER so
		inner join SECTION_POP sp on sp.TOWN+sp.DISTRIBUTOR+sp.LOCALITY+sp.SLOCALITY+sp.POP = REPLACE(up_code, ''-'', '''')
		inner join PJP_HEAD ph on ph.PJP = sp.PJP and ph.SELL_CATEGORY=sp.SELL_CATEGORY
		inner join PJP_DETAIL pd on pd.PJP=ph.PJP and pd.WEEK_NO= ' + @weekno+' and pd.section=sp.section and pd.sell_category=sp.sell_category
		inner join SECTION s on s.SECTION = sp.SECTION and s.SELL_CATEGORY=sp.SELL_CATEGORY
		inner join DSR d on d.DSR = ph.DSR
		inner join vehicle v on v.vehicle=d.vehicle
		inner join master_SKU m on m.MASTER_SKU = so.sku_code
	where moc_no = right(''0''+ cast( month(@sdate)as varchar), 2) and moc_year =YEAR(@sdate) and pd.' + @col + ' = 1
	group by  description, m.LDESC, m.SELL_FACTOR1
	) st
where total_case > 0
'
exec sp_executesql @sqlscript, N'@sdate date',@sdate
 
