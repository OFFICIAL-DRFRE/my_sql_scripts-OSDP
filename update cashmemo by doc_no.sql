use CENTEGY_SNDPRO_UET
declare @dateto date = '20230513'
declare @doc_no varchar(12) = 'A002020700'

if (select working_date from distributor) > cast( getdate() as date)
	begin
		update CASHMEMO set DELV_DATE=@dateto, DOC_DATE=@dateto, Schedule_Delv_Date=@dateto where doc_no=@doc_no
		update CASHMEMO_DETAIL set DOC_DATE = @dateto where doc_no=@doc_no
		
		print char(10)+ 'Infro: ' +char(10)+'Updated doc_no: '+@doc_no + ' to '+@dateto + ' Successfully'
	end
else
	begin
		print char(10)+ '-----------------------------------------Warning!------------------------------------'+char(10)
					  + 'Check your working date! you can't change the cashmemo before day ending the system'
			+ char(10)+ '-------------------------------------------------------------------------------------'
	end
