use centegy_sndpro_uet

Declare @sdate date = (select working_date from distributor)
Declare @weekno varchar(2)=(select week_no from JC_WEEK where START_DATE <= @sdate and END_DATE >= @sdate)

UPDATE PJP_detail SET 	
	MON = (CASE when datename(weekday, @SDATE) = 'Monday' 	 then 0 ELSE MON END),
	TUE = (CASE when datename(weekday, @SDATE) = 'Tuesday' 	 then 0 ELSE TUE END),
	WED = (CASE when datename(weekday, @SDATE) = 'Wednesday' then 0 ELSE WED END),
	THU = (CASE when datename(weekday, @SDATE) = 'Thursday'  then 0 ELSE THU END),
	FRI = (CASE when datename(weekday, @SDATE) = 'Friday' 	 then 0 ELSE FRI END),
	SAT = (CASE when datename(weekday, @SDATE) = 'Saturday'  then 0 ELSE SAT END),
	SUN = (CASE when datename(weekday, @SDATE) = 'Sunday'  	 then 0 ELSE SUN END)
WHERE WEEK_NO = @WEEKNO
AND SECTION NOT IN ( SELECT SECTION FROM CASHMEMO WHERE DOC_DATE = @SDATE)

UPDATE PJP_detail SET 	
	MON = (CASE when datename(weekday, @SDATE) = 'Monday' 	 then 1 ELSE MON END),
	TUE = (CASE when datename(weekday, @SDATE) = 'Tuesday' 	 then 1 ELSE TUE END),
	WED = (CASE when datename(weekday, @SDATE) = 'Wednesday' then 1 ELSE WED END),
	THU = (CASE when datename(weekday, @SDATE) = 'Thursday'  then 1 ELSE THU END),
	FRI = (CASE when datename(weekday, @SDATE) = 'Friday' 	 then 1 ELSE FRI END),
	SAT = (CASE when datename(weekday, @SDATE) = 'Saturday'  then 1 ELSE SAT END),
	SUN = (CASE when datename(weekday, @SDATE) = 'Sunday'  	 then 1 ELSE SUN END)
WHERE WEEK_NO = @WEEKNO
AND SECTION IN ( SELECT SECTION FROM CASHMEMO WHERE DOC_DATE = @SDATE)

select DISTINCT  @sdate working_date, @weekno week_no, datename(WEEKDAY, @sdate) Today, PD.PJP, ph.ldesc PJP, ph.ACTIVE,pd.section, s.ldesc section, 
	case when MON = 1 then N'✓' else ' ' end MON, 
	case when TUE = 1 then N'✓' else ' ' end TUE, 
	case when WED = 1 then N'✓' else ' ' end WED, 
	case when THU = 1 then N'✓' else ' ' end THU, 
	case when FRI = 1 then N'✓' else ' ' end FRI,
	case when SAT = 1 then N'✓' else ' ' end SAT
from PJP_detail pd 
inner join PJP_head ph on ph.pjp=pd.pjp and ph.sell_category=pd.sell_category
inner join section s on s.section = pd.section and s.sell_category =pd.sell_category 
inner join DSR d on d.DSR=ph.DSR
where pd.week_no = @weekno and s.section in ( select section from cashmemo where doc_date=@sdate)