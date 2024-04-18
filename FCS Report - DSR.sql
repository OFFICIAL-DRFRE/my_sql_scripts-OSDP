use centegy_sndpro_uet
go
Declare @datefr date ='20240430',
		@dateto date = '2020430'

select DISTinct
	f.YEAR, f.JCNO, f.distributor, k.NAME 'KD Name', f.PJP, d.NAME,
	cast(FCS6ECR1 as int)	  'ECO POP Active',
	cast(FCS6ECR2 as int)	  'ECO Actual',
	cast(FCS6ECR4 as int)	  'ECO Tgt %',
		FCS6ECR3	  'ECO %',
	cast(FCS6BPR1 as int)	  'BP No OF Call',
	cast(FCS6BPR2 as int)	  'BP total Invoic',
	cast(FCS6BPR4 as int)	  'BP Tgt %',
		FCS6BPR3	  'BP %',
	IsNull( cast(FCS6LPR1 as int), 0)	  'LPPC Total SKU',
	cast(FCS6LPR3 as int)	  'LPPC Target ',
	IsNull( cast( round( FCS6LPR1/FCS6BPR2, 2) as float), 0)	'LPPC'
from MIS_KPI_DATA_206 f --FCS Table
	inner join Distributor k on k.DISTRIBUTOR = f.DISTRIBUTOR
	inner join PJP_HEAD ph on ph.pjp= f.PJP and ph.DISTRIBUTOR= f.DISTRIBUTOR and ph.SELL_CATEGORY=f.SELL_CATEGORY
	inner join DSR d on ph.DSR=d.DSR and ph.DISTRIBUTOR=d.DISTRIBUTOR
	inner join JC_WEEK jw on jw.YEAR=f.YEAR and jw.jcno=f.JCNO
where 
	jw.START_DATE >= @datefr and jw.END_DATE <= @dateto
order by 1, 2,3
