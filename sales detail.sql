use Centegy_SNDPRO_UET
go
Declare @datefrom date = '20210730'
Declare @dateTo   date = '20210731'
select cm.distributor 'KD Code',d.NAME 'KD Name',CM.POP_NAME 'Outlet Name',SE.LDESC 'Channel Type',
cm.town+cm.locality+cm.slocality+cm.POP 'POP_code', convert(varchar,cm.DOC_DATE,1) 'Doc Date', 
C.DOC_NO,year(c.DOC_DATE) 'Year',Month(c.DOC_DATE)'Month',S.LDESC 'SKU Name' ,c.sku,convert(float,c.amount*1.15,2) 'GSV',
Convert(int, (C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) 'Number of pcs' ,cm.TOT_DISCOUNT 'Discount'
from CASHMEMO_DETAIL c 
inner join sku s on s.sku = c.sku 
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  
and cm.Delv_date between @dateFrom and @dateTo order by cm.DOC_DATE desc