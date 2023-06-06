--Disable foreign_keys
select * from sys.foreign_keys where is_disabled=1


-- disable the timestamp columns 
Declare @DBName varchar(400)
Set @DBName = 'centegy_sndpro_uet' 		--- Name the source DB the data come From

Declare @Object_id int
Declare @Column varchar(8000)
Declare @IsIdentity varchar(8000)
Declare @Counter int = 0


DECLARE getIns CURSOR FOR  
                SELECT  id Object_id, STUFF((SELECT  ',[' + name + ']'
                                                                FROM sys.syscolumns EE
                                                                WHERE EE.id =E.id  -- and EE.column_id=E.column_id
                                                                                and EE.Name not in('ROW_VER','IROW_VER')  and EE.IsComputed = 0
                                                                ORDER BY colid
                                                FOR XML PATH('')), 1, 1, '') AS listStr


                FROM sys.syscolumns E
                where E.id  in (select Object_id from sys.Tables)
                --and Object_Name(id)  <> 'IG_I_IQDataList'
                --and  Object_Name(id)  in (Select t2.name from TPL3.sys.tables t2)
                GROUP BY E.id 

OPEN getIns  
FETCH NEXT FROM getIns  INTO @Object_id, @Column 

WHILE @@FETCH_STATUS = 0  
  begin    
                if Exists(Select * from sys.columns where Object_ID = @object_ID and is_identity = 1)
                  set @IsIdentity = 1
                else
                  set  @IsIdentity = 0
                
                if @IsIdentity =1 
                  print 'SET IDENTITY_INSERT ' + Object_Name(@Object_id) + ' ON'

                  print 'insert into ' + Object_Name(@Object_id) + '(' + @Column +')'
                  print 'Select ' + @Column  +char(13)  + 'From ' +@DBName+'..' + Object_Name(@Object_id) +' with (nolock)'
                  --print 'Delete from ' +  Object_Name(@Object_id)

                if @IsIdentity =1 
                  print 'SET IDENTITY_INSERT ' + Object_Name(@Object_id) + ' OFF'

                set @Counter = @Counter+1
                print 'Print ' + Cast(@Counter as varchar)
                print 'Go'
                print char(13) +char(10)
                FETCH NEXT FROM getIns  INTO @Object_id, @Column 
  end

CLOSE getIns;  
DEALLOCATE getIns;  
