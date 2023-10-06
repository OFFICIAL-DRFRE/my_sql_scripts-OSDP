use centegy_sndpro_uet
go

-- RUN THIS SCRIPT TO CREATE A TEMPORARY TABLE
create table dbo.POP_TIN (
pop_code varchar(24) not null primary key,
tax_no Varchar(10) not null unique check (len(tax_no) = 10)
)
go


-- Only run this script after insert the TIN on the POP_TIN table
insert into POP_TAX
(company, town, locality, slocality, pop, tax_id, slab, distributor, tax_no, tax_name, tax_address)
select 23 as company, LEFT(pop_code, 5) as town,
substring(pop_code,6,3) as locality,
SUBSTRING(pop_code,9, 3) as slocality,
SUBSTRING(pop_code,12, 10) as POP,
'02' tax_id,
'01' Slab,
(select distributor from distributor) as distributor,
tax_no,
'' as tax_name,
'' as Tax_address
from POP_TIN
where pop_code not in ( select town+locality+slocality+pop from pop_tax)

