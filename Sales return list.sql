use centegy_sndpro_uet
Declare @cmdate date = '20230307'
select s.sku, s.ldesc, cd.doc_no, convert(varchar, cd.DOC_DATE, 23) DOC_DATE, cast ( cd.qty3/s.SELL_FACTOR1 as int) CS, cm.CASHMEMO_TYPE
ref_qty1, ref_qty2, REF_QTY3 from CASHMEMO_DETAIL cd
inner join sku s on s.sku = cd.sku
inner join cashmemo cm on cm.doc_no = cd.DOC_NO
where cd.DOC_DATE=@cmdate and cashmemo_type in ( '17', '18', '19')
--cd.sku in (68820838 , 68820847 )


