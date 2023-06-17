use centegy_sndpro_uet

declare @datefrom date ='04-feb-2023'
declare @changeto date ='06-feb-2023'

declare @ydate date =DATEADD(DAY, -2, CAST(GETDATE() AS DATE))

declare @route varchar(4)='A001'

----				When the Tarnsaction is Processed for ALL DSRs
select Distinct ph.pjp,Ph.ldesc PJP,convert(Varchar,DOC_DATE,106) Docdate,s.ldesc section,convert(Varchar,DELV_DATE,106) Delv_date,
'ETB	'+cast( REPLACE(CONVERT(varchar(20), (CAST(SUM(c.NET_AMOUNT) AS money)), 1), '.00', '') as varchar) amount, 
case when visit_type='01' then 'Un Processed'when visit_type='02'then 'GIN Done' when VISIT_TYPE='88' then'Cancelled' else 'Other' end  VISIT_TYPE from CASHMEMO c
inner join section s on s.SECTION= c.SECTION
inner join PJP_HEAD ph on ph.PJP=c.PJP 

where DOC_DATE in ( @datefrom , @Changeto) --and VISIT_TYPE='01'
--WHERE DOC_DATE >= @ydate
group by ph.pjp,Ph.ldesc, DOC_DATE,s.ldesc,DELV_DATE, Delv_date,Schedule_Delv_Date,VISIT_TYPE

Update CASHMEMO_DETAIL set DOC_DATE=@changeto where DOC_NO in 
( select doc_no from CASHMEMO where DOC_DATE=@datefrom and PJP=@route and VISIT_TYPE='01') 
update CASHMEMO set DOC_DATE=@changeto, DELV_DATE=@changeto, Schedule_Delv_Date=@changeto 
where DOC_DATE = @datefrom and PJP=@route and VISIT_TYPE='01' 
