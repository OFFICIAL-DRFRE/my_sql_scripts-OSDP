select cm.distributor 'KD Code',d.NAME 'KD Name',CM.POP_NAME 'Outlet Name',SE.LDESC 'Channel Type',
cm.town+cm.locality+cm.slocality+cm.POP 'POP_code', cm.DOC_DATE,delv_date,C.DOC_NO,
year(c.DOC_DATE) 'Year',Month(c.DOC_DATE)'Month',pj.pjp as  'pjp',
ds.NAME AS NAME,S.LDESC 'SKU Name' ,c.sku,c.amount 'GSV',

((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) 'Number of pcs'

from CASHMEMO_DETAIL c

inner join sku s on s.sku = c.sku

inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO

inner join pop p on p.pop =cm.pop

inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT

inner join distributor d on d.distributor=c.distributor

inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP

inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR

where cm.sub_document in ('01','02','03','04') and cm.document ='cm' 
 and cm.Delv_date between '20200101' and '20200103'  order by DOC_DATE desc