Declare @datefrom date='20220401'
Declare @dateTo date='20220425'

;with total as (select d.name Distributor,cm.PJP,ph.LDESC 'Route',
case when p.poptype='01' then 'Retail' when p.poptype='04' 
then 'Sub D' when p.poptype='03' then 'Key Account' else 'Wholesale' end as 'Outlet Type'
,convert(float, SUM(ROUND(CONVERT(NUMERIC(38,2),COALESCE(CD.AMOUNT,0)),16)),16) AS GSV
,Convert(float, SUM(ROUND(CONVERT(NUMERIC(38,2),COALESCE(CD.GST,0)),16)),2) AS GST
,Convert(float, SUM(ROUND(CONVERT(NUMERIC(38,2),COALESCE(CD.Discount,0)),16)),2) AS Discount
--,Convert(float, SUM(ROUND(CONVERT(NUMERIC(38,2),COALESCE(CD.AMOUNT+CD.DISCOUNT,16)),2))*1.15,2) AS 'Net Amount'
from cashmemo cm
INNER HASH JOIN (
SELECT CD.COMPANY, CD.DISTRIBUTOR, CD.DOCUMENT, CD.SUB_DOCUMENT,
CD.DOC_NO, CD.SKU, CD.BATCH, CD.AMOUNT,0 DISCOUNT, CD.GST, 0 FREE FROM CASHMEMO_DETAIL CD
INNER JOIN BATCH B ON CD.COMPANY = B.COMPANY AND CD.SKU = B.SKU AND CD.BATCH = B.BATCH
UNION ALL
SELECT SDD.COMPANY, SDD.DISTRIBUTOR, SDD.DOCUMENT, SDD.SUB_DOCUMENT,
SDD.DOC_NO, SDD.SKU, SDD.BATCH, 0 AMOUNT, SDD.DISCOUNT, SDD.GST, 0 FREE
FROM SCHEME_DISCOUNT_DETAIL SDD
UNION ALL
SELECT SK.COMPANY, SK.DISTRIBUTOR, SK.DOCUMENT, SK.SUB_DOCUMENT,
SK.DOC_NO, SK.SKU, SK.BATCH, 0 AS AMOUNT, 0 DISCOUNT, GST, 1 FREE FROM SCHEME_SKU SK
INNER JOIN BATCH B ON SK.COMPANY = B.COMPANY AND SK.SKU = B.SKU AND SK.BATCH = B.BATCH
) CD on cm.company = cd.COMPANY and cm.DISTRIBUTOR = cd.DISTRIBUTOR and
cm.doc_no = cd.doc_no and cm.document = cd.document and cm.SUB_DOCUMENT = cd.SUB_DOCUMENT
inner join pop p on p.TOWN+p.LOCALITY+p.SLOCALITY+p.POP=cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.POP
inner join PJP_HEAD ph on ph.PJP=cm.PJP 
inner join Distributor d on d.DISTRIBUTOR=cm.DISTRIBUTOR
where cm.DELV_DATE between @datefrom and @dateTo
and cm.distributor = (select DISTRIBUTOR from DISTRIBUTOR) --and cm.PJP='B001'
--and p.poptype='01'
group by d.name,cm.PJP,ph.LDESC,p.poptype
)
select *, convert(money,GSV+GST+Discount) 'Net Amount' from total