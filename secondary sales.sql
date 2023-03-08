DECLARE @DOCDATEFROM DATE = '01-Feb-2023',
		@DOCDATETO DATE = '28-Feb-2023',
		@DDOCDATEFROM DATE = '01-Feb-2023',
		@DDOCDATETO DATE = '28Feb-2023',
--DECLARE @DOCDATEFROM DATE = '2018-07-13 00:00:00.000',
--		@DOCDATETO DATE = '2018-07-13 00:00:00.000',
		@fcomb varchar(20)= 'master_card',

		@COMPANY VARCHAR(10) = (SELECT COMPANY FROM COMPANY);


with DISCOUNT As
(
	Select 
		sdd.DISTRIBUTOR, sdd.DOCUMENT, sdd.DOC_NO ,sdd.BATCH, sdd.SKU, sdd.SUB_DOCUMENT,
		Amount = sum(sdd.Discount) 
	from SCHEME_DISCOUNT_DETAIL sdd
	inner join SCHEME_DISCOUNT sd on
			sd.COMPANY = sdd.COMPANY
			and sd.DISTRIBUTOR = sdd.DISTRIBUTOR
			and sd.SUB_DOCUMENT = sdd.SUB_DOCUMENT
			and sd.DOC_NO = sdd.DOC_NO
			and sd.Mp_Code = sdd.Mp_Code
			and sd.Seq_Id = sdd.Seq_Id
			and sd.Serial_No = sdd.Serial_No
	where sdd.COMPANY = @COMPANY
	and sdd.doc_Date BETWEEN @DdocDatefrom AND @DdocDateTo
	Group by sdd.DISTRIBUTOR, sdd.DOCUMENT, sdd.DOC_NO ,sdd.BATCH, sdd.SKU, sdd.SUB_DOCUMENT
),

sales as (Select 
	'1655' as Company,
	--CMD.Company,
	'F401' as Sales_org,
	CMD.Distributor as DistributorID,
	convert(varchar,CM.DELV_DATE,126) as InvoiceDate,
	CM.PJP as PJPID,
	SUBSTRING(cm.DSR,1,10) SalesmanID,
	se.ldesc Channel,
	cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop as OutletID,
	p5.LDESC Brand,
	SUBSTRING(CMD.sku,1,10) Material,
	s.LDESC 'SKU Description',
	Volume = ISNull(CMD.QTY1,0) * ISNull(s.SELL_FACTOR1,0) + ISNull(CMD.QTY2,0) * ISNull(s.SELL_FACTOR2,0)  + ISNull(CMD.QTY3,0) * ISNull(s.SELL_FACTOR3,0),
	CMD.AMOUNT GSV ,
	--NIV = CMD.AMOUNT -
	--		(Select sum(sdd.Discount - CASE WHEN sd.SCHEME_LEVEL = 'T' THEN sdd.DISCOUNT ELSE 0 END) 
	--		from SCHEME_DISCOUNT_DETAIL sdd
	--		inner join SCHEME_DISCOUNT sd on
	--				sd.COMPANY = sdd.COMPANY
	--				and sd.DISTRIBUTOR = sdd.DISTRIBUTOR
	--				and sd.SUB_DOCUMENT = sdd.SUB_DOCUMENT
	--				and sd.DOC_NO = sdd.DOC_NO
	--				and sd.Mp_Code = sdd.Mp_Code
	--				and sd.Seq_Id = sdd.Seq_Id
	--				and sd.Serial_No = sdd.Serial_No
	--		where sdd.COMPANY = CMD.COMPANY
	--			  and sdd.DISTRIBUTOR = CMD.DISTRIBUTOR
	--			  and sdd.DOCUMENT = CMD.DOCUMENT
	--			  and sdd.DOC_NO = CMD.DOC_NO
	--			  and sdd.BATCH = CMD.BATCH
	--		),

	NIV =(CMD.AMOUNT+ISNull(DISCOUNT.Amount,0)), --ISNull(DISCOUNT.Amount,0),
	'4' frequencyOfVisit,
	0 as FREE_INDICATOR,
	'PC' as Unit_MEASURE,
	LATITUDE,
	LONGITUDE,
	'KES' as CURRENCY,
	CMD.DOC_NO,
	case when payment_Mode in ('03') then 'Credit' else 'Cash' end as OrderID,
	SalesMode = case when exists (SELECT 1 from POP_ATTRIBUTE pa  where field_comb=@fcomb and VALUE_COMB_FROM='1' and CM.DISTRIBUTOR+cm.TOWN+cm.LOCALITY+cm.SLOCALITY+cm.pop=pa.DISTRIBUTOR+pa.TOWN+pa.LOCALITY+pa.SLOCALITY+pa.POP) then 'BC_OUTLET' else 'CASH_OUTLET' end,
	rtrim(ltrim(dsr.name)) DSR_Name
from CASHMEMO_DETAIL CMD
inner join CASHMEMO CM on CMD.COMPANY = CM.COMPANY and CMD.DISTRIBUTOR = CM.DISTRIBUTOR  and CMD.DOCUMENT = CM.DOCUMENT  
	and CMD.SUB_DOCUMENT = CM.SUB_DOCUMENT  and CMD.DOC_NO = CM.DOC_NO  
 
inner join POP p on 
		p.distributor = cmd.distributor
		and p.town = cm.town 
		and p.LOCALITY = cm.LOCALITY
		and p.SLOCALITY = cm.SLOCALITY
		and p.POP = cm.POP

inner join SUB_ELEMENT se on p.SUB_ELEMENT=se.SUB_ELEMENT
INNER JOIN DSR dsr ON cm.COMPANY = dsr.COMPANY AND cm.DISTRIBUTOR = dsr.DISTRIBUTOR AND cm.DSR = dsr.DSR
Left outer join sku s on CMD.sku = s.SKU
Left outer join prod_level5 p5 on s.prod1=p5.prod1 and s.prod2=p5.prod2 and s.prod3=p5.prod3 and s.prod4=p5.prod4 and s.PROD5=p5.PROD5 
Left outer join DISCOUNT on
	 DISCOUNT.DISTRIBUTOR = CMD.DISTRIBUTOR
	and DISCOUNT.DOCUMENT = CMD.DOCUMENT
	and DISCOUNT.DOC_NO = CMD.DOC_NO
	and DISCOUNT.BATCH = CMD.BATCH
	and DISCOUNT.SKU= CMD.SKU
	and DISCOUNT.SUB_DOCUMENT= CMD.SUB_DOCUMENT

--Left outer join SCHEME_DISCOUNT sd on
--	sd.COMPANY = CMD.COMPANY
--	and sd.DISTRIBUTOR = CMD.DISTRIBUTOR
--	and sd.DOCUMENT = CMD.DOCUMENT
--	and sd.SUB_DOCUMENT = CMD.SUB_DOCUMENT
--	and sd.DOC_NO = CMD.DOC_NO
where
	cm.COMPANY = @COMPANY  and
	cm.Delv_DATE BETWEEN @docDatefrom AND @docDateTo
 	 
	
	and visit_type='02'  and cm.DOCUMENT = 'CM' and 
		(cm.SUB_DOCUMENT='01'
		or
		 cm.SUB_DOCUMENT in( '02','04') and CASHMEMO_TYPE IN ('18','19','17')
		) and
		CMD.DISTRIBUTOR in ('15311154',
'15272530',
'15275014',
'15275024',
'15303284',
'15304518',
'15305226',
'15309167',
'15309646',
'15310039',
'15326811',
'15327234',
'15350139',
'15385502',
'15309646',
'15305226',
'15274408',
'15313562',
'15313281',
'15508467',
'15309701',
'15340887',
'15275701',
'15275024',
'15510796',
'15328022',
'15511686',
'15309167',
'15326811',
'15386413',
'15272530',
'15383704',
'15327234',
'15305227',
'15385502',
'15422855',
'15310063',
'15365468',
'15310039',
'15363168',
'15354428',
'15304518',
'15303284',
'15299653',
'15510169',
'15494028',
'15467908',
'15511685',
'15365948',
'15491682',
'15506880',
'15350139',
'15385325',
'15466683',
'15275014',
'15550650',
'15490031',
'15467490',
'15550389',
'15550390',
'15307900',
'15550388') and s.PROD5 not in ('310101001',
'390101001',
'310104E16',
'31020CE16',
'310260E16',
'390104E16','310982E16')
		)		

 select DistributorID,InvoiceDate,Channel,'ID - '+OutletID as OutletID,Material,Volume,GSV,NIV,DOC_NO,OrderID
 from sales where NIV !=0