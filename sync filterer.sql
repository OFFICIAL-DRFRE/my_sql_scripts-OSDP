use XFULET
declare  @startdate date ='20210401'
declare   @enddate date ='20210428' 

select Distinct SyncKey,DocumentPrefix from RtCstTrnHeader 
where TransactionDateTime between @startdate and @enddate and DocumentPrefix like '%INV' and 
SyncKey not in ( select SyncKey from Centegy_SNDPRO_UET.dbo.IG_O_UploadSyncKeys )

 
use Centegy_SnDPro_UET
 select * from IG_O_UploadSyncKeys where SyncKey='6bdcf592-5ba6-4a67-88f5-4ff56c33a00f' 