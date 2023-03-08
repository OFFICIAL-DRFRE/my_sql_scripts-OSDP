use centegy_sndpro_uet
Declare @dateFrom date ='01-feb-2023'
Declare @dateto   date ='18-feb-2023'
;with sales as (
select distinct cm.distributor 'DT Code',d.NAME 'KD Name',CM.POP_NAME 'customer_Name',
SE.LDESC 'ChannelType',cm.town+cm.locality+cm.slocality+cm.POP 'POP_code', convert(varchar,cm.DOC_DATE,23) Doc_date, Cm.DOC_NO,year(cm.DOC_DATE) 'Year',
 Month(cm.DOC_DATE)'Month',pj.pjp as  'pjp', ds.NAME AS DSR,S.LDESC 'SKU Name' ,c.sku,c.amount 'GSV',
cast(((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)) as int) 'Number of pcs', isnull( sum(sd.discount+sd.gst),0) 'Discount Amt',
convert(money,sum( (c.amount+isNull(sd.discount,0))*1.15),2) 'Net Amount',
Sum(convert(money, (c.AMOUNT+IsNull(sd.DISCOUNT,0))*0.15,2)) 'GST'
from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO = c.DOC_NO
inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.town+cm.locality+cm.slocality+cm.pop
inner join SUB_ELEMENT se on p.SUB_ELEMENT=se.SUB_ELEMENT
inner join distributor d on d.distributor=c.distributor
inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR
left join scheme_discount_detail sd on sd.doc_no=c.doc_no and sd.sku=c.sku and sd.SUB_DOCUMENT=c.SUB_DOCUMENT 
where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  and cm.visit_type='02'
and cm.DOC_DATE between @dateFrom and @dateto
group by cm.distributor,d.NAME ,CM.POP_NAME ,
SE.LDESC,cm.town+cm.locality+cm.slocality+cm.POP,cm.DOC_DATE, Cm.DOC_NO,year(cm.DOC_DATE),
 Month(cm.DOC_DATE),pj.pjp, ds.NAME,S.LDESC,c.sku,c.amount,
((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))
)
select [DT CODE],[KD Name],'Sub Distributor' [Channeltype],MONTH(doc_date) 'Month',doc_date,customer_name, UPPER([sku name]) SKU_desc, 
floor( [Number of pcs]/SELL_FACTOR1) Cs,
ISNULL(FLOOR(([Number of pcs]-(floor([Number of pcs]/SELL_FACTOR1)*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0))),0) DZ,
ISNULL( floor([Number of pcs] -((floor( [Number of pcs] /NullIF(SELL_FACTOR1,0))*SELL_FACTOR1)+
(FLOOR(([Number of pcs]-(floor([Number of pcs]/NullIF(SELL_FACTOR1,0))*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0)))*SELL_FACTOR2))) ,0) PC,
convert(int,[NUMBER of PCS],2) TOTAL_PCs,GSV,GST,[Net Amount]
from sales
inner join sku s on s.sku=sales.SKU
inner join SUB_ELEMENT se on se.LDESC=ChannelType
where [ChannelType] ='sub D' 
order by [DT CODE],[KD Name], [channeltype], [SKU Name] asc