
select distinct REF_DOC_NO GIN_docno, gh.DOC_DATE gin_date, '|' AS 'separator', 
cm.pjp, cm.SECTION, cm.doc_date cm_date, 
datediff(day,cm.doc_date, gh.DOC_DATE) as date_diff from GIN_HEAD gh 
inner join cashmemo cm on cm.REF_DOC_NO = gh.DOC_NO
where cm.DOC_DATE >= '20221128' and datediff(day,cm.doc_date, gh.DOC_DATE) > 0

