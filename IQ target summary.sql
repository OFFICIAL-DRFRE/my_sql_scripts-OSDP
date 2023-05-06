use centegy_sndpro_uet

Declare @datefr date='20230401'
Declare @dateTo date='20230430'

select ph.pjp pjpcode, ph.ldesc pjp, PACKTYPE, so.LOCAL_PACKTYPE,CLASSIFICATION, COUNT(up_code) pop from SUGGESTED_ORDER  so
inner join sku s on s.MASTER_SKU = so.SKU_CODE
left join section_pop sp on sp.TOWN+sp.distributor+sp.LOCALITY+sp.slocality+sp.pop = replace(so.UP_CODE, '-', '')
left join pjp_head ph on ph.pjp = sp.pjp
where moc_no between right('0'+ cast(month(@datefr) as varchar),2) 
		and right('0'+ cast(month(@dateTo) as varchar),2) and MOC_YEAR between year(@datefr) and year(@dateTo)
		and ph.pjp = 'Q001'
group by ph.pjp, ph.LDESC, PACKTYPE, LOCAL_PACKTYPE, CLASSIFICATION