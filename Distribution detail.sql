select cm.distributor 'KD Code',CM.POP_NAME 'Outlet Name',cm.PJP, SE.LDESC 'Channel Type',cm.town+cm.locality+cm.slocality 'POP_code', 
cm.DOC_DATE, C.DOC_NO,year(c.DOC_DATE) 'Year',Month(c.DOC_DATE)'Month', c.sku, S.LDESC 'SKU Name',
(C.QTY1) CS,(QTY2) DZ, (QTY3)  PC, Convert(int, (C.QTY1*s.SELL_FACTOR1)+(QTY2*s.SELL_FACTOR2)+(QTY3)) 'Total number in PCs',
convert(float, round( c.amount*1.15,2)) 'GSV',TOT_DISCOUNT from CASHMEMO_DETAIL c 
inner join sku s on s.sku = c.sku 
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
where cm.sub_document in ('01','02','04') and cm.document ='cm' and cm.visit_type = '02' 
and s.SKU in (21032795, 67154420, 21056179, 67474454,34087550, 67474368) and
cm.Delv_date between DATEADD(mm, DATEDIFF(mm, 0, GETDATE()), 0) and  DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())+1,0)) and 
(C.QTY1*s.SELL_FACTOR1)+(QTY2*s.SELL_FACTOR2)+(QTY3) !=0
order by DOC_DATE desc