use cen
select cm.distributor 'KD Code',CM.POP_NAME 'Outlet Name',SE.LDESC 'Channel Type',cm.town+cm.locality+cm.slocality 'POP_code', cm.DOC_DATE, C.DOC_NO,year(c.DOC_DATE) 'Year',Month(c.DOC_DATE)'Month',S.LDESC 'SKU Name' ,c.sku,c.amount 'GSV',
((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) 'Number of pcs'
from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
where cm.sub_document in ('01','02','04') and cm.document ='cm' and cm.visit_type = '02' and cm.Delv_date between '20190601' and '20190630' order by DOC_DATE desc