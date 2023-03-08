select * from PHYSICAL_STOCK_HEAD where DOC_DATE > '20230201'

Declare @weekno numeric=(select week_no from JC_WEEK where START_DATE <= '20230228' and END_DATE >= '20230228')

;with ginreturn(sku, cs, dz, pc) as (
select SKU, REF_QTY1, REF_QTY2, REF_QTY3  from GIN_DETAIL where DOC_NO='2023B0020044'
)
update STOCK_BATCH 
set 
	OPEN_1= OPEN_1 - cs,
	OPEN_2= OPEN_2 - dz, 
	OPEN_3= OPEN_3 - pc
	from stock_batch sb
inner join ginreturn g on g.sku=sb.SKU
where year= year(getdate()) and WEEK_NO=@weekno and WAREHOUSE='01' and batch='1-1' and sb.sku=g.SKU

select * from STOCK_BATCH where year=YEAR(getdate()) and WEEK_NO=@weekno and WAREHOUSE='01' and batch='1-1' and sku=@s