alter table cashmemo_detail nocheck constraint FK_CASHMEMO_DETAIL__CASHMEMO

declare @datefr date = '20221101'
declare @dateto date = '20221117'

insert into cashmemo_detail (
COMPANY,DISTRIBUTOR,DOCUMENT,DOC_NO,ENTRY_TYPE,SKU,SKU_TYPE,BATCH,WAREHOUSE,DOC_DATE,REF_QTY1,REF_QTY2,
REF_QTY3,AMOUNT,GST,gst_percentage,sku_index,scheme_skushare,SUB_DOCUMENT, WH_DISTRIBUTOR)
select 23, sd.tenantcode,'CM', cm.doc_no, '01', sd.itemcode, '01','1-1', '01',cm.doc_date, 
cz= Isnull(floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0)),0),
 dz=ISNULL(FLOOR((sd.itemquantity-(floor(sd.itemquantity/s.SELL_FACTOR1)*s.SELL_FACTOR1))/(Nullif(s.SELL_FACTOR2,0))),0),
 pc = ISNULL( floor(sd.itemquantity-((floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0))*s.SELL_FACTOR1)+
 (FLOOR((sd.itemquantity-(floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0))*s.SELL_FACTOR1))/(Nullif(s.SELL_FACTOR2,0)))*s.SELL_FACTOR2))), 0),
sd.itemprice*ItemQuantity, ItemExciseTax*itemquantity, 15, sc.sku_index, itemExciseTax * itemquantity, '01', '15385502'
from ig_o_SalesOrderdetail sd
left join IG_O_SalesOrderHeader sh on sh.DocumentNumber=sd.DocumentNumber and sh.DocumentPrefix=sd.DocumentPrefix
left join cashmemo cm on replace(cm.HHT_SRNO,'_','') = sd.DocumentNumber and sh.routecode=cm.PJP
left join CASHMEMO_detail cd on cm.DOC_NO=cd.DOC_NO and cd.SKU=sd.itemcode
left join sku s on s.sku=sd.itemcode
left join sku_category sc on sc.sku = sd.itemcode
where sd.itemcode=69692828 and cm.DOC_DATE between @datefr and @dateto

update CASHMEMO_DETAIL set QTY1=REF_QTY1,QTY2=REF_QTY2, QTY3 = REF_QTY3, ORD_QTY1 = REF_QTY1, ORD_QTY2 = REF_QTY2, ORD_QTY3 = REF_QTY3
where ORD_QTY1 is null and doc_date between @datefr and @dateto

alter table cashmemo_detail nocheck constraint FK_CASHMEMO_DETAIL__CASHMEMO
