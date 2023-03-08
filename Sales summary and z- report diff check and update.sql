use centegy_sndpro_uet

DECLARE @date date='20221228'
;with salessummary as (
select REPLACE(hht_srno,'_','') HHT_srno,cm.PJP,ph.ldesc PJP_desc, cm.doc_no, NET_AMOUNT, sum(AMOUNT*1.15) AMOUNT, NET_AMOUNT- sum(amount*1.15) diff  from CASHMEMO cm
inner join CASHMEMO_DETAIL c on c.DOC_NO=cm.doc_no
inner join PJP_HEAD ph on ph.pjp=cm.PJP
where cm.DOC_DATE=@DATE
group by hht_srno,cm.DOC_NO,cm.pjp,ph.ldesc, NET_AMOUNT
--order by diff desc
)select PJP_desc, sum(net_amount) 'Z report', sum(amount) 'sales summary',sum(diff) diff, sum(diff)+sum(amount) 'correct price to be' from salessummary where diff not between -1 and 1
group by PJP_desc
order by diff desc

select REPLACE(hht_srno,'_','') HHT_srno,cm.PJP,ph.ldesc PJP_desc, cm.doc_no, NET_AMOUNT, sum(AMOUNT*1.15) AMOUNT, NET_AMOUNT- sum(amount*1.15) diff  from CASHMEMO cm
inner join CASHMEMO_DETAIL c on c.DOC_NO=cm.doc_no
inner join PJP_HEAD ph on ph.pjp=cm.PJP
where cm.DOC_DATE=@DATE 
group by hht_srno,cm.DOC_NO,cm.pjp,ph.ldesc, NET_AMOUNT
order by diff desc

Update CASHMEMO set NET_AMOUNT=NET_AMOUNT-26.98 from cashmemo cm
inner join CASHMEMO_DETAIL cd on cm.DOC_NO=cd.DOC_NO
where cm.DOC_DATE='20220504'and cm.DOC_NO in (
'22A006027950',
'22A006027910',
'22new2024980',
'22new2025090',
'22new2025130',
'22new2024830',
'22new2025110',
'22A006027920',
'22A006027930',
'22new2025050',
'22A006027940',
'22A006027960'
)



