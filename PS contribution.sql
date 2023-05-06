use Centegy_SnDPro_UET
Declare @datefr date ='20230101'
Declare @dateto date ='20230331'

select m, town, 
	total_pop,
	total_ps,
	month, [no of ps], [no of rt ps], 
	round( cast( [no of ps] as float)/[totaL_ps] * 100 , 2)'% of invoice' 

from (
		select distinct 
			s.m, s.Town,
			max([total outlet]) total_pop, 
			max( [Total PS]) totaL_ps,
			S.Month, max([# of PS]) 'no of ps', max([# of RT PS]) 'no of rt ps'
		 from (
			select distinct 
				p.distributor,d.LDESC Town,
				p.active,
				(SELECT TOP 1 COUNT(POP) FROM POP WHERE ACTIVE=1) 'Total outlet',
				dense_rank() over(partition by p.perfect_store_level order by p.pop) 'Total PS',
				case 
					when p.PERFECT_STORE_LEVEL<>'001' then 'PS' 
					else '' end as 'Perfect store',
				pt.ldesc POPTYPE,
				month(cm.doc_date) 'M',
				datename( year, cm.doc_date) 'year',
				datename( month, cm.doc_date) 'Month',
				dense_rank() over(partition by month(cm.doc_date), p.perfect_store_level order by cm.pop) '# of PS',
				DENSE_RANK() over(partition by month(cm.doc_date), p.perfect_store_level,p.poptype order by cm.pop) '# of RT PS',
				DENSE_RANK() over(partition by month(cm.doc_date) order by cm.doc_no) total_invoice
			 from pop p 
				left outer join CASHMEMO cm on cm.TOWn+cm.LOCALITY+cm.SLOCALITY+cm.POP=p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP and VISIT_TYPE='02'
				left join pop_type pt on pt.POPTYPE=p.POPTYPE
				left join town d on d.TOWN =p.TOWN
			where cm.DOC_DATE between @datefr and @dateto 
		)s
		where [Perfect store] = 'ps' AND S.POPTYPE='RETAILER' and s.ACTIVE=1
		GROUP BY s.m, S.town, s.Month, s.ACTIVE
	)t
order by m