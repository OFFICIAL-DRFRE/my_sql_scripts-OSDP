USE master;
GO
SELECT 
    spid, 
    status, 
    loginame=Substring(loginame,1,25), 
    hostname=Substring(hostname,1,25), 
    blk = CONVERT(nvarchar(5),blocked), 
    dbname = Substring('centegy_sndpro_uet',1,30), 
    cmd = Substring(cmd,1,50), 
    cpu = CONVERT(nvarchar(10),cpu), 
    physical_io = CONVERT(nvarchar(10),physical_io), 
    memusage = CONVERT(nvarchar(10),memusage), 
    last_batch=Convert(char(10),last_batch,126)+' '+Convert(char(8),last_batch,108), 
    program_name=Substring(program_name,1,50), 
    login_time=Convert(char(10),login_time,126)+' '+Convert(char(8),login_time,108) 
FROM master.dbo.sysprocesses 
WHERE DBID = DB_ID('centegy_sndpro_uet')
