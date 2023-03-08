use centegy_sndpro_uet
Declare @docno varchar(15)='2023B0020044'

update trans_detail set REF_QTY1=REF_QTY1/2, QTY1=qty1/2, amount=amount/2, GST=gst/2
where doc_no = @docno

update GIN_HEAD set NET_AMOUNT=NET_AMOUNT/2 where DOC_NO=@docno