---- update geo_boundry------
update  GEO_BOUNDRY set PROD_LEVEL=(select top 1 COMPANY+geo1+geo2 from GEO_LEVEL2) where GEO_BOUNDRY='12'
go