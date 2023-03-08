with t as (select c.DOC_NO,cd.sku,s.ldesc,convert(float, PRICE_UNIT3, 2) price, cast(qty1 as int) CS, cast(qty2 as int)  Dz, cast(qty3 as int)  PC, cast(((cd.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))as int) total_in_PCs,
AMOUNT cd_amt, cd.GST cd_gst, cd.AMOUNT+cd.GST CD_total,
convert(float, round(price_unit3*1.15*((QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)),2),2) expected_price,
c.RECEIVED_AMT, c.GST, c.TOT_DISCOUNT from CASHMEMO c
inner join CASHMEMO_DETAIL cd on cd.DOC_NO=c.doc_no
inner join sku s on s.sku= cd.SKU
inner join PRICE_STRUCTURE p on p.SKU = cd.SKU and PRICE_STRUC = '0001' 
where c.DOC_DATE='20230201' and pjp like '[a,y]001'
) 
select doc_no, sum(cd_amt) amount, sum(cd_gst) gst, sum(cd_amt+cd_gst) total from t group by DOC_NO




Declare @date date = '20230201'
Declare @d_no varchar=  '%[a,y]001%'
with cm as (
select doc_no, sum(amount) amount, sum(gst) gst, sum(AMOUNT+gst) total from CASHMEMO_DETAIL 
where DOC_DATE =@date and DOC_NO like @d_no
group by DOC_NO
)-- select * from cm
update CASHMEMO set NET_AMOUNT=cm.total,RECEIVED_AMT=cm.total, GST=cm.gst, TOT_DISCOUNT=0 from CASHMEMO as c
inner join cm on cm.DOC_NO=c.DOC_NO

