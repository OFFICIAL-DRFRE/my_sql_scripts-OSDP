select 
	--so.BATCH_ID,
	--so.MOC_NO,
	--so.MOC_YEAR,
	so.UP_CODE,
	--so.RS_CODE,
	so.SKU_CODE, s.LDESC SKU_desc,
	--so.DB_DIVISION,
	so.NORMS_QTY,
	so.ACHIVE_QTY,
	convert(varchar, so.UPDATE_STAMP,23)  update_stamp,
	--so.STATUS_FLAG,
	--so.AREA,  --Area geo level 2
	so.Color, --0 black , 1 red, 
	so.PACKTYPE+' - '+  --IQ type
	+so.LOCAL_PACKTYPE + ' - '+ --IQ Sub Type
	so.CLASSIFICATION IQ
 from SUGGESTED_ORDER so
inner join sku s on s.MASTER_SKU=so.SKU_CODE
--inner join SKU_CATEGORY sc on sc.SKU=s.SKU and sc.SKU_INDEX > 0 and sc.SKU_INDEX is not null
where UP_CODE='T0001-15550650-004-005-00002060' and moc_no='04' and MOC_YEAR=2023
--and s.ldesc like 'sunl%80g'
and PACKTYPE=5
and LOCAL_PACKTYPE=0
and color=1
--and CLASSIFICATION='c'

--select 'so.'+column_name+',' from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'suggested_order'