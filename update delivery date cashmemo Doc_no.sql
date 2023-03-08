use centegy_sndpro_uet

declare @datefrom date ='28-feb-2023'
declare @changeto date ='28-feb-2023'
declare @route varchar(4)='A001'
declare @docno varchar(12)='23A001023770'

Update CASHMEMO_DETAIL set DOC_DATE=@changeto where DOC_NO in 
( select doc_no from CASHMEMO where DOC_DATE=@datefrom and PJP=@route and doc_no = @docno) 

update CASHMEMO set DOC_DATE=@changeto, DELV_DATE=@changeto, Schedule_Delv_Date=@changeto 
where DOC_DATE = @datefrom and PJP = @route and doc_no = @docno