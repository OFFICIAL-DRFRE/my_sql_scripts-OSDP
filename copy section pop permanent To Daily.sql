use Centegy_SnDPro_UET

Delete from SECTION_POP
go

insert into SECTION_POP
	(COMPANY,TOWN,LOCALITY,SLOCALITY,POP,DISTRIBUTOR,SELL_CATEGORY,STATUS_DAY,SECTION,PJP, pop_index)
select COMPANY,TOWN,LOCALITY,slocality,pop,DISTRIBUTOR,SELL_CATEGORY,status_day,section,pjp, pop_index  
	from SECTION_POP_PERMANENT

print 'All done'
