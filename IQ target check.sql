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

select ph.pjp pjpcode, ph.ldesc pjp, PACKTYPE, COUNT(up_code) pop from SUGGESTED_ORDER  so
inner join sku s on s.MASTER_SKU = so.SKU_CODE
inner join section_pop sp on sp.TOWN+sp.distributor+sp.LOCALITY+sp.slocality+sp.pop = replace(so.UP_CODE, '-', '')
inner join pjp_head ph on ph.pjp = sp.pjp
where moc_no= 12
group by ph.pjp, ph.LDESC, PACKTYPE
