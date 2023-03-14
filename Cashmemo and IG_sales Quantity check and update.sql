Declare @DATEtocheck date='20220601'
declare @sku varchar(20)=68903515

;with invoices (doc_no, doc_date,documentnumber,pjp,sku,ldesc, CS,DZ,PC,totalQTYCM,separator,_hht_Cs,hht_Dz,hht_pc,TotalQTYhht,cmamount,hhtamount) as
(
Select cm.DOC_NO,convert(date,cm.doc_date) doc_date,sd.documentnumber, cm.PJP,cd.sku,s.LDESC 'SKU',  
(convert(int, (QTY1))) 'CS',	 (Convert(int, (QTY2))) 'DZ', (convert(int, (QTY3))) 'PC',
( Convert(int, ((QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))) [TotalQTYCM],' ### 'as separator,
cz= Isnull(floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0)),0),
 dz=ISNULL(FLOOR((sd.itemquantity-(floor(sd.itemquantity/s.SELL_FACTOR1)*s.SELL_FACTOR1))/(Nullif(s.SELL_FACTOR2,0))),0),
 pc = ISNULL( floor(sd.itemquantity-((floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0))*s.SELL_FACTOR1)+
 (FLOOR((sd.itemquantity-(floor(sd.itemquantity/NullIF(s.SELL_FACTOR1,0))*s.SELL_FACTOR1))/(Nullif(s.SELL_FACTOR2,0)))*s.SELL_FACTOR2))) ,0),
(sd.ItemQuantity ) totalQTYHHT, round(cd.AMOUNT*1.15,2) Amount, sd.TotalLineAmount
from IG_O_SalesOrderdetail sd
inner join IG_O_SalesOrderHeader sh on sh.DocumentNumber=sd.DocumentNumber and sh.DocumentPrefix=sd.DocumentPrefix
inner join cashmemo cm on replace(cm.HHT_SRNO,'_','') = sd.DocumentNumber and sh.routecode=cm.PJP
inner join CASHMEMO_detail cd on cm.DOC_NO=cd.DOC_NO and cd.SKU=sd.itemcode
inner join sku s on s.sku=cd.sku
where sh.ETL_DateTime>@datetocheck and ItemCode=@sku
)
select *,totalQTYCM-TotalQTYhht  from invoices --where totalQTYCM-TotalQTYhht <> 0

--update CASHMEMO_DETAIL set QTY1=i._hht_Cs,QTY2=hht_Dz, QTY3=hht_pc from CASHMEMO_DETAIL cd 
--inner join invoices i on i.doc_no=cd.DOC_NO and i.sku= cd.SKU
--where cd.DOC_DATE=@DATEtocheck and cd.sku=@sku