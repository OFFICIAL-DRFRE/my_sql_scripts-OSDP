
update BATCH set BatchIndex=1 where BATCH in (select Batch from BATCH where Batch ='1-1')
update BATCH set BatchIndex=0, Expiry='10-november-2022' where BATCH not in (select Batch from BATCH where Batch ='1-1')

update BATCH  set PRICE_STRUC = (select MAX(price_struc) from PRICE_STRUCTURE where sku =s.SKU) from dbo.batch as b
inner join sku s on s.SKU = b.SKU and b.batch in ('1-1')

 select distinct s.ldesc,  s.sku,BATCH,BatchIndex,PRICE_STRUC SKU from sku s
 inner join batch b on s.sku=b.SKU and BATCH in ('1-1','1-001','1-1-1')
 where s.sku not in (select sku from batch where BATCH='1-1')
