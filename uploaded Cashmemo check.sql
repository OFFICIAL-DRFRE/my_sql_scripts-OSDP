declare @sync varchar(50)= 'ce7c0255-68ac-45f9-bbfa-179efc21fcd1'
select getutcdate(),* from IG_O_UploadSyncKeys where SyncKey=@sync
select process_status,process_description, * from IG_O_SalesOrderHeader where SyncKey=@sync

select DOC_NO,hht_srno,DOC_DATE,DELV_DATE,VISIT_TYPE,NET_AMOUNT from CASHMEMO where HHT_SRNO between ('_'+
convert(varchar,(select Min(docUmentnumber) from IG_O_SalesOrderHeader where SyncKey=@sync)) +'_') 
and (convert(varchar,(select Max(docUmentnumber) from IG_O_SalesOrderHeader where SyncKey=@sync)) +'_')
and DOC_DATE= (select top 1 cast(PostingDateTime as date) from IG_O_SalesOrderHeader where synckey=@sync)
and PJP= (select top 1 RouteCode from IG_O_SalesOrderHeader where synckey=@sync) --and PJP='AA01'
