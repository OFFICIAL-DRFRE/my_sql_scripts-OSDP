/*
	This is a script under development it's not finished yet.
*/

use centegy_sndpro_uet
select s.LDESC, ph.pjp pjpcode, ph.ldesc pjp, PACKTYPE, COUNT(up_code) pop , SUM(norms_qty) from SUGGESTED_ORDER  so
inner join sku s on s.MASTER_SKU = so.SKU_CODE
inner join section_pop sp on sp.TOWN+sp.distributor+sp.LOCALITY+sp.slocality+sp.pop = replace(so.UP_CODE, '-', '')
inner join pjp_head ph on ph.pjp = sp.pjp
where moc_no= 12
group by s.LDESC, ph.pjp, ph.LDESC, PACKTYPE

Declare @datefr date='20230401'
Declare @dateTo date='20230430'

select ph.pjp pjpcode, ph.ldesc pjp, PACKTYPE, COUNT(up_code) pop from SUGGESTED_ORDER  so
inner join sku s on s.MASTER_SKU = so.SKU_CODE
inner join section_pop sp on sp.TOWN+sp.distributor+sp.LOCALITY+sp.slocality+sp.pop = replace(so.UP_CODE, '-', '')
inner join pjp_head ph on ph.pjp = sp.pjp
where moc_no= between right('0'+ cast(month(@datefr) as varchar),2) 
		and right('0'+ cast(month(@dateTo) as varchar),2) and MOC_YEAR between year(@datefr) and year(@dateTo)
group by ph.pjp, ph.LDESC, PACKTYPE

-- Check the Target and the Value of the result
use centegy_sndpro_uet
Declare @datefr date='20230401'
Declare @dateTo date='20230430'
 
select distinct iq.*, isNull(count(cm.DOC_NO) over (partition by iq.sku),0) 'total invoice' from 
(
	select distinct s.sku, s.LDESC, count(UP_CODE) over(partition by sku_code) as NPD_Target
	 from suggested_order so
	inner join sku s on s.MASTER_SKU=so.SKU_CODE
	where MOC_NO between right('0'+ cast(month(@datefr) as varchar),2) 
		and right('0'+ cast(month(@dateTo) as varchar),2) and MOC_YEAR between year(@datefr) and year(@dateTo)
		 and PACKTYPE=2
)iq
left join CASHMEMO_DETAIL c on c.sku=iq.SKU and c.DOC_DATE between @datefr and @dateto
left join CASHMEMO cm on cm.DOC_NO=c.DOC_NO



-- List of outlets to check
select distinct up_code, ''''+replace(replace(UP_CODE, RS_CODE,''),'-', '')+''',' POP_code, count(up_code) over (partition by up_code) total_targets from SUGGESTED_ORDER 
where MOC_NO='04' and MOC_YEAR=2023 and replace(replace(UP_CODE, RS_CODE,''),'-', '') in (select town+LOCALITY+slocality+pop from section_pop where pjp in ('A001', 'Q001'))
order by total_targets desc
