declare @year varchar(20)
set @year='20222022';
update PR_GN_PD_PERIOD set PPD_PERDSTATUS='C' WHERE PFS_ACNTYEAR=@year and (select working_date from distributor where SALES_ORGANIZATION is not NULL) between PPD_PERDDATEFROM and PPD_PERDDATETO
update PR_GN_PD_PERIOD set PPD_PERDSTATUS='P' WHERE PPD_PERDNO < (SELECT PPD_PERDNO FROM PR_GN_PD_PERIOD WHERE PFS_ACNTYEAR='20212021' and (select working_date from distributor where sales_organization is not NULL) between PPD_PERDDATEFROM and PPD_PERDDATETO) and PPD_PERDNO<>0 and PFS_ACNTYEAR=@year
update PR_GN_PD_PERIOD set PPD_PERDSTATUS='N' WHERE PPD_PERDNO > (SELECT PPD_PERDNO FROM PR_GN_PD_PERIOD WHERE PFS_ACNTYEAR='20232023' and (select working_date from distributor where SALES_ORGANIZATION is not NULL) between PPD_PERDDATEFROM and PPD_PERDDATETO) and PPD_PERDNO<>0 and PFS_ACNTYEAR=@year
