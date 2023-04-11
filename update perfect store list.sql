use centegy_sndpro_uet

update POP set PERFECT_STORE_DATE= cast(getdate() as date), PERFECT_STORE_LEVEL='003'
where town+LOCALITY+SLOCALITY+POP in (

)

go

Select distinct
	t.ldesc town,
	m.LDESC 'Outlet type',
	count(p.perfect_store_level) over (partition by m.ldesc) 'count',
	COUNT(pop) over(partition by p.town) 'total outlets' 
from POP p
inner join Perfect_Store_Level m on m.LEVEL_CODE = p.PERFECT_STORE_LEVEL
inner join town t on t.TOWN =p.TOWN
where p.ACTIVE = 1
