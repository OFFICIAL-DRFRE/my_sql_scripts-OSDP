use centegy_sndpro_uet
Declare @sku 
select cm.DOC_NO,cm.pop_name,qty1,qty2,qty3,c.gst,c.AMOUNT,  '|' '=',ItemQuantity,documentnumber,
cz= Isnull(floor(ItemQuantity/NullIF(72,0)),0),
Dz=ISNULL(FLOOR((itemquantity-(floor(itemquantity/72)*72))/(Nullif(12,0))),0),
Pc = ISNULL( floor(itemquantity-((floor(itemquantity/NullIF(72,0))*72)+
(FLOOR((itemquantity-(floor(itemquantity/NullIF(72,0))*72))/(Nullif(12,0)))*12))) ,0),
round(ItemExciseTax*ItemQuantity,2) XM_GST, round(TotalLineAmount/1.15,2) XM_NetAMT,
round(AMOUNT/ItemQuantity ,2) as pricecheck
from cashmemo_detail c
inner join cashmemo cm on cm.doc_no=c.doc_no 
inner join ig_o_salesorderDetail s on '_'+cast(documentnumber as varchar)+'_'=cm.hht_srno and c.sku=ItemCode and cm.pjp=left(DocumentPrefix,4)
where c.sku= 68842513 --and ItemQuantity=1800
order by ItemQuantity desc


--update CASHMEMO_DETAIL  set
--QTY1= Isnull(floor(ItemQuantity/NullIF(72,0)),0),
--QTY2=ISNULL(FLOOR((itemquantity-(floor(itemquantity/72)*72))/(Nullif(12,0))),0),
--QTY3 = ISNULL( floor(itemquantity-((floor(itemquantity/NullIF(72,0))*72)+
-- (FLOOR((itemquantity-(floor(itemquantity/NullIF(72,0))*72))/(Nullif(12,0)))*12))) ,0),
--GST=ItemExciseTax*ItemQuantity, amount=(totallineamount/1.15)
--from cashmemo_detail as c
--inner join cashmemo cm on cm.doc_no=c.doc_no 
--inner join ig_o_salesorderDetail s on '_'+cast(DocumentNumber as varchar)+'_'=cm.hht_srno and c.sku=ItemCode and cm.pjp=left(DocumentPrefix,4)
--where c.sku= 68842513 --and c.doc_date='20220226' --and cm.pjp='A002'


-- Update GIN Detail total
update GIN_DETAIL set 
qty1= Isnull(floor(qty1*6/NullIF(72,0)),0),
qty2=ISNULL(FLOOR((qty1*6-(floor(qty1*6/72)*72))/(Nullif(12,0))),0),
qty3 = ISNULL( floor(qty1*6-((floor(qty1*6/NullIF(72,0))*72)+(FLOOR((qty1*6-(floor(qty1*6/NullIF(72,0))*72))/(Nullif(12,0)))*12))) ,0)
GST=ItemExciseTax * ItemQuantity, amount=(totallineamount/1.15)
from GIN_DETAIL gd
inner join gin_head g on g.doc_no=gd.doc_no
where gd.sku=68842513 and qty1<12>0 doc
