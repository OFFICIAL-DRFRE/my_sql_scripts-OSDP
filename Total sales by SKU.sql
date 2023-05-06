use Centegy_SNDPRO_UET
Declare @docdate date='25-apr-2023'
declare @dateto date ='25-apr-2023'
Declare @pjp varchar(4)='B001'

;with wsprice as (
select  distinct mp_code+'~'+fc.seq_id [Promo code],pbs_desc,s.sku, s.LDESC sku_desc,ps.PRICE_STRUC,convert(float, ps.PRICE_UNIT3,2) [Price w/vat],mvd.Value [POP type],
mvd.Value [Pop_type],fc.discount_val,pbs_period_fr, pbs_period_to,pbs_expire ,CONVERT (float, round((PRICE_UNIT3*s.SELL_FACTOR1*(100-discount_val)/100*1.15),2) , 2)[Case Price] from pb_setup p
inner join FIELD_COMB fc on fc.seq_id=p.pbs_seqid and fc.mp_code=pbs_mp_code
inner join memory_variable_Detail m on m.seq_id=p.pbs_seqid and m.main_process= p.pbs_mp_code
inner join memory_variable_Detail mvd on mvd.seq_id=p.pbs_seqid and mvd.main_process= p.pbs_mp_code and mvd.ColumnName='PopType'
right join Sku s on m.Value like '%'+s.sku+'%' and m.ColumnName='sku'
inner join PRICE_STRUCTURE ps on ps.sku=s.SKU and ps.PRICE_STRUC = ( select PRICE_STRUC from BATCH where SKU= s.SKU and BatchIndex=1)
where p.pbs_period_to > GETDATE() and pbs_expire=0 
), sales as ( 
select distinct 
case when c.VISIT_TYPE='01' then 'Order' when c.visit_type = '02' then 'sold' when c.visit_type='88' then 'Cancelled' else 'unknown' end as 'sales type',
ph.LDESC 'PJP',cd.SKU 'sku code', --pt.LDESC 'Outlet Type',
 s.LDESC 'SKU', convert(int,sum(QTY1)) 'CS', Convert(int,sum(QTY2)) 'DZ', convert(int,sum(QTY3)) 'PC', 
SUM( Convert(int, ((QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))) [Total qty in Pcs],
cd.amount+cd.GST 'GSV', isNull(sd.gst,0) +isNull(sd.discount,0) 'total discount',
cd.AMOUNT + cd.GST + (isNull(sd.gst,0) +isNull(sd.discount,0) ) 'Net Amount',
convert(money,ps.price_unit3) 'Price w/vat',
case when w.discount_val is Null then 0 else  w.discount_val end 'discount %',
sum( convert(money, round(ps.price_unit3 * (1-case when w.discount_val is null then 0
else w.discount_val end /100)*((QTY1*s.sell_factor1)+
(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))*1.15,2) ,1)) 'Expected Value' from CASHMEMO_DETAIL cd
inner join cashmemo c on c.doc_no=cd.doc_no --and c.VISIT_TYPE='02' 
left join SCHEME_DISCOUNT_DETAIL sd on sd.DOC_NO=c.DOC_NO and sd.SKU=cd.SKU
inner join POP p on p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP=c.TOWN+c.LOCALITY+c.SLOCALITY+c.pop
inner join POP_TYPE pt on pt.poptype=p.POPTYPE
inner join SKU s on s.SKU=cd.SKU
inner join BATCH b on b.BATCH='1-1' and b.SKU=s.SKU
inner join price_structure ps on ps.sku=b.SKU and ps.price_struc=b.price_struc
inner join PJP_HEAD ph on ph.PJP=c.PJP
left join  wsprice w on w.SKU=cd.SKU and p.POPTYPE=w.[POP type] 
where cd.DOC_DATE between @docdate and @dateto 
group by ph.LDESC,cd.sku, pt.LDESC, s.LDESC, ps.PRICE_UNIT3,w.discount_val, cd.amount, cd.GST, sd.DISCOUNT, sd.GST, c.VISIT_TYPE
)
select *, convert(float, round([Expected Value]-[Net Amount],2), 2) as Difference from sales
where [sales type] = 'order'
--and pjp like 'aschalew'