use Centegy_SNDPRO_UET
;with promo as (select  mp_code+'~'+fc.seq_id [Promo code],pbs_desc,s.sku, s.LDESC sku_desc,ps.PRICE_STRUC,convert(int,s.SELL_FACTOR1) [PC/Cs],convert(float, ps.PRICE_UNIT3,2) [Price w/vat],
mvd.Value [Pop_type],fc.discount_val,pbs_period_fr, pbs_period_to,pbs_expire ,CONVERT (float, round((PRICE_UNIT3*s.SELL_FACTOR1*(100-discount_val)/100*1.15),2) , 2)[Case Price] from pb_setup p
inner join FIELD_COMB fc on fc.seq_id=p.pbs_seqid and fc.mp_code=pbs_mp_code
inner join memory_variable_Detail m on m.seq_id=p.pbs_seqid and m.main_process= p.pbs_mp_code
inner join memory_variable_Detail mvd on mvd.seq_id=p.pbs_seqid and mvd.main_process= p.pbs_mp_code and mvd.ColumnName='PopType'
right join Sku s on m.Value like '%'+s.sku+'%' and m.ColumnName='sku'
inner join PRICE_STRUCTURE ps on ps.sku=s.SKU and ps.PRICE_STRUC = ( select PRICE_STRUC from BATCH where SKU= s.SKU and BatchIndex=1)
where p.pbs_period_to > GETDATE() and pbs_expire=0
)
select distinct case when pbs_expire=0 then 'Yes' else 'No' end as ACTIVE , [Promo code],pbs_desc 'promo Desc',sku,sku_desc,PRICE_STRUC as P_struc, [PC/Cs], [price w/vat],Case when Pop_type='01' then 'Retail'  when Pop_type='02' then 'Wholesale' when Pop_type='04' then 'Sub_D' else Pop_type end as [promo on],
convert(varchar,discount_val)+' %' Discount,REPLACE(convert(varchar,convert(Money,[case price]),1),'0.0',' ') 'WS Price', convert(float,round([Price w/vat]*1.15,2),2) 'RT Price', convert(varchar, pbs_period_fr, 23) Date_from,convert(varchar, pbs_period_to,23) Date_to from promo p
inner join memory_variable_Detail m on ((m.value like (select '%'+distributor+'%' from distributor) and m.ColumnName ='Distributor') or m.ColumnName!='Distributor')
and [Promo code]= m.MAIN_PROCESS+'~' + m.seq_id
where --Pop_type='04'  
sku_desc like 'Knorr%Fort%'
--m.SEQ_ID in (596, 625, 630)
group by pbs_expire,[Promo code],pbs_desc,sku,sku_desc,PRICE_STRUC,[PC/Cs], [Price w/vat],Pop_type,discount_val,[Case Price],pbs_period_fr,pbs_period_to
having count(sku)>1 and count(pop_type)>1 
order by [promo on] desc,sku, [Promo code]


--use XFulet
--select distinct PromotionCode, pa.PromotionAmount,ActiveIndicator,cpm.EndDate from RtPromotionControl pc
--inner join RtCustomerPromotionMapping cpm on cpm.PromotionPlanNumber=pc.PromotionPlanNumber
--inner join RtPromotionAssignment pa on pa.PromotionPlanNumber=pc.PromotionPlanNumber
--where pc.PromotionCode in ('001~452', '001~409', '001~451')
----cpm.ActiveIndicator=1

--Update RtCustomerPromotionMapping set ActiveIndicator=0 where PromotionPlanNumber in ( select PromotionPlanNumber from RtPromotionControl
--where PromotionCode in ( '001~451'))

