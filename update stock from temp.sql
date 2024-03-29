create table STOCK_TEMP(
	sku varchar(20) primary key not null,
	total_in_pcs numeric not null
)

Declare @date date = cast( (select working_date from distributor) as date)

Declare @wh varchar(2) = '01'
Declare @stocktype varchar(2) = '01'
Declare @batch varchar(15) = '1-1'


Declare @weekno numeric=(
	select week_no from JC_WEEK 
	where START_DATE <= @DATE
		and END_DATE >= @DATE )

update STOCK_BATCH 
set  
	OPEN_3= OPEN_3 + st.total_in_pcs
from stock_batch SB
	inner join dbo.stock_temp st on st.sku=sb.sku and sb.warehouse=@wh and sb.week_no=@weekno and sb.batch=@batch and SB.year= year(@DATE) and sb.sku_type=@stocktype

select * from STOCK_BATCH sb
inner join dbo.stock_temp st on st.sku=sb.sku and sb.warehouse=@wh and sb.week_no=@weekno and sb.batch=@batch and SB.year= year(@DATE) and sb.sku_type=@stocktype
go
DROP TABLE DBO.STOCK_TEMP
