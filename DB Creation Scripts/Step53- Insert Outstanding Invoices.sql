With Out_POP as (select COMPANY,DISTRIBUTOR, TOWN,LOCALITY,slocality,pop,dl.name,dl.net,(select top 1 working_date-1 from DISTRIBUTOR
) as date,right(('00000'+CAST(ROW_NUMBER()OVER(ORDER BY DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP,code) AS VARCHAR(6))),6)Doc_no from 
pop p join dl_ar dl on p.prev_pop_code=dl.code),

PJP as (select top 1 sp.COMPANY,sp.DISTRIBUTOR,sp.pjp,ph.DSR,ph.WAREHOUSE,sp.SELL_CATEGORY,sp.SECTION from SECTION_POP_PERMANENT sp join PJP_HEAD ph on sp.COMPANY=ph.COMPANY and 
sp.DISTRIBUTOR=ph.DISTRIBUTOR and sp.PJP=ph.pjp join Out_POP p on sp.TOWN+sp.LOCALITY+sp.SLOCALITY+sp.pop=p.TOWN+p.LOCALITY+p.SLOCALITY+p.pop ),

Ref_Pjp as (select top 1 pd.REF_PJP,ph.DSR as ref_dsr,pjp.* from PJP_DETAIL pd join PJP on pd.COMPANY=pjp.COMPANY and pd.DISTRIBUTOR=pjp.DISTRIBUTOR and pd.PJP=pjp.PJP and pd.SELL_CATEGORY=pjp.SELL_CATEGORY and
pd.SECTION=PJP.SECTION join PJP_HEAD ph on pd.COMPANY=ph.COMPANY and pd.DISTRIBUTOR=ph.DISTRIBUTOR and pd.REF_PJP=ph.pjp where pd.WEEK_NO=(select WEEK_NO from JC_WEEK where (select working_date from DISTRIBUTOR) between START_DATE and END_DATE)),

Memo as (
select distinct pjp.COMPANY, pjp.DISTRIBUTOR,'CM' as document,'00'+pjp.pjp+pop.doc_no as Doc_no,pop.date,pjp.pjp,pjp.REF_PJP,pjp.dsr,pjp.ref_dsr,pjp.SELL_CATEGORY,pjp.SECTION,pjp.WAREHOUSE,
pop.TOWN,pop.LOCALITY,pop.SLOCALITY,pop.pop,pop.name,'02' as visit_type,'0.00' as discount,'0.00' as gst,pop.NET,'0.00' as Cash_collect,'0.00' as RECEIVED_AMT,'1' as status,
pop.name as Comments,'0.00' as GST_Percentage,'1' as gst_applicable,NULL as HHT,'ADMIN' as UserEntry,NULL as Date_entry,'ADMIN' as Usermodify,NULL as Date_modify,pop.date as deliver,
'02' as payment_mode,pop.date as Scheduleddeliver,pop.date as effective,'01' as cm_type,NULL as a,NULL as b,NULL as c,'01' as Sub_document,NULL as d,NULL as e,NULL as f,
NULL as g,NULL as h,NULL as i,NULL as j,NULL as k,NULL as l,NULL as m,NULL as n,NULL as o,NULL as p,NULL as q,NULL as r,NULL as s,NULL as t,NULL as u,NULL as v,NUll as x,
NULL as y,NULL as z 
from Ref_Pjp pjp join Out_POP pop on pjp.COMPANY=pop.COMPANY and pjp.DISTRIBUTOR=pop.DISTRIBUTOR)

insert into CASHMEMO
select * from memo m where not exists (select 1 from CASHMEMO cm where m.COMPANY=cm.COMPANY and m.DISTRIBUTOR=cm.DISTRIBUTOR and m.document=cm.DOCUMENT and m.Doc_no=cm.DOC_NO
and m.date=cm.DOC_DATE and m.PJP=cm.PJP and m.REF_PJP=cm.REF_PJP and m.DSR=cm.DSR and m.ref_dsr=cm.REF_DSR and m.TOWN+m.LOCALITY+m.SLOCALITY+m.pop=cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop 
and m.name=cm.POP_NAME and m.Sub_document=cm.SUB_DOCUMENT)
