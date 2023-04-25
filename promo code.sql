use Centegy_SNDPRO_UET
;with promo as (select  mp_code+'~'+fc.seq_id [Promo code],pbs_desc,s.sku, s.LDESC sku_desc,ps.PRICE_STRUC,convert(float, ps.PRICE_UNIT3,2) [Price w/vat],
mvd.Value [Pop_type],fc.discount_val,pbs_period_fr, pbs_period_to,pbs_expire ,CONVERT (float, round((PRICE_UNIT3*s.SELL_FACTOR1*(100-discount_val)/100*1.15),2) , 2)[Case Price] from pb_setup p
inner join FIELD_COMB fc on fc.seq_id=p.pbs_seqid and fc.mp_code=pbs_mp_code
inner join memory_variable_Detail m on m.seq_id=p.pbs_seqid and m.main_process= p.pbs_mp_code
inner join memory_variable_Detail mvd on mvd.seq_id=p.pbs_seqid and mvd.main_process= p.pbs_mp_code and mvd.ColumnName='PopType'
right join Sku s on m.Value like '%'+s.sku+'%' and m.ColumnName='sku'
inner join PRICE_STRUCTURE ps on ps.sku=s.SKU and ps.PRICE_STRUC = ( select PRICE_STRUC from BATCH where SKU= s.SKU and BatchIndex=1)
--where p.pbs_period_to > GETDATE() and pbs_expire=0 
)
select distinct [Promo code],pbs_desc 'promo title',sku,sku_desc,PRICE_STRUC, [price w/vat],Case when Pop_type='01' then 'Retail'  when Pop_type='02' then 'Wholesale' when Pop_type='04' then 'Sub_D' else Pop_type end 'promo on',
convert(varchar,discount_val)+' %' Discount,pbs_period_fr,pbs_period_to, pbs_expire,[Case Price], convert(float,round([Price w/vat]*1.15,2),2) 'RT Price (pC)' from promo p
--inner join memory_variable_Detail m on ((m.value like (select '%'+distributor+'%' from distributor) and m.ColumnName ='Distributor') or m.ColumnName!='Distributor')
--and [Promo code]= m.MAIN_PROCESS+'~' + m.seq_id
where Pop_type !='04' and
--and sku_desc like '%175%'
--p.[Promo code] ='001~368'
p.pbs_period_fr between '20190910' and '20200101' and  p.pbs_period_to between'20190923' and '20200130'
order by [Promo code] asc