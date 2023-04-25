delete from SCHEME_SKU_VARIANT where DOC_NO not in (select DOC_NO from CASHMEMO) 
update pop_device set company=company 