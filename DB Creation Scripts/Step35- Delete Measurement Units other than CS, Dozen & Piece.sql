delete from MEASUREMENT_UNIT where SDESC in ('CRTN','EA','UNIT')
go
update MEASUREMENT_UNIT set SDESC='DZ' where SDESC='DOZN'
Go
delete from MEASUREMENT_UNIT where PREFER_UNIT='1'
go
insert into MEASUREMENT_UNIT
select distinct '1' as prefer_unit,
SELL_UNIT1 as unit,
COMPANY from sku
go
delete from MEASUREMENT_UNIT where PREFER_UNIT='2'
go
insert into MEASUREMENT_UNIT
select distinct '2' as prefer_unit,
SELL_UNIT2 as unit,
COMPANY from sku
go
delete from MEASUREMENT_UNIT where PREFER_UNIT='3'
go
insert into MEASUREMENT_UNIT
select distinct '3' as prefer_unit,
SELL_UNIT3 as unit,
COMPANY from sku