use centegy_sndpro_uet
Declare @date date= ( SELECT WORKING_DATE FROM DISTRIBUTOR)

;with stock as (
select stk.distributor, stk.sku, warehouse, sku_type,
		CZ = Isnull(floor(stk.pcs/NullIF(stk.SELL_FACTOR1,0)),0), 
		DZ = FLOOR((stk.pcs-(floor(stk.pcs/stk.SELL_FACTOR1)*stk.SELL_FACTOR1))/12),
		PC = (floor(stk.pcs - ( 
							  (floor(stk.pcs/NullIF(stk.SELL_FACTOR1,0))*stk.SELL_FACTOR1) + 
							  (FLOOR((stk.pcs-(floor(stk.pcs/NullIF(stk.SELL_FACTOR1,0))*stk.SELL_FACTOR1))/
									case when stk.sell_factor2 = 0 then 12 else stk.sell_factor2 end)) * 
									case when stk.sell_factor2 = 0 then 12 else stk.sell_factor2 end) 
			))
	from(select distinct sb.distributor, b.SKU  'sku', sb.WAREHOUSE, sb.SKU_TYPE,
			( (isnull(open_1,0)+isnull(in_1,0)-isnull(sale_1,0)-isnull(out_1,0))*cs.SELL_FACTOR1 +
			  (isnull(OPEN_2,0)+isnull(IN_2,0)-isnull(SALE_2,0)-isnull(OUT_2,0))* Cs.sell_factor2 +
			  (isnull(open_3,0)+isnull(IN_3,0)-isnull(sale_3,0)-isnull(OUT_3,0))* cs.SELL_FACTOR3)  'pcs',
			cs.SELL_FACTOR1,cs.sell_factor2, cs.SELL_FACTOR3
			from stock_batch sb with(index(AK_Index_Sales_Stock)
		),BATCH b 
		 inner join SKU cs on b.sku=cs.SKU
		 where sb.sku = b.sku and sb.batch = '1-1' and year=YEAR(@date) and JCNO=(select JCNO from JC_WEEK where START_DATE<=@date 
		 and END_DATE>=@date and YEAR=YEAR(@date)) 
		 and WEEK_NO=(select WEEK_NO from JC_WEEK where START_DATE<=@date and END_DATE>=@date and YEAR=YEAR(@date))
		 and warehouse in (select warehouse from WAREHOUSE where patindex('Damage%', ldesc)=0 and patindex('expir%', ldesc)=0) -- EXCLUDE DAMAGED AND EXPIRED WAREHOUSE
	) stk where stk.pcs > 0
)
select 
		d.DISTRIBUTOR,
		@DATE doc_date,
		ty.ldesc 'SKU type',
		st.sku,s.ldesc 'SKU desc',
		sum(cz) CS,sum(DZ) DZ,sum(PC) PC, 
		sum(convert(int,(CZ * sell_factor1)+(DZ * sell_factor2)+PC)) 'Total in PC',
		convert(float, round( sum(convert(int,(CZ * sell_factor1)+(DZ * sell_factor2)+PC))/s.SELL_FACTOR1, 2), 2) 'Total Cases',
		convert(float, round(sum(convert(int,(CZ * sell_factor1)+(DZ * sell_factor2)+PC)) * ps.PRICE_UNIT3, 2), 2) 'Gross Stock Value' 
		
from stock st
		inner join SKU s on s.SKU=st.sku
		inner join Distributor D on D.DISTRIBUTOR = st.DISTRIBUTOR
		inner join WAREHOUSE w on w.WAREHOUSE = st.warehouse
		inner join sku_type ty on ty.sku_type = st.sku_type
		inner join price_structure ps on ps.sku =st.sku and ps.price_struc = '0001'
group by d.DISTRIBUTOR,d.NAME, st.sku,s.ldesc,ty.ldesc, s.SELL_FACTOR1,ps.PRICE_UNIT3
order by s.LDESC asc