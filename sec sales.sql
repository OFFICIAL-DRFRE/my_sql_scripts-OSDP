use Centegy_SNDPRO_UET
Declare @docdatefrom date ='15-june-2020'
Declare @docdateto date ='18-june-2020'
Declare @pjp varchar(4)='B001'
;with wsprice as (
select  mp_code+'~'+fc.seq_id 'Promo code',pbs_desc,s.sku, s.LDESC sku_desc,ps.PRICE_STRUC,convert(float, ps.PRICE_UNIT3,2) 'Price w/vat' ,fc.discount_val,pbs_period_fr, pbs_period_to,pbs_expire 
,CONVERT (float, round((PRICE_UNIT3*s.SELL_FACTOR1*(100-discount_val)/100*1.15),2) , 2)'Case Price' from pb_setup p
inner join FIELD_COMB fc on fc.seq_id=p.pbs_seqid and fc.mp_code=pbs_mp_code
inner join memory_variable_Detail m on m.seq_id=p.pbs_seqid and m.main_process= p.pbs_mp_code
right join Sku s on Value like '%'+s.sku+'%' and ColumnName='sku'
inner join PRICE_STRUCTURE ps on ps.sku=s.SKU and ps.PRICE_STRUC = ( select PRICE_STRUC from BATCH where SKU= s.SKU and BatchIndex=1)
where --p.pbs_mp_code+'~'+p.pbs_seqid > ('001~320')
p.pbs_period_to > GETDATE() and pbs_expire=0 --and s.SKU in (select sku from sku where ldesc like 'OMO 170g%')
and  m.seq_id in (select seq_id from memory_variable_Detail where Value='02')) 

select distinct ph.LDESC 'PJP',pt.LDESC 'Outlet Type', s.LDESC 'SKU', convert(int,sum(QTY1)) 'CS',	Convert(int,sum(QTY2)) 'DZ', convert(int,sum(QTY3)) 'PC', 
SUM( Convert(int, ((QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))) [Total qty in Pcs],
r.[Price w/vat],case when w.discount_val is Null then 0 else w.discount_val end 'discount %',sum( convert(money, round(r.[Price w/vat]*(1-case when w.discount_val is null then 0
else w.discount_val end /100)*((QTY1*s.sell_factor1)+
(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))*1.15,2) ,1)) 'total Value' from CASHMEMO_DETAIL cd
inner join cashmemo c on c.doc_no=cd.doc_no --and c.CASHMEMO_TYPE !='19'
inner join POP p on p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP=c.TOWN+c.LOCALITY+c.SLOCALITY+c.pop
inner join POP_TYPE pt on pt.poptype=p.POPTYPE
inner join SKU s on s.SKU=cd.SKU 
inner join BATCH b on  b.SKU=s.SKU and b.BATCH='1-1'
inner join PJP_HEAD ph on ph.PJP=c.PJP
inner join wsprice r on r.SKU=cd.SKU
left join wsprice w on w.SKU=cd.SKU and p.POPTYPE='02'
where cd.DOC_DATE between @docdatefrom and @docdateto and c.pjp=@pjp
group by ph.LDESC,pt.LDESC, s.LDESC, r.[Price w/vat],w.discount_val




