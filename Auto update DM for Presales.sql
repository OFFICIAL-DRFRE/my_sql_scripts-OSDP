Use Centegy_sndpro_uet
go

Declare @Presales varchar(4) = 'PR01'
Declare @odate date = '2025-07-01'

;with routelist as (
	Select distinct
		sp.PJP, 
		d.DSR, 
		sp.SECTION,
		sp.Distributor+TOWN+LOCALITY+slocality+POP POP_code
	from SECTION_POP sp
		inner join PJP_HEAD ph on ph.DISTRIBUTOR=sp.DISTRIBUTOR and ph.PJP=sp.PJP and ph.SELL_CATEGORY=sp.SELL_CATEGORY and ACTIVE=1
		inner join DSR d on d.DSR=ph.DSR and d.DISTRIBUTOR=ph.DISTRIBUTOR
	Where sp.PJP like 'B2B%'
)
/*-----------------------------------------------------------------
		Double check using this select statement first
-----------------------------------------------------------------*/
Select 
	R.PJP+' - '+ R.DSR+' - '+ R.SECTION 'Mapped B2B Route',
	r.pop_code, 
	C.PJP+' - '+ C.DSR+' - '+ C.SECTION 'Order Route',
	c.REF_PJP+' - '+ c.REF_DSR+' - '+ c.SECTION 'DM Route',
	DOC_NO, 
	convert(varchar, c.DOC_DATE, 23) cm_date,
	c.POP_NAME, 
	format( NET_AMOUNT, '#,###.##') 'Net_amount',
	Case 
		when VISIT_TYPE='01' then 'New'
		when VISIT_TYPE='02' then 'Delivered'
		when VISIT_TYPE='88' then 'X'
	Else 'NA' end as 'order Status'
from CASHMEMO c
	inner join routelist r on r.POP_code=c.DISTRIBUTOR+c.TOWN+c.LOCALITY+c.SLOCALITY+c.POP and c.PJP = @Presales

/*-----------------------------------------------------------------
			Use this update statement to update the query
-------------------------------------------------------------------*/

--Update CASHMEMO set 
--		REF_PJP = r.pjp, 
--		REF_DSR = r.DSR, 
--		SECTION = r.SECTION
--from CASHMEMO c
--inner join routelist r on r.POP_code=c.DISTRIBUTOR+c.TOWN+c.LOCALITY+c.SLOCALITY+c.POP
--						  and c.PJP = @Presales --and visit_type='01'