delete from PR_GL_PM_PROFITCENTERMAPPING
insert into PR_GL_PM_PROFITCENTERMAPPING
select COMPANY, DISTRIBUTOR,'DSR',DSR,'0000',NULL from dsr d where not exists(select 1
 from PR_GL_PM_PROFITCENTERMAPPING pf where pf.POR_ORGACODE=d.company
 and pf.PLC_LOCACODE=d.DISTRIBUTOR and d.DSR=pf.PPM_CODE)
go
if exists (select 1 from sysobjects where name = 'dl_keynumgen' and xtype = 'U')
drop table dl_keynumgen
go
select * into dl_keynumgen from PR_ED_KN_KEYNUMGEN

update p set PKN_VALUECOMBINATION =dl.POR_ORGACODE+'~'+(select top 1 DISTRIBUTOR from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)+RIGHT(dl.PKN_VALUECOMBINATION,len(dl.PKN_VALUECOMBINATION)-11)
from  PR_ED_KN_KEYNUMGEN p join dl_keynumgen dl on p.pse_entityid=dl.PSE_ENTITYID and p.PKL_LVLNO=dl.PKL_LVLNO
and p.PKN_SRNO=dl.PKN_SRNO and p.PKN_FIELDID=dl.PKN_FIELDID and p.PKN_AUTOMANUAL=dl.PKN_AUTOMANUAL

