declare @sync varchar(50)= 'b4c44311-00cb-4139-a524-41e89ebf4a1f'
select * from IG_O_UploadSyncKeys where SyncKey=@sync
select * from IG_O_SalesOrderHeader where SyncKey=@sync

select DOC_NO,hht_srno,DOC_DATE,DELV_DATE,VISIT_TYPE,NET_AMOUNT from CASHMEMO where HHT_SRNO between ('_'+
convert(varchar,(select Min(docUmentnumber) from IG_O_SalesOrderHeader where SyncKey=@sync)) +'_') 
and (convert(varchar,(select Max(docUmentnumber) from IG_O_SalesOrderHeader where SyncKey=@sync)) +'_')
and DOC_DATE= (select top 1 cast(PostingDateTime as date) from IG_O_SalesOrderHeader where synckey=@sync)
and PJP= (select top 1 RouteCode from IG_O_SalesOrderHeader where synckey=@sync) --and PJP='AA01'


--update CASHMEMO set doc_date='20211112', DELV_DATE='20211112', Schedule_Delv_Date='20211112' where DOC_NO in (
--'21C001002280',
--'21C001002290',
--'21C001002300',
--'21C001002310',
--'21C001002320',
--'21C001002330',
--'21C001002340',
--'21C001002350',
--'21C001002360',
--'21C001002370',
--'21C001002380',
--'21C001002390')

--update CASHMEMO_DETAIL set doc_date='20211112' where DOC_NO in (
--'21C001002280',
--'21C001002290',
--'21C001002300',
--'21C001002310',
--'21C001002320',
--'21C001002330',
--'21C001002340',
--'21C001002350',
--'21C001002360',
--'21C001002370',
--'21C001002380',
--'21C001002390')

