use centegy_sndpro_uet

select 
	isNull(Lead(y.[dt name]) over(order by y.[tagged pop] desc), '') 'KD Name',  
	isNull( cast( Lead(y.[Total POP]) over(order by y.[DT Name] asc) as varchar), '') 'Total Outlet', 
	y.classification,
	y.[tagged POP],
	cast(convert(float, round((y.[Tagged POP]+ 0.0) / (y.[Total POP]+0.0 ) * 100, 2), 2) as varchar)+ ' %' as 'Ach  / Balance %' 
	from (
		select distinct 
			d.name 'DT Name',
			count(p2.pop) over() 'Total POP',
			x.geotag classification,
			count(x.pop_code) over(partition by x.geotag) 'Tagged POP'   
		from (
			select distributor, town+locality+slocality+POP pop_code,
			case when latitude > 0 then 'Geo tagged'
				else 'un tagged' end as geotag
			from POP
			where active=1
		) x
		right join pop p2 on p2.town+p2.locality+p2.slocality+p2.pop = x.pop_code
		 join distributor d on d.DISTRIBUTOR=x.DISTRIBUTOR
		where p2.ACTIVE =1
	)y
order by [Tagged POP] desc