use centegy_sndpro_uet
select pd.DOC_NO,convert( varchar, pd.DOC_DATE, 23) 'Doc date', pd.SKU, s.ldesc sku, 
	cast(ref_qty1 as int) sys_CS, 
	cast(ref_qty2 as int) sys_DZ, 
	cast(REF_QTY3 as int) sys_PC,
	isnull(cast(qty1 as int), 0) phy_CS, 
	isnull(cast(qty2 as int), 0) phy_DZ, 
	isnull(cast(QTY3 as int), 0) phy_PC 
from PHYSICAL_STOCK_DETAIL pd
inner join SKU s on s.sku = pd.SKU
where DOC_no = '2023000001'  
-- and qty1 <0 or qty2 <0 or QTY3 <0