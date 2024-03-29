USE CENTEGY_SNDPRO_UET
GO
;WITH IGPRICE AS (
	SELECT DISTINCT 
		PP.ITEMCODE, 
		P.ITEMDESCRIPTION 'PRODUCT NAME',
		FORMAT( ROUND( PP.DEBITPRICE*1.15,2), 'C', 'ET-ET') 'RT PRICE (PC)', 
		FORMAT( ROUND( PP2.DEBITPRICE*1.15,2), 'C', 'ET-ET') 'RT PRICE (CS)', 
		C.HIERARCHYNAME CHANNEL, 
		PC.PROMOTIONCODE, 
		CAST(PA.PROMOTIONAMOUNT AS VARCHAR) + ' %' AS 'DISCOUNT', 
		FORMAT(ROUND( PP2.DEBITPRICE*1.15*(1 - PA.PROMOTIONAMOUNT/100),2), 'C', 'ET-ET') 'WS PRICE (CS)', 
		CONVERT( VARCHAR, PC.STARTDATE, 23) 'START DATE',
		CONVERT( VARCHAR, PC.ENDDATE, 23) 'END DATE',
	CASE 
		WHEN PC.ACTIVEINDICATOR = 1 THEN 'Active' 
		ELSE '-' END AS 'STATUS'
	 FROM IG_I_PRICINGPLAN  PP
		INNER JOIN IG_I_PROMOTIONGROUP PG ON PG.ITEMCODE=PP.ITEMCODE AND PP.UNITSOFMEASURE=PG.UNITSOFMEASURE AND PG.GROUPTYPE='A'
		INNER JOIN IG_I_PROMOTIONCUSTOMER PC ON PC.PROMOTIONCODE=PG.PROMOTIONCODE
		INNER JOIN IG_I_PROMOTIONCONTROL PL ON PL.PROMOTIONCODE=PG.PROMOTIONCODE
		INNER JOIN IG_I_PROMOTIONASSIGNMENT PA ON PA.PROMOTIONCODE=PG.PROMOTIONCODE
		INNER JOIN IG_I_PRODUCT P ON P.ITEMCODE=PP.ITEMCODE
		INNER JOIN IG_I_PRICINGPLAN PP2 ON PP2.ITEMCODE=PP.ITEMCODE AND PP2.UNITSOFMEASURE='CS'
		INNER JOIN IG_I_CUSTOMERHIERARCHYV1 C ON C.PARENTHIERARCHY = PC.CUSTOMERHIERARCHYCODE
	WHERE PP.UNITSOFMEASURE='PC' AND C.PARENTHIERARCHY IN ('0C0004C00018C00150C01900C11629', 'C00001C00016C00148C01194C10554') AND PC.ActiveIndicator=1
)
SELECT *, 
CASE 
	WHEN (STATUS = 'ACTIVE') THEN COUNT(PROMOTIONCODE) OVER (PARTITION BY ITEMCODE, STATUS ) 
	ELSE '-' END AS 'PROMO COUNT'  
FROM IGPRICE IP
WHERE [PRODUCT NAME] LIKE 'SUNL%200G'

