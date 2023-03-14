USE centegy_sndpro_uet;

SELECT DISTINCT	qq.QS_GROUP_ID 'Group ID', 
		qg.ldesc Group_desc,s.LDESC Status, 
		CONVERT(VARCHAR, DATE_ADDED, 23) [DATE ADDED],
		FORMAT( DATE_ADDED, 't', 'en-us') AS Start_time,
		--format( DATE_COMPLETED  , 'dd-MMM-yyyy  h\:mm tt') Date_completed,
		isNull(FORMAT( date_completed, 't', 'en-us'), ' - ') as End_time,
		qq.irow_ver,
		qg.VERSIONID as Version
FROM qs_queue qq
	INNER JOIN QS_GROUP qg on qg.QS_GROUP_ID = qq.QS_GROUP_ID
	INNER JOIN QS_QUEUE_STATE s on s.QS_QUEUE_STATE_ID = qq.QS_QUEUE_STATE_ID
WHERE 
	CAST(QQ.DATE_ADDED AS DATE) = CAST( GETDATE() AS DATE) 
--	AND S.LDESC = 'FAILED'
ORDER BY   qq.IROW_VER DESC
