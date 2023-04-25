select t.town Town_Code,t.LDESC Town_Desc,l.LOCALITY Locality_Code,l.LDESC Locality_Desc,sb.SLOCALITY SLocality_Code, sb.LDESC Slocality_Description, LSM from SUB_LOCALITY sb
left outer join TOWN t on t.TOWN=sb.TOWN
left outer join LOCALITY l on l.LOCALITY=sb.LOCALITY and l.TOWN=sb.TOWN
where sb.TOWN = (select TOWN from DISTRIBUTOR)