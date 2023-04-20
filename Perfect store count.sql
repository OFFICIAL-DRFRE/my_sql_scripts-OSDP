use centegy_sndpro_uet

select *, 
	Format(Round( 1.0 * [Outlet count]/[total outlet]*100, 2), 'N', 'en-us') + ' %' 'Ach %' 
from (
	select distinct 
		p.distributor, d.NAME 'KD Name', ps.ldesc 'outlet type', 
		count(p.TOWN+p.locality+p.SLOCALITY+p.POP) over(partition by ps.ldesc) as 'Outlet count',
		count(p.town+p.locality+p.slocality+p.pop) over(partition by p.active) 'total outlet' 
	from pop p
	inner join Perfect_Store_Level ps on ps.LEVEL_CODE=p.PERFECT_STORE_LEVEL
	inner join distributor d on d.distributor=p.DISTRIBUTOR
	where p.active=1
)ps
