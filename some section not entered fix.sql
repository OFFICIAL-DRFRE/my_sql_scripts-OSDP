use Centegy_sndpro_uet
/*
---------------------------------------------------------------------
|	MAKE SURE YOU TURN THE SWITCH ON/OFF AS PER YOUR REQUIREMENT	|
|	YOU CAN CHANGE THE WORKING DATE AS WELL IN THE VARIABLE BELOW	|
---------------------------------------------------------------------
*/

dECLARE @SWITCH bit = 0;
Declare @date date= (select top 1 WORKING_DATE from DISTRIBUTOR)

Declare @weekno numeric=(select week_no from JC_WEEK where START_DATE <= cast(@date as date) and END_DATE >= cast(@date as date))

select pd.PJP, ph.LDESC pPJP_name,pd.section, se.SDESC section_name, 
	case when MON = 0 then ' ' else 'x'  end as MON  , 
	case when TUE = 0 then ' ' else 'x'  end as TUE , 
	case when wed = 0 then ' ' else 'x'  end as WED , 
	case when thu = 0 then ' ' else 'x'  end as thu , 
	case when FRI = 0 then ' ' else 'x'  end as FRI , 
	case when sat = 0 then ' ' else 'x'  end as SAT , 
	case when SUN = 0 then ' ' else 'x'  end as SUN ,
	convert(varchar, Ph.working_date, 23) as working_date
from PJP_detail pd  
	inner join section se on se.section = pd.SECTIon and se.SELL_CATEGORY=pd.SELL_CATEGORY
	inner join PJP_HEAD ph on ph.PJP=pd.PJP and ph.SELL_CATEGORY=pd.SELL_CATEGORY and ph.ACTIVE=1
where
	pd.WEEK_NO=@weekno and ph.pjp not in (select pjp from CASHMEMO where DOC_DATE=@date) and 
	se.ldesc like DATENAME(WEEKDAY, @date)+'%'


update PJP_DETAIL 
	set
		MON = CASE datename(weekday, @date) WHEN 'Saturday'		then @switch else @switch end,
		TUE = CASE datename(weekday, @date) WHEN 'Tuesday'		then @switch else @switch end,
		WED = CASE datename(weekday, @date) WHEN 'Wednesday'	then @switch else @switch end,
		THU = CASE datename(weekday, @date) WHEN 'Thursday'		then @switch else @switch end,
		FRI = CASE datename(weekday, @date) WHEN 'Friday'		then @switch else @switch end,
		SAT = CASE datename(weekday, @date) WHEN 'Saturday'		then @SWITCH else @switch end

from PJP_DETAIL pd
	inner join section se on se.section = pd.SECTIon and se.SELL_CATEGORY=pd.SELL_CATEGORY
	inner join PJP_HEAD ph on ph.PJP=pd.PJP and ph.SELL_CATEGORY=pd.SELL_CATEGORY and ph.ACTIVE=1
where
	pd.WEEK_NO=@weekno and ph.pjp not in (select pjp from IG_O_SalesOrderHeader where CAST(ETL_DateTime AS DATE)=@date) and 
	se.ldesc like DATENAME(WEEKDAY, getdate())+'%'


