use centegy_sndpro_uet

Declare @sdate date = getdate()
Declare @weekno numeric=(
	select week_no from JC_WEEK 
	where START_DATE <= cast(@sdate as date) 
		and END_DATE >= cast(@sdate as date))

Declare @s varchar(20)=67474454
Declare @cs numeric = 0	
Declare @dz numeric = 0			
Declare @pc numeric = 0

update STOCK_BATCH 
set 
	OPEN_1= OPEN_1 + @cs,
	OPEN_2= OPEN_2 + @dz, 
	OPEN_3= OPEN_3 + @pc
where year= year(getdate()) and WEEK_NO=@weekno and WAREHOUSE='01' and batch='1-1' and sku=@s

select * from STOCK_BATCH where year=YEAR(getdate()) and WEEK_NO=@weekno and WAREHOUSE='01' and batch='1-1' and sku=@s

