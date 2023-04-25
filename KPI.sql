 declare @today datetime = '11-may-2021'
;WITH tspp AS(SELECT spp.distributor, spp.PJP, spp.SECTION, pd.Week_no, COUNT(spp.distributor+spp.town+spp.locality+spp.slocality+spp.POP)as [Total PJP]
from section_pop_permanent spp
inner join PJP_detail pd on pd.distributor = spp.distributor and pd.PJP = spp.PJP and pd.section=spp.section
inner join JC_WEEK jw on jw.WEEK_NO = pd.WEEK_NO
where jw.START_DATE <= @today and jw.END_DATE >= @today --and  day_of_week = DATENAME(dw,GETDATE())
group by spp.distributor,spp.PJP,spp.section,pd.week_no
),
tl as (
select cs.Distributor,PJP,SECTION,COUNT(distinct(cs.distributor+PJP+Town+Locality+slocality+POP))as productive,
COUNT(distinct(cs.distributor+PJP+Town+Locality+slocality+POP+cs.doc_no))as invoices
,COUNT(distinct(csd.[stuff]+csd.master_sku))as lines
from Cashmemo cs
inner join (select DISTRIBUTOR+DOC_NO as [stuff],cmd.SKU,msk.master_sku from Cashmemo_detail cmd
inner join (select sku, master_sku from SKU) msk on msk.sku = cmd.sku) csd on csd.[stuff] =  cs.distributor+cs.doc_no

where cs.doc_date = @today and cs.DOCUMENT = 'cm' and cs.SUB_DOCUMENT = '01' and cs.VISIT_TYPE = '02'
GROUP by cs.distributor,cs.PJP,cs.section
)

SELECT  t1.DISTRIBUTOR,dt.name as [DT NAME], t1.PJP,ds.name as DSR, t1.SECTION, DATENAME(dw,@today) [Day],t1.[Total PJP],
psd.thecount as Eco_Achieved,psd.thecount*100/t1.[Total PJP] as [% Echo_Achievement],
cm.productive as Productive_outlets,cm.productive*100/psd.thecount as [% Bill_Productivity]
,cm.invoices as Total_invoices,cm.lines as Total_lines,cm.lines/cm.invoices as LPPC
FROM  tl cm

inner join tspp t1 on cm.DISTRIBUTOR+cm.PJP+cm.section = t1.DISTRIBUTOR+t1.PJP+t1.section

INNER join (select Distributor,PJP,COUNT(distinct(distributor+PJP+Town+Locality+slocality+POP))as thecount from POP_STATUS_DETAIL
where status_date = @today
GROUP by distributor,PJP) psd on psd.DISTRIBUTOR+psd.PJP = cm.DISTRIBUTOR+cm.PJP
inner join (select distributor,name from distributor) dt on dt.distributor = t1.distributor
inner join (select distributor, pjp, dsr from PJP_head) pjh on pjh.distributor+pjh.pjp = t1.distributor+t1.pjp
inner join (select distributor, dsr, name from dsr) ds on ds.distributor+ds.dsr = pjh.distributor+pjh.dsr
--WHERE  day_of_week = DATENAME(dw,@today)