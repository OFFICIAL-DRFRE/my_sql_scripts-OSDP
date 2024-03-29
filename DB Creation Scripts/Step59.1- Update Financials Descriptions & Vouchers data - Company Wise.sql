update PR_GN_LC_LOCATION set plc_locadesc=(select name from DISTRIBUTOR where SALES_ORGANIZATION is NOT NULL),
PLC_LOCASHORT=(select left(name,20) from DISTRIBUTOR where SALES_ORGANIZATION is NOT NULL)
go

update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='CM' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY+'~'+'99' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='CN' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY+'~'+'12' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='CN' and SVV_VCVRREFNO=2
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY+'~'+'01' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='CN' and SVV_VCVRREFNO=3
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY+'~'+'05' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='CN' and SVV_VCVRREFNO=4
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='DA' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY+'~'+'01' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='DN' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 COMPANY from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='RA' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 '00'+'~'+COMPANY+'~'+'1' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='RV' and SVV_VCVRREFNO=1
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 '08'+'~'+COMPANY+'~'+'2' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='RV' and SVV_VCVRREFNO=2
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 '00'+'~'+COMPANY+'~'+'3' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='RV' and SVV_VCVRREFNO=3
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select top 1 '01'+'~'+COMPANY+'~'+'2' from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='RV' and SVV_VCVRREFNO=4
update PR_AM_VV_VALCOMBVOUCHER set SVV_VCHRVALCOMB=(select  top 1 COMPANY from DISTRIBUTOR where SALES_ORGANIZATION is not NULL)
where SVH_VCHDCOMBID='SR' and SVV_VCVRREFNO=1
go