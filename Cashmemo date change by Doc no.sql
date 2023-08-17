use centegy_sndpro_uet
go

declare @datefrom date ='16-Aug-2023'
declare @changeto date ='29-Jul-2023'

Update CASHMEMO_DETAIL 
	set DOC_DATE=@changeto 
	
	where DOC_NO in 
		(
		'Your Cashmemo Doc NO'
		)
	and doc_date < (select WORKING_DATE from distributor)

update CASHMEMO 
	set 
		DOC_DATE=@changeto, 
		DELV_DATE=@changeto, 
		Schedule_Delv_Date=@changeto 
	where 
		doc_no in 
		( 
		'Your Cashmemo Doc NO'
		) 
	and doc_date < (select WORKING_DATE from distributor)