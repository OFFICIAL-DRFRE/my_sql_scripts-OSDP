use XFULET
declare  @startdate date ='20200828'
declare   @enddate date ='20200830' 

select Distinct SyncKey,DocumentPrefix from RtCstTrnHeader 
where TransactionDateTime between @startdate and @enddate and DocumentPrefix like '%INV' and 
SyncKey not in ( select SyncKey from Centegy_SNDPRO_UET.dbo.IG_O_UploadSyncKeys
)

 