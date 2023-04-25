
use Centegy_SNDPRO_UET
go
select t.town Town_Code,t.LDESC Town_Desc,l.LOCALITY Locality_Code,l.LDESC Locality_Desc,sb.SLOCALITY SLocality_Code, sb.LDESC Slocality_Description, LSM from SUB_LOCALITY sb
inner join TOWN t on t.TOWN=sb.TOWN
inner join LOCALITY l on l.LOCALITY=sb.LOCALITY and l.TOWN=sb.TOWN
where sb.TOWN = (select TOWN from DISTRIBUTOR)