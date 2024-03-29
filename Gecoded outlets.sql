USE centegy_sndpro_uet

DECLARE @DATEFR DATE ='20230401'

SELECT CG.TENANTCODE DT_CODE, P.PJP, P.LDESC PJP_DESC, CG.CUSTOMERCODE, C.CUSTOMERNAME,C.ADDRESS1+' '+ C.ADDRESS2 AS ADDRESS,
C.PHONE, CG.GEOCODEY, CG.GEOCODEX, SYNCKEY, GEOCODEDATE 'GEO CODE DATE', COUNT(CG.CUSTOMERCODE) OVER (PARTITION BY CG.ROUTECODE) AS TOTAL_BY_PJP,
O.LATITUDE, O.LONGITUDE, COUNT(CG.CUSTOMERCODE) OVER () AS TOTAL
 FROM IG_O_CustomerGeoCode CG
INNER JOIN IG_I_Customer C ON C.CUSTOMERCODE=CG.CUSTOMERCODE
INNER JOIN POP O ON O.TOWN+O.LOCALITY+O.SLOCALITY+O.POP = REPLACE(CG.CUSTOMERCODE, '~', '')
INNER JOIN PJP_HEAD P ON P.PJP=CG.ROUTECODE
WHERE CG.GEOCODEDATE >= @DATEFR
ORDER BY GEOCODEDATE DESC, ROUTECODE
