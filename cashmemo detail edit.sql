
Declare @change_from VARCHAR(40)= 68438744 
Declare @change_to VARCHAR(40)= 68438737 

select * from cashmemo_detail where doc_date='20220509' and DOC_NO like '%new2%' and sku in (@change_from, @change_to)


--update CASHMEMO_DETAIL set REF_QTY3=REF_QTY3+1, QTY3=QTY3+1, AMOUNT=2*AMOUNT, ord_qty3=ORD_QTY3+1  
--where doc_date='20220509' and DOC_NO = '22new2026740' and sku=68438737

--delete from cashmemo_detail where doc_date='20220509' and DOC_NO like '%new2%' and sku=@change_from 


