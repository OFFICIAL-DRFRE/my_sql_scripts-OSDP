alter table gin_detail nocheck constraint FK_GIN_DETAIL__TRANS_DETAIL
go
alter table gin_detail nocheck constraint FK_GIN_DETAIL__GIN_HEAD
go

Declare @datefr date ='20221101'
Declare @dateto date ='20221117'
declare @s varchar(20) = '69692828'     			--<--- change the SKU code FIRST   
;with missing_gin (dtcode, pjpcode, docdate,skucode, gncode, itemquantity, amount, gst) as(
	select 
		c.distributor, pjp , c.doc_date,c.sku, ref_doc_no,
		sum(cast(((C.QTY1*sell_factor1)+(QTY2*sell_factor2)+(QTY3*sell_factor3))as int)) itemquantity,
		sum(amount), sum(c.GST)
	from CASHMEMO_DETAIL c
		inner join CASHMEMO cm on cm.DOC_NO = c.DOC_NO and cm.visit_type = '02'
		inner join sku s on s.sku = c.SKU
		where c.DOC_DATE between @datefr and @dateto and c.sku =@s    
	group by c.distributor, pjp , c.doc_date,c.sku, ref_doc_no
)
--select * from missing_gin

insert into GIN_DETAIL (
	COMPANY,DISTRIBUTOR,DOCUMENT,SUB_DOCUMENT,DOC_NO,SR_NO,ENTRY_TYPE,SKU,SKU_TYPE,BATCH,
	WAREHOUSE,DOC_DATE,REF_QTY1,REF_QTY2,REF_QTY3,AMOUNT,GST,sku_index 
	)
select 
	23, dtcode, 'GN', '01', gncode, 1, '01', skucode, '01', '1-1', '01', docdate, 
	cz= Isnull(floor(itemquantity/NullIF(SELL_FACTOR1,0)),0),
	 dz=ISNULL(FLOOR((itemquantity-(floor(itemquantity/SELL_FACTOR1)*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0))),0),
	 pc= ISNULL( floor(itemquantity-((floor(itemquantity/NullIF(SELL_FACTOR1,0))*SELL_FACTOR1)+
		 (FLOOR((itemquantity-(floor(itemquantity/NullIF(SELL_FACTOR1,0))*SELL_FACTOR1))/(Nullif(SELL_FACTOR2,0)))*SELL_FACTOR2))),0),
	 amount, gst, sc.sku_index 
 from missing_gin mg
	inner join sku s on sku = skucode
	inner join sku_category sc on sc.sku = skucode
where docdate between @datefr and @dateto
			
update gin_detail set 
	QTY1=REF_QTY1, QTY2=REF_QTY2,QTY3=REF_QTY3,
	VAN_QTY1=0,VAN_QTY2=0,VAN_QTY3=0,
	SUGGESTED_GIN='06',WH_DISTRIBUTOR=DISTRIBUTOR
where DOC_DATE between @datefr and @dateto and QTY1 is null


						-------------------------Transfer to trans Detail------------------------------
insert into trans_detail (
	COMPANY,DISTRIBUTOR,DOCUMENT,sub_document,DOC_NO,ENTRY_TYPE,SKU,SKU_TYPE,BATCH,
	WAREHOUSE,DOC_DATE,REF_QTY1,REF_QTY2,REF_QTY3, qty1, QTY2, qty3, AMOUNT,GST,sku_index,
	van_qty1, van_qty2, van_qty3, WH_DISTRIBUTOR
	)
select 
	COMPANY,DISTRIBUTOR,DOCUMENT,sub_document,DOC_NO,ENTRY_TYPE,SKU,SKU_TYPE,BATCH,
	WAREHOUSE,DOC_DATE,REF_QTY1,REF_QTY2,REF_QTY3, qty1, QTY2, qty3, AMOUNT,GST,sku_index, 
	van_qty1, van_qty2, van_qty3, WH_DISTRIBUTOR
from GIN_DETAIL
WHERE SKU =@S AND doc_date between @datefr and @dateto
go
alter table gin_detail check constraint FK_GIN_DETAIL__TRANS_DETAIL
go
alter table gin_detail check constraint FK_GIN_DETAIL__GIN_HEAD
