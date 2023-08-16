
use Centegy_SnDPro_UET
go

Declare @datefr date ='01-Jan-2021'
Declare @dateto date ='30-Jun-2023'

select 
	T.ldesc Territory, 
	year(c.doc_date) 'Year', 
	Month(c.DOC_DATE)'Month',
	S.LDESC 'SKU Name' ,
	SE.LDESC 'Channel Type',
	count( distinct cm.distributor+cm.town+cm.locality+cm.slocality+cm.pop) 'Unique POP count',
	Cast(sum( ((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))) as int) 'Sales - pcs',
	sum( ((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) ) / s.SELL_FACTOR1 'Sales - Cs',
	sum( ((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))/1000000.0 * s.SELL_WEIGHT3 'Sales - Tons'
from CASHMEMO_DETAIL c
	inner join sku s on s.sku = c.sku
	inner join CASHMEMO cm on cm.DISTRIBUTOR=c.DISTRIBUTOR and cm.DOC_NO=c.DOC_NO
	inner join pop p on p.DISTRIBUTOR+p.town+p.locality+p.slocality+p.pop = cm.distributor+cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop
	inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT and p.COMPANY=se.COMPANY
	inner join distributor d on d.distributor=c.distributor
	inner join town t on t.town =d.TOWN
where 
	cm.sub_document in ('01','02','03','04') and cm.document ='CM'  and c.DOC_DATE between @datefr and @dateto
group by T.ldesc, year(c.DOC_DATE), Month(c.DOC_DATE),s.LDESC, SE.LDESC, s.SELL_FACTOR1, s.SELL_WEIGHT3
order by year,Month, t.ldesc
