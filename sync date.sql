declare @datefrom date ='20200101'
declare @dateto date ='20200103'

--Declare @DSR varchar(4) set @DSR='A001'

select pjp,delv_date,s.LDESC 'name',c.sku'sku code',cm.Schedule_Delv_Date,cm.DOC_DATE,cm.POP_NAME 'outlet name',CM.DOC_NO,
convert(int, (c.QTY1*S.sell_factor1)+(QTY2*S.SELL_FACTOR2)+(QTY3*sell_factor3))'no of pc',
VISIL_TYPE='01',DATE_MODIFY,year (GETDATE())as year
from CASHMEMO_DETAIL c 
inner join sku s on s.sku=c.sku 
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO


--where 
--pjp=@DSR and  
where Schedule_Delv_Date=cm.DOC_DATE and  
DELV_DATE between @datefrom and @dateto 
--order by cm.POP_NAME,S.LDESC,cm.DOC_DATE desc

