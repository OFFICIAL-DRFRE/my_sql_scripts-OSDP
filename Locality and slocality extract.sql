use centegy_sndpro_uet
GO

select t.town Town_Code,t.LDESC Town_Desc,l.LOCALITY Locality_Code,
	l.LDESC Locality_Desc,sb.SLOCALITY SLocality_Code, sb.LDESC Slocality_Description, LSM, 
	sb.town+sb.locality+sb.SLOCALITY 'UID'
	from SUB_LOCALITY sb
left outer join TOWN t on t.TOWN=sb.TOWN
left outer join LOCALITY l on l.LOCALITY=sb.LOCALITY and l.TOWN=sb.TOWN
where sb.TOWN = (select TOWN from DISTRIBUTOR)