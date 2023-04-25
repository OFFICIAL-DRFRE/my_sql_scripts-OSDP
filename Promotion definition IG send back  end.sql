IF OBJECT_ID('TEMPDB..#PromoExpire') IS NOT NULL
BEGIN
   DROP TABLE #PromoExpire;
END

declare @step int = 0;
declare @isCBU bit = 0,@Test_scheme bit = 0, @year  varchar(4), @jcno varchar(2); 

select @year = year, @jcno = jcno from jc_week where cast(getdate() as date) between start_date and end_date;


if exists (select 1 from distributor_association where field_comb = 'TEST_DIST' and value_comb = '1')
select @Test_scheme  = 1;

select top 1 @isCBU = PARAMETER_VALUE_INTEGER 
from IG_CONFIGURATION where PARAMETER_NAME = 'MASTER_SKU_LEVEL_SCHEME';

IF OBJECT_ID('TEMPDB..#PromotionCode') IS NOT NULL
BEGIN
   DROP TABLE #PromotionCode;
END

IF OBJECT_ID('TEMPDB..#TEMP_SCH_CM') IS NOT NULL
BEGIN
DROP TABLE #TEMP_SCH_CM;
End
 
IF OBJECT_ID('TEMPDB..#TEMP_CM_ATR') IS NOT NULL
BEGIN
DROP TABLE #TEMP_CM_ATR;
End
IF OBJECT_ID('TEMPDB..#PromoFilter') IS NOT NULL
BEGIN
   DROP TABLE  #PromoFilter;
END
CREATE TABLE #PromotionCode (
TenantCode nvarchar(12) null, PromotionCode nvarchar(50) null
);
with s as (
select d.DISTRIBUTOR TenantCode , p.PBS_MP_CODE+'~'+p.PBS_SEQID PromotionCode , case isnull(p.PBS_DESC,'') when '' then 'N/A' else p.PBS_DESC end PromotionDescription, '' PromotionRemarks 
,           Case 
                when right(p.PBS_MP_CODE,3) IN('001','018','015') AND P.PBS_LEVEL = 'T' AND P.pbs_code = 'Total' and not exists (select 1 from memory_variable mv where mv.COMPANY = p.COMPANY and mv.main_process = p.pbs_mp_code and mv.seq_id = p.pbs_seqid and mv.variable_name = 'where_sum' and not(replace(replace(replace(mv.variable_value,'MASTER_SKU',''),'SKU',''),'PROD','') = mv.variable_value) ) then '6'   /* - Percent off invoice */
                /*when right(p.PBS_MP_CODE,3) IN('006')  then '1'    - Amount off line item */
                when right(p.PBS_MP_CODE,3) IN('008','006')  then '5'   /* - Amount off Invoice */
                when right(p.PBS_MP_CODE,3) IN('001','016','018','019','015')  then '2'   /* - Percent off line item */
                when right(p.PBS_MP_CODE,3) in ('007','017','009') then '4'  /* - Free goods (Exclusive) */
                end PromotionTypeCode 

,           Case 
                when right(p.PBS_MP_CODE,3) IN('001','015') AND P.PBS_LEVEL = 'T' AND P.pbs_code = 'Total' and not exists (select 1 from memory_variable mv where mv.COMPANY = p.COMPANY and mv.main_process = p.pbs_mp_code and mv.seq_id = p.pbs_seqid and mv.variable_name = 'where_sum' and not(replace(replace(replace(mv.variable_value,'MASTER_SKU',''),'SKU',''),'PROD','') = mv.variable_value) ) and exists (select 1 from field_comb fc where  fc.COMPANY = p.COMPANY and fc.mp_code = p.pbs_mp_code and fc.seq_id = p.pbs_seqid group by fc.company, fc.mp_Code, fc.seq_id having count(1) = 1 and min(fc.amount_fr) <=1 ) then '0'   /* 0 - No qualification */
                when right(p.PBS_MP_CODE,3) IN ('007','006','016','019') then '1'  /* On quantity */
                when right(p.PBS_MP_CODE,3) IN ('001','017','009','008','018','015') then '2'  /* On Amount */
                end RangeBasis
,           Case 
				when p.pbs_scheme_type = 'Z' then 1 
				when p.pbs_scheme_type = 'A' then 2 
				when right(p.PBS_MP_CODE,3) IN('001','018','015') AND P.PBS_LEVEL = 'T' AND P.pbs_code = 'Total' and not exists (select 1 from memory_variable mv where mv.COMPANY = p.COMPANY and mv.main_process = p.pbs_mp_code and mv.seq_id = p.pbs_seqid and mv.variable_name = 'where_sum' and not(replace(replace(replace(mv.variable_value,'MASTER_SKU',''),'SKU',''),'PROD','') = mv.variable_value) ) and exists (select 1 from field_comb fc where  fc.COMPANY = p.COMPANY and fc.mp_code = p.pbs_mp_code and fc.seq_id = p.pbs_seqid group by fc.company, fc.mp_Code, fc.seq_id having count(1) = 1 and min(fc.amount_fr) <=1 ) then '0'   /* - N/A*/ 
				when right(p.PBS_MP_CODE,3) IN('006')  then '0'

				else 1 end AmountBasis /* Wholesale Price */
, 0 ExclusionOption 
, case p.pbs_claimable when 1 then 'P' else 'C' end PromotionIndicator 
, case when @isCBU=1 then 9 else  0 end PromotionProductLevel
, Case 
                when p.ALLOCATION_HRKY in('COMPANY~DISTRIBUTOR', 'COMPANY~DISTRIBUTOR~DSR') then 1
                else 0 
  end AllowPromotionQuota
  ,isnull(p.lppc,0) MinimumSKU
  ,               Case 
						when right(p.PBS_MP_CODE,3) IN('001','018','015') AND P.PBS_LEVEL = 'T' AND P.pbs_code = 'Total' 
						and not exists (select 1 from memory_variable mv where mv.COMPANY = p.COMPANY and mv.main_process = p.pbs_mp_code and mv.seq_id = p.pbs_seqid and mv.variable_name = 'where_sum' and not(replace(replace(replace(mv.variable_value,'MASTER_SKU',''),'SKU',''),'PROD','') = mv.variable_value) ) and p.pbs_scheme_type IN('T','B') then 'ONI'   /* - Invoice Percentage */
						when p.pbs_scheme_type in ('Z','A') then 'DT'
                                                                                                                                                                                        when right(p.PBS_MP_CODE,3) IN('008','006')  then 'ONI'
                else ''
                end Conditiontype 
				,0 ApplicationType
from pb_setup p 
cross join DISTRIBUTOR d
where p.pbs_period_to >= getdate()-15 and right(p.PBS_MP_CODE,3) in ('001','016','007','017','009','006','008','018','019','015') and case when @test_scheme = 0 then 0 else isnull(p.test_scheme,0) end = isnull(p.test_scheme,0)
AND 
       EXISTS   (
         SELECT
            1 
         FROM
            MEMORY_VARIABLE M   
         WHERE
            M.COMPANY=P.COMPANY AND M.MAIN_PROCESS=P.PBS_MP_CODE AND M.SEQ_ID=P.PBS_SEQID   
            AND VARIABLE_NAME='field_comb' 
      )   
      AND (
         (
            P.ALLOCATION_ON IS NULL
         )  
         OR (
            P.ALLOCATION_ON = 'D'   
            AND P.PBS_PROCEDURE IN (
               'SHMA07','SHMA09'
            ) 
            AND EXISTS (
               SELECT
                  1 
               FROM
                  SCHEME_ALLOCATION_ONSALE SAO    
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE 
                  AND SAO.SEQ_ID = P.PBS_SEQID AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND ISNULL(SAO.DISCOUNT_ALLOC_QTY,0)  > 0
            ) 
         )  
         OR (
            P.ALLOCATION_ON = 'D' 
            AND P.PBS_PROCEDURE NOT IN ('SHMA07','SHMA09')     
            AND EXISTS 
            (
               SELECT 1 FROM
                  SCHEME_ALLOCATION_ONSALE SAO 
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE AND SAO.SEQ_ID = P.PBS_SEQID 
                  AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND ISNULL(SAO.DISCOUNT_ALLOC_AMOUNT,0)  > 0
            ) 
         )      
         OR (
            P.ALLOCATION_ON = 'S' 
            AND EXISTS (
               SELECT
                  1 
               FROM
                  SCHEME_ALLOCATION_ONSALE SAO 
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE AND SAO.SEQ_ID = P.PBS_SEQID 
                  AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND NOT (ISNULL(SAO.SCHEME_ALLOC_QTY,0)  = 0 
                  AND ISNULL(SAO.SCHEME_ALLOC_AMOUNT,0)  = 0 
                  AND ISNULL(SAO.SCHEME_ALLOC_VOLUME,0)  = 0)
            ) 
         )  
      )
)

MERGE IG_I_PromotionControl t
USING s ON t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode
WHEN MATCHED  AND NOT (t.PromotionDescription = s.PromotionDescription AND t.PromotionRemarks = s.PromotionRemarks AND t.PromotionTypeCode = s.PromotionTypeCode
AND t.RangeBasis = s.RangeBasis AND t.AmountBasis = s.AmountBasis AND t.ExclusionOption = s.ExclusionOption AND t.PromotionIndicator = s.PromotionIndicator
AND t.PromotionProductLevel = s.PromotionProductLevel AND t.AllowPromotionQuota = s.AllowPromotionQuota and t.MinimumSKU=s.MinimumSKU and t.Conditiontype=s.Conditiontype)
THEN UPDATE SET t.PromotionDescription = s.PromotionDescription, t.PromotionRemarks = s.PromotionRemarks, t.PromotionTypeCode = s.PromotionTypeCode
, t.RangeBasis = s.RangeBasis, t.AmountBasis = s.AmountBasis, t.ExclusionOption = s.ExclusionOption, t.PromotionIndicator = s.PromotionIndicator
, t.PromotionProductLevel = s.PromotionProductLevel, t.AllowPromotionQuota = s.AllowPromotionQuota
, t.ETL_DateTime = getdate()
, t.MinimumSKU=s.MinimumSKU
, t.Conditiontype=s.Conditiontype
WHEN NOT MATCHED BY SOURCE AND NOT (t.PromotionCode like '%~015~%') THEN DELETE
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, PromotionDescription, PromotionRemarks, PromotionTypeCode, RangeBasis, AmountBasis, ExclusionOption, PromotionIndicator, PromotionProductLevel, AllowPromotionQuota,ETL_DateTime,MinimumSKU,Conditiontype,ApplicationType) 
      VALUES (s.TenantCode, s.PromotionCode, s.PromotionDescription, s.PromotionRemarks, s.PromotionTypeCode, s.RangeBasis, s.AmountBasis, s.ExclusionOption, s.PromotionIndicator, s.PromotionProductLevel, s.AllowPromotionQuota,getdate(),s.MinimumSKU,s.Conditiontype,s.ApplicationType)
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

/*Promotion Assignment*/

with fldComb as 
(
      select mp_code,seq_id,serial_no,field_comb,value_comb
      ,     isnull(case 
                  when right(MP_CODE,3) in ('001','017','009','008','018','015') then amount_fr
                  when right(MP_CODE,3) in ('006','007','016','019') then quantity_fr
                  else 0 
                  end,0) rfrom
      ,     isnull(case
                  when right(MP_CODE,3) in ('001','017','009','008','018','015') then case when purchase_limit between amount_fr and amount_to then purchase_limit else amount_to end
                  when right(MP_CODE,3) in ('006','007','016','019') then case when purchase_limit between quantity_fr and quantity_to then purchase_limit else quantity_to end
                  else 0 
                  end,0) rto
      ,     isnull(case when right(MP_CODE,3) in ('007','017','009') 
            then discount_qty  
            else discount_val 
            end,0)      preturn
      , isnull(divided_unit,1) divided_unit, isnull(purchase_limit,0) purchase_limit

      ,     isnull(case
                  when right(MP_CODE,3) in ('001','017','009','008','018','015') then amount_to 
                  when right(MP_CODE,3) in ('006','007','016','019') then quantity_to 
                  else 0 
                  end,0) rto1


      from field_comb)

, s as (
select d.DISTRIBUTOR TenantCode , p.pbs_mp_code+'~'+p.PBS_SEQID PromotionCode  

, case 
    when right(s.MP_CODE,3) in ('001','009','008','016','018','019','015') or (right(s.MP_CODE,3) in ('006','007','017') and case when isnull(s.divided_unit,0) = 0 then 1 else cast(s.rto / s.divided_unit AS bigINT) end <= 1 )
    then s.rfrom 
    else s.divided_unit end RangeLow

, case 
    when right(s.MP_CODE,3) in ('001','009','008','016','018','019','015') or (right(s.MP_CODE,3) in ('006','007','017') and case when isnull(s.divided_unit,0) = 0 then 1 else cast(s.rto / s.divided_unit AS bigINT) end <= 1 )
    then s.rto1
    else s.divided_unit end RangeHigh
        
, case 
    when right(s.MP_CODE,3) in ('001','009','008','016','018','019','015') or (right(s.MP_CODE,3) in ('006','007','017') and case when isnull(s.divided_unit,0) = 0 then 1 else cast(s.rto / s.divided_unit AS bigINT) end <= 1 )
    then 0 
    else 1 end RepeatingRange                      
,     isnull(s.preturn,0) PromotionAmount
, s.serial_no SlabNumber      
from pb_setup p 
inner join 
fldComb s
on s.mp_code = p.pbs_mp_code
and s.seq_id = p.pbs_seqid
and p.pbs_period_to >= getdate()-15
cross join DISTRIBUTOR d
where right(p.pbs_mp_code,3) in ('001','016','007','017','009','006','008','018','019','015') and case when @test_scheme = 0 then 0 else isnull(p.test_scheme,0) end = isnull(p.test_scheme,0)

      AND (
         (
            P.ALLOCATION_ON IS NULL
         )  
         OR (
            P.ALLOCATION_ON = 'D'   
            AND P.PBS_PROCEDURE IN (
               'SHMA07','SHMA09'
            ) 
            AND EXISTS (
               SELECT
                  1 
               FROM
                  SCHEME_ALLOCATION_ONSALE SAO    
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE 
                  AND SAO.SEQ_ID = P.PBS_SEQID AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND ISNULL(SAO.DISCOUNT_ALLOC_QTY,0)  > 0
            ) 
         )  
         OR (
            P.ALLOCATION_ON = 'D' 
            AND P.PBS_PROCEDURE NOT IN ('SHMA07','SHMA09')     
            AND EXISTS 
            (
               SELECT 1 FROM
                  SCHEME_ALLOCATION_ONSALE SAO 
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE AND SAO.SEQ_ID = P.PBS_SEQID 
                  AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND ISNULL(SAO.DISCOUNT_ALLOC_AMOUNT,0)  > 0
            ) 
         )      
         OR (
            P.ALLOCATION_ON = 'S' 
            AND EXISTS (
               SELECT
                  1 
               FROM
                  SCHEME_ALLOCATION_ONSALE SAO 
               WHERE
                  SAO.COMPANY = P.COMPANY AND SAO.MP_CODE = P.PBS_MP_CODE AND SAO.SEQ_ID = P.PBS_SEQID 
                  AND SAO.FIELD_COMB = 'COMPANY~DISTRIBUTOR' AND SAO.VALUE_COMB = d.COMPANY+'~'+d.DISTRIBUTOR
                  AND NOT (ISNULL(SAO.SCHEME_ALLOC_QTY,0)  = 0 
                  AND ISNULL(SAO.SCHEME_ALLOC_AMOUNT,0)  = 0 
                  AND ISNULL(SAO.SCHEME_ALLOC_VOLUME,0)  = 0)
            ) 
         )  
      )
)
--SELECT * FROM S PromotionCode like '%~015~%'
MERGE IG_I_PromotionAssignment t
USING s ON t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode and t.RangeLow = s.RangeLow
WHEN MATCHED  AND NOT (t.RangeHigh = s.RangeHigh and t.RepeatingRange = s.RepeatingRange and t.PromotionAmount = s.PromotionAmount and t.SlabNumber = s.SlabNumber)
THEN UPDATE SET t.RangeHigh = s.RangeHigh, t.RepeatingRange = s.RepeatingRange, t.PromotionAmount = s.PromotionAmount, t.SlabNumber = s.SlabNumber
, t.ETL_DateTime = getdate()
WHEN NOT MATCHED BY SOURCE  AND NOT (t.PromotionCode like '%~015~%') THEN DELETE
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, RangeLow, RangeHigh, RepeatingRange, PromotionAmount, SlabNumber,ETL_DateTime) 
      VALUES (s.TenantCode, s.PromotionCode, s.RangeLow, s.RangeHigh, s.RepeatingRange, s.PromotionAmount, s.SlabNumber,getdate())
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

--set nocount on;

/*PromoGroup*/


SELECT P.COMPANY, P.DISTRIBUTOR, P.TOWN, P.LOCALITY, P.SLOCALITY, P.POP, SL.LSM, P.POPTYPE, se.master_channel, se.channel, se.sub_channel, se.element, P.SUB_ELEMENT, P.COMPANY_RANK, P.RANK, T.DISTRICT, T.STRATA, T.PROVINCE
, GT.GEOCODE GEO_CODE, GT.GEO1 GEO_LEVEL1, GT.GEO2 GEO_LEVEL2, GT.GEO3 GEO_LEVEL3
, GT.GEO4 GEO_LEVEL4, GT.GEO5 GEO_LEVEL5, GT.GEO6 GEO_LEVEL6, GT.GEO7 GEO_LEVEL7, GT.GEO8 GEO_LEVEL8, GT.GEO9 GEO_LEVEL9
, '01' PARAMETER1 /* PAYMENT MODE */
, P.AREATYPE PARAMETER3 
, P.DISTRIBUTOR PARAMETER4 
, GT.GEO1 PARAMETER5
,P.PERFECT_STORE_LEVEL 
, CAST('' AS VARCHAR(3)) A0, CAST('' AS VARCHAR(3)) A1, CAST('' AS VARCHAR(3)) A2
, CAST('' AS VARCHAR(3)) A3, CAST('' AS VARCHAR(3)) A4, CAST('' AS VARCHAR(3)) A5
, CAST('' AS VARCHAR(3)) A6, CAST('' AS VARCHAR(3)) A7, CAST('' AS VARCHAR(3)) A8, CAST('' AS VARCHAR(3)) A9
INTO #TEMP_POP_ATR
FROM POP P 
INNER JOIN SUB_LOCALITY SL 
ON P.COMPANY = SL.COMPANY AND P.TOWN = SL.TOWN AND P.LOCALITY = SL.LOCALITY  AND P.SLOCALITY = SL.SLOCALITY
INNER JOIN TOWN T 
ON P.COMPANY = T.COMPANY AND P.TOWN = T.TOWN
left join sub_element se on se.company = p.company and se.sub_element = p.sub_element
LEFT JOIN GEO_TABLE GT 
ON GT.COMPANY = T.COMPANY AND GT.GEOCODE = T.GEOCODE;

ALTER TABLE #TEMP_POP_ATR ADD PRIMARY KEY (COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP);

UPDATE A SET 
  A.A0 = B.A0, A.A1 = B.A1, A.A2 = B.A2, A.A3 = B.A3, A.A4 = B.A4
, A.A5 = B.A5, A.A6 = B.A6, A.A7 = B.A7, A.A8 = B.A8, A.A9 = B.A9
FROM #TEMP_POP_ATR A INNER JOIN (
SELECT COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP
, [0] A0, [1] A1, [2] A2, [3] A3, [4] A4, [5] A5, [6] A6, [7] A7, [8] A8, [9] A9
FROM (
SELECT P.COMPANY , P.DISTRIBUTOR, P.TOWN, P.LOCALITY, P.SLOCALITY, P.POP
, ROW_NUMBER() OVER(PARTITION BY P.COMPANY , P.DISTRIBUTOR, P.TOWN, P.LOCALITY, P.SLOCALITY, P.POP ORDER BY PA.ACCOUNT_TYPE) -1 RN
, PA.ACCOUNT_TYPE 
FROM POP P 
LEFT JOIN POP_ACCOUNT PA 
ON P.COMPANY = PA.COMPANY AND P.DISTRIBUTOR = PA.DISTRIBUTOR 
AND P.TOWN = PA.TOWN AND PA.LOCALITY = P.LOCALITY AND PA.SLOCALITY = P.SLOCALITY AND PA.POP = P.POP
) UP PIVOT
(
MIN(ACCOUNT_TYPE) FOR RN IN ([0], [1], [2], [3], [4], [5], [6], [7], [8], [9])
) P
) B ON A.COMPANY = B.COMPANY AND A.DISTRIBUTOR = B.DISTRIBUTOR AND A.TOWN = B.TOWN AND A.LOCALITY = B.LOCALITY AND A.SLOCALITY = B.SLOCALITY AND A.POP = B.POP;

SELECT s.COMPANY SKU_COMPANY, S.SKU, S.MASTER_SKU,S.PROD1,S.PROD2,S.PROD3,S.PROD4,S.PROD5,S.PROD6,S.PROD7,S.PROD8,S.PROD9 
, S.GST_REGISTERED PARAMETER2 
INTO #TEMP_SKU_ATR
FROM SKU S
WHERE EXISTS (SELECT 1 FROM SKU_CATEGORY WHERE COMPANY = S.COMPANY AND SKU  = S.SKU AND SKU_INDEX > 0) AND S.SKU_INDEX > 0;

ALTER TABLE #TEMP_SKU_ATR ADD PRIMARY KEY (SKU_COMPANY,SKU);




SELECT 
ISNULL((DENSE_RANK()OVER (ORDER BY 
A.COMPANY,A.DISTRIBUTOR,A.TOWN
, A.LSM, A.POPTYPE
, a.master_channel, a.channel, a.sub_channel, a.element
, A.SUB_ELEMENT
, A.COMPANY_RANK, A.RANK, A.DISTRICT, A.STRATA, A.PROVINCE, A.GEO_CODE, A.GEO_LEVEL1, A.GEO_LEVEL2, A.GEO_LEVEL3 
, A.GEO_LEVEL4, A.GEO_LEVEL5, A.GEO_LEVEL6, A.GEO_LEVEL7, A.GEO_LEVEL8, A.GEO_LEVEL9
, A.PARAMETER1, A.PARAMETER3, A.PARAMETER4, A.PARAMETER5,A.PERFECT_STORE_LEVEL
, A.A0, A.A1, A.A2, A.A3, A.A4, A.A5, A.A6, A.A7, A.A8, A.A9
)),0) EPOP_ID
,  A.COMPANY,A.DISTRIBUTOR,A.TOWN
, CAST(ISNULL('','') AS VARCHAR(3)) LOCALITY
, CAST(ISNULL('','') AS VARCHAR(3)) SLOCALITY
, CAST(ISNULL('','') AS VARCHAR(3)) POP
, A.LSM, A.POPTYPE, a.master_channel, a.channel, a.sub_channel, a.element, A.SUB_ELEMENT
, A.COMPANY_RANK, A.RANK, A.DISTRICT, A.STRATA, A.PROVINCE, A.GEO_CODE, A.GEO_LEVEL1, A.GEO_LEVEL2, A.GEO_LEVEL3 
, A.GEO_LEVEL4, A.GEO_LEVEL5, A.GEO_LEVEL6, A.GEO_LEVEL7, A.GEO_LEVEL8, A.GEO_LEVEL9
, A.PARAMETER1, A.PARAMETER3, A.PARAMETER4, A.PARAMETER5,A.PERFECT_STORE_LEVEL
, A.A0, A.A1, A.A2, A.A3, A.A4, A.A5, A.A6, A.A7, A.A8, A.A9
INTO #TEMP_ePOP_ATR
FROM #TEMP_POP_ATR A
GROUP BY  A.COMPANY,A.DISTRIBUTOR,A.TOWN
, A.LSM, A.POPTYPE, a.master_channel, a.channel, a.sub_channel, a.element, A.SUB_ELEMENT
, A.COMPANY_RANK, A.RANK, A.DISTRICT, A.STRATA, A.PROVINCE, A.GEO_CODE, A.GEO_LEVEL1, A.GEO_LEVEL2, A.GEO_LEVEL3 
, A.GEO_LEVEL4, A.GEO_LEVEL5, A.GEO_LEVEL6, A.GEO_LEVEL7, A.GEO_LEVEL8, A.GEO_LEVEL9
, A.PARAMETER1, A.PARAMETER3, A.PARAMETER4, A.PARAMETER5,A.PERFECT_STORE_LEVEL
, A.A0, A.A1, A.A2, A.A3, A.A4, A.A5, A.A6, A.A7, A.A8, A.A9

ALTER TABLE #TEMP_ePOP_ATR ADD PRIMARY KEY (EPOP_ID);

SELECT IDENTITY(BIGINT, 1, 1) ID ,ISNULL(CAST('' AS VARCHAR(max)),'') MP_CODE
, ISNULL(CAST('' AS VARCHAR(5)),'') SEQ_ID
, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP,LSM,POPTYPE
, master_channel, channel, sub_channel, element
,SUB_ELEMENT,COMPANY_RANK,RANK,DISTRICT,STRATA,PROVINCE
, GEO_CODE,GEO_LEVEL1, GEO_LEVEL2, GEO_LEVEL3, GEO_LEVEL4, GEO_LEVEL5, GEO_LEVEL6, GEO_LEVEL7, GEO_LEVEL8, GEO_LEVEL9
, PARAMETER1
, PARAMETER3, PARAMETER4, PARAMETER5,PERFECT_STORE_LEVEL
, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9
INTO #TEMP_SCH_POP
FROM #TEMP_POP_ATR 
WHERE 1= 2;

ALTER TABLE #TEMP_SCH_POP ADD PRIMARY KEY (ID);

SELECT IDENTITY(BIGINT, 1, 1) ID ,ISNULL(CAST('' AS VARCHAR(max)),'') MP_CODE
, ISNULL(CAST('' AS VARCHAR(5)),'') SEQ_ID
, ISNULL(CAST('' AS VARCHAR(10)),'') COMPANY
, ISNULL(CAST('' AS VARCHAR(10)),'') DISTRIBUTOR
, SKU, MASTER_SKU, PROD1, PROD2, PROD3, PROD4, PROD5, PROD6, PROD7, PROD8, PROD9
, PARAMETER2
INTO #TEMP_SCH_SKU
FROM #TEMP_SKU_ATR 
WHERE 1= 2;



SELECT Distinct CT.COMPANY CM_COMPANY, CT.CASHMEMO_TYPE  
INTO #TEMP_CM_ATR
FROM CASHMEMO_TYPE CT  with (NOLOCK) 
  /*and CT.CASHMEMO_TYPE<>'06'*/;

ALTER TABLE #TEMP_CM_ATR ADD PRIMARY KEY (CM_COMPANY, CASHMEMO_TYPE);

SELECT IDENTITY(BIGINT, 1, 1) ID ,ISNULL(CAST('' AS VARCHAR(max)),'') MP_CODE
, ISNULL(CAST('' AS VARCHAR(5)),'') SEQ_ID
, ISNULL(CAST('' AS VARCHAR(10)),'') COMPANY
, ISNULL(CAST('' AS VARCHAR(10)),'') DISTRIBUTOR
, CASHMEMO_TYPE
INTO #TEMP_SCH_CM
FROM #TEMP_CM_ATR 
WHERE 1= 2;


DECLARE @PQRY VARCHAR(MAX), @SQRY VARCHAR(MAX), @CQRY VARCHAR(MAX)
SELECT @SQRY = '', @PQRY = '', @CQRY = ''
DECLARE CEXECQRY CURSOR FOR
SELECT 
  'INSERT INTO #TEMP_SCH_POP (MP_CODE,SEQ_ID
, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP,LSM,POPTYPE, MASTER_CHANNEL, CHANNEL, SUB_CHANNEL, ELEMENT,SUB_ELEMENT,COMPANY_RANK,RANK,DISTRICT,STRATA,PROVINCE
, GEO_CODE,GEO_LEVEL1, GEO_LEVEL2, GEO_LEVEL3, GEO_LEVEL4, GEO_LEVEL5, GEO_LEVEL6, GEO_LEVEL7, GEO_LEVEL8, GEO_LEVEL9
, PARAMETER1, PARAMETER3, PARAMETER4, PARAMETER5,PERFECT_STORE_LEVEL
, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9
) SELECT DISTINCT '''+ PS.PBS_MP_CODE +''' MP_CODE, '''+PS.PBS_SEQID+''' SEQ_ID
, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP,LSM,POPTYPE, MASTER_CHANNEL, CHANNEL, SUB_CHANNEL, ELEMENT,SUB_ELEMENT,COMPANY_RANK,RANK,DISTRICT,STRATA,PROVINCE
, GEO_CODE,GEO_LEVEL1, GEO_LEVEL2, GEO_LEVEL3, GEO_LEVEL4, GEO_LEVEL5, GEO_LEVEL6, GEO_LEVEL7, GEO_LEVEL8, GEO_LEVEL9
, PARAMETER1, PARAMETER3, PARAMETER4, PARAMETER5,PERFECT_STORE_LEVEL
, A0, A1, A2, A3, A4, A5, A6, A7, A8, A9
FROM ' +  CASE WHEN not(ps.pbs_mp_code = '015') AND REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(ISNULL(MV.VARIABLE_VALUE,''),'TOWN',''),'LOCALITY','') ,'SLOCALITY',''),'PROVINCE',''),'GEO_CODE',''),'GEO_LEVEL1',''),'GEO_LEVEL2',''),'GEO_LEVEL3',''),'GEO_LEVEL4',''),'GEO_LEVEL5',''),'GEO_LEVEL6',''),'GEO_LEVEL7',''),'GEO_LEVEL8',''),'GEO_LEVEL9',''),'A0',''),'A1',''),'A2',''),'A3',''),'A4',''),'A5',''),'A6',''),'A7',''),'A8',''),'A9',''),'PARAMETER1',''),'PARAMETER5',''),'PERFECT_STORE_LEVEL','')
= ISNULL(MV.VARIABLE_VALUE,'') THEN '#TEMP_EPOP_ATR' ELSE  '#TEMP_POP_ATR' END +  ' A INNER JOIN #TEMP_SKU_ATR B ON a.COMPANY = b.SKU_COMPANY WHERE '+
+ CASE PS.PBS_LEVEL 
                                WHEN '1' THEN 'PROD1'
                                WHEN '2' THEN 'PROD1+PROD2'
                                WHEN '3' THEN 'PROD1+PROD2+PROD3'
                                WHEN '4' THEN 'PROD1+PROD2+PROD3+PROD4'
                               WHEN '5' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5'
                                WHEN '6' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6'
                                WHEN '7' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7'
                                WHEN '8' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8'
                                WHEN '9' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8+PROD9'
                                WHEN 'S' THEN 'SKU'
                                WHEN 'M' THEN 'MASTER_SKU'
                                WHEN 'T' THEN ''''+PBS_CODE+''''
END +  ' = ''' +PS.PBS_CODE + '''' + CASE ISNULL(MV.VARIABLE_VALUE,'') WHEN '' THEN '' ELSE ' AND ' + MV.VARIABLE_VALUE END                         CRTP
,  'INSERT INTO #TEMP_SCH_SKU (MP_CODE,SEQ_ID, COMPANY, DISTRIBUTOR, SKU, MASTER_SKU, PROD1, PROD2, PROD3, PROD4, PROD5, PROD6, PROD7, PROD8, PROD9 , PARAMETER2) 
SELECT DISTINCT '''+ PS.PBS_MP_CODE +''' MP_CODE, '''+PS.PBS_SEQID+''' SEQ_ID
,SKU_COMPANY, DISTRIBUTOR, SKU, MASTER_SKU, PROD1, PROD2, PROD3, PROD4, PROD5, PROD6, PROD7, PROD8, PROD9, PARAMETER2
FROM #TEMP_POP_ATR A INNER JOIN #TEMP_SKU_ATR B ON a.COMPANY = b.SKU_COMPANY WHERE '+
+ CASE PS.PBS_LEVEL 
                                WHEN '1' THEN 'PROD1'
                                WHEN '2' THEN 'PROD1+PROD2'
                                WHEN '3' THEN 'PROD1+PROD2+PROD3'
                                WHEN '4' THEN 'PROD1+PROD2+PROD3+PROD4'
                                WHEN '5' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5'
                                WHEN '6' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6'
                                WHEN '7' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7'
                                WHEN '8' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8'
                                WHEN '9' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8+PROD9'
                                WHEN 'S' THEN 'SKU'
                                WHEN 'M' THEN 'MASTER_SKU'
                                WHEN 'T' THEN ''''+PBS_CODE+''''
END +  ' = ''' +PS.PBS_CODE + '''' + CASE ISNULL(MV.VARIABLE_VALUE,'') WHEN '' THEN '' ELSE ' AND ' + MV.VARIABLE_VALUE END                         CRTS 

,  cast('INSERT INTO #TEMP_SCH_CM (MP_CODE,SEQ_ID, COMPANY, DISTRIBUTOR,CASHMEMO_TYPE) 
SELECT DISTINCT '''+ PS.PBS_MP_CODE +''' MP_CODE, '''+PS.PBS_SEQID+''' SEQ_ID
,CM_COMPANY, DISTRIBUTOR, CASHMEMO_TYPE
FROM #TEMP_POP_ATR A inner join #temp_CM_ATR C on a.company = c.CM_COMPANY INNER JOIN #TEMP_SKU_ATR B ON a.COMPANY = b.sku_COMPANY WHERE   '
+ CASE PS.PBS_LEVEL 
                                WHEN '1' THEN 'PROD1'
                                WHEN '2' THEN 'PROD1+PROD2'
                                WHEN '3' THEN 'PROD1+PROD2+PROD3'
                                WHEN '4' THEN 'PROD1+PROD2+PROD3+PROD4'
                                WHEN '5' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5'
                                WHEN '6' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6'
                                WHEN '7' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7'
                                WHEN '8' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8'
                                WHEN '9' THEN 'PROD1+PROD2+PROD3+PROD4+PROD5+PROD6+PROD7+PROD8+PROD9'
                                WHEN 'S' THEN 'SKU'
                                WHEN 'M' THEN 'MASTER_SKU'
                                WHEN 'T' THEN ''''+PBS_CODE+''''
END +  ' = ''' +PS.PBS_CODE + '''' 
+ CASE cast(ISNULL(MV.VARIABLE_VALUE,'')  as varchar(max))  WHEN '' THEN '' ELSE ' AND ' + cast(MV.VARIABLE_VALUE  as varchar(max)) END 
 as varchar(max))    CRTC

FROM PB_SETUP PS 
LEFT JOIN MEMORY_VARIABLE MV 
ON PS.COMPANY = MV.COMPANY AND PS.PBS_MP_CODE = MV.MAIN_PROCESS 
AND PS.pbs_seqid = MV.SEQ_ID 
AND MV.variable_name = 'WHERE_SUM'
where ps.pbs_period_to >= getdate()-15
;

OPEN CEXECQRY
FETCH NEXT FROM CEXECQRY INTO @PQRY, @SQRY, @CQRY
WHILE @@FETCH_STATUS = 0 
      BEGIN 
      
      EXEC (@PQRY)
      
      EXEC (@SQRY)
	        EXEC (@CQRY)
      SELECT @SQRY = '', @PQRY = '', @CQRY = ''
      FETCH NEXT FROM CEXECQRY INTO @PQRY, @SQRY, @CQRY
      END
CLOSE CEXECQRY;
DEALLOCATE CEXECQRY;





SELECT s.COMPANY, s.SKU, l.MP_CODE, l.SEQ_ID,l.SERIAL, l.QUANTITY_FR  
into #TEMP_SCHEME_LIMITS 
FROM  SCHEME_LIMITS l
cross join sku s WHERE l.QUANTITY_FR > 0 and 1=2;
declare @qry varchar(max) = ''
DECLARE cExecQry CURSOR FOR
SELECT 'insert into #TEMP_SCHEME_LIMITS (COMPANY,SKU, MP_CODE, SEQ_ID,SERIAL, QUANTITY_FR) SELECT COMPANY, SKU
,'''+mp_code+''' mp_code ,'''+seq_id+''' seq_id,'+cast(serial as varchar(6))+' serial,'+cast(quantity_fr as varchar(20))+' quantity_fr
FROM SKU WHERE '+condition from scheme_limits  WHERE QUANTITY_FR > 0
;
OPEN cExecQry
FETCH NEXT FROM cExecQry INTO @qry
WHILE @@FETCH_STATUS = 0 
      BEGIN 
      
      EXEC (@qry)
      SET @qry = ''
      FETCH NEXT FROM cExecQry INTO @qry
      END
CLOSE cExecQry ;
DEALLOCATE cExecQry;

--set nocount off;

WITH 
b as (select COMPANY,SKU, MP_CODE, SEQ_ID, max(QUANTITY_FR) QUANTITY_FR from  #TEMP_SCHEME_LIMITS group by COMPANY,SKU, MP_CODE, SEQ_ID )
,a as (
SELECT A.DISTRIBUTOR TenantCode, A.MP_CODE+'~'+A.SEQ_ID PromotionCode
,  'Q' GroupType, '' ProductHierarchyCode
, S.SKU ItemCode, case ps.SCHEME_ON_UNIT when 1 then s.SELL_UNIT1 when 2 then s.SELL_UNIT2 else  S.SELL_UNIT3 end UnitsOfMeasure
, case when isnull(s.regular,1) = 1 then '1' else '4' end  ItemTypeCode
, isnull(b.QUANTITY_FR,0) Quantity
FROM #TEMP_SCH_SKU A 
INNER JOIN SKU S ON s.COMPANY = a.COMPANY and S.SKU = A.SKU 
inner join pb_Setup ps on ps.company = a.company and ps.pbs_mp_code = a.mp_Code and ps.pbs_seqid = a.seq_id
and ps.pbs_period_to >= getdate()-15
LEFT JOIN b on a.COMPANY = b.COMPANY and a.MP_CODE = b.MP_CODE and a.SEQ_ID = b.SEQ_ID and a.SKU = b.SKU
WHERE right(a.mp_code,3) in ('001','006','007','016','017','009','008','018','019','015')
UNION ALL
SELECT A.DISTRIBUTOR TenantCode, A.MP_CODE+'~'+A.SEQ_ID PromotionCode
,  'A' GroupType, '' ProductHierarchyCode
, S.SKU ItemCode, case ps.SCHEME_ON_UNIT when 1 then s.SELL_UNIT1 when 2 then s.SELL_UNIT2 else  S.SELL_UNIT3 end UnitsOfMeasure
, case when isnull(s.regular,1) = 1 then '1' else '4' end  ItemTypeCode
, 0 Quantity
FROM #TEMP_SCH_SKU A INNER JOIN SKU S ON  a.COMPANY = s.COMPANY and S.SKU = A.SKU
inner join pb_Setup ps on ps.company = a.company and ps.pbs_mp_code = a.mp_Code and ps.pbs_seqid = a.seq_id
and ps.pbs_period_to >= getdate()-15
WHERE right(A.mp_code,3) in ('001','006','016','008','018','019','015')
UNION ALL 
SELECT a.DISTRIBUTOR TenantCode, A.MP_CODE+'~'+A.SEQ_ID PromotionCode
,  'A' GroupType, '' ProductHierarchyCode
, S.SKU ItemCode, S.SELL_UNIT3 UnitsOfMeasure
, case when isnull(s.regular,1) = 1 then '1' else '4' end  ItemTypeCode
, 0 Quantity
FROM #TEMP_SCH_SKU A INNER JOIN FIELD_COMB B ON a.COMPANY = b.COMPANY and A.MP_CODE = B.mp_code AND A.SEQ_ID = B.seq_id
INNER JOIN SKU S ON a.COMPANY = s.COMPANY and S.SKU = B.brand_product
WHERE right(A.mp_code,3) in ('007','009')
UNION all
SELECT a.DISTRIBUTOR TenantCode, A.MP_CODE+'~'+A.SEQ_ID PromotionCode
,  'A' GroupType, '' ProductHierarchyCode
, S.SKU ItemCode, S.SELL_UNIT3 UnitsOfMeasure
, case when isnull(s.regular,1) = 1 then '1' else '4' end  ItemTypeCode
, 0 Quantity
FROM #TEMP_SCH_SKU A INNER JOIN FIELD_COMB B ON a.COMPANY = b.COMPANY and A.MP_CODE = B.mp_code AND A.SEQ_ID = B.seq_id
inner join scheme_variant sv on sv.COMPANY = b.COMPANY and sv.mp_code = b.mp_code and sv.seq_id = b.seq_id and sv.serial_no = b.serial_no
INNER JOIN SKU S ON a.COMPANY = s.COMPANY and S.SKU = sv.sku
WHERE right(A.mp_code,3) in ('007','009')
), s AS (SELECT a.TenantCode, a.PromotionCode, a.GroupType
, case when @isCBU=1 and a.GroupType ='Q' then p.HierarchyCode else '' end ProductHierarchyCode
, case when @isCBU=1 and a.GroupType ='Q' then '' else a.ItemCode end ItemCode
, case when @isCBU=1 and a.GroupType ='Q' then '' else p.UnitsOfMeasure end UnitsOfMeasure
, case when @isCBU=1 and a.GroupType ='Q' then '' else a.ItemTypeCode end ItemTypeCode
, MAX(a.Quantity) Quantity
FROM a inner join ig_i_product p on a.tenantCode = p.tenantCode AND a.itemCode = p.itemCode 
AND case when @isCBU=1 and exists (Select 1 from IG_I_PromotionControl pc where pc.TenantCode = a.TenantCode and pc.PromotionCode = a.PromotionCode and pc.PromotionTypeCode In ('1','2') ) then '1' else a.UnitsOfMeasure end = case when @isCBU=1 and exists (Select 1 from IG_I_PromotionControl pc where pc.TenantCode = a.TenantCode and pc.PromotionCode = a.PromotionCode and pc.PromotionTypeCode In ('1','2') ) then '1' else p.UnitsOfMeasure end
AND  a.ItemTypeCode = p.ItemTypeCode
group by a.TenantCode, a.PromotionCode, a.GroupType
, case when @isCBU=1 and a.GroupType ='Q' then p.HierarchyCode else '' end 
, case when @isCBU=1 and a.GroupType ='Q' then '' else a.ItemCode end 
, case when @isCBU=1 and a.GroupType ='Q' then '' else p.UnitsOfMeasure end 
, case when @isCBU=1 and a.GroupType ='Q' then '' else a.ItemTypeCode end 
)

MERGE IG_I_PromotionGroup t
USING s on t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode and t.GroupType = s.GroupType and t.ProductHierarchyCode = s.ProductHierarchyCode
and t.ItemCode = s.ItemCode and t.UnitsOfMeasure = s.UnitsOfMeasure and t.ItemTypeCode = s.ItemTypeCode 
WHEN MATCHED  AND NOT (t.Quantity = s.Quantity)
THEN UPDATE SET t.Quantity = s.Quantity
, t.ETL_DateTime = getdate()
--WHEN NOT MATCHED BY SOURCE  AND NOT (t.PromotionCode like '%~015~%') THEN DELETE
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, GroupType, ProductHierarchyCode, ItemCode, UnitsOfMeasure, ItemTypeCode, Quantity,ETL_DateTime) 
      VALUES (s.TenantCode, s.PromotionCode, s.GroupType, s.ProductHierarchyCode, s.ItemCode, s.UnitsOfMeasure, s.ItemTypeCode, s.Quantity,getdate())
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

with L AS (
SELECT COMPANY, ZERO
,[1],[2],[3],[4],[5]
FROM (SELECT COMPANY,LEVEL_COUNT,CODE_WIDTH,REPLICATE('0',20) ZERO FROM CHANNEL_LEVEL_SETUP) PS 
PIVOT ( MIN(PS.CODE_WIDTH) FOR PS.LEVEL_COUNT IN ([1],[2],[3],[4],[5]) ) UP
),
s as (
SELECT DISTINCT a.DISTRIBUTOR TenantCode
, a.DISTRIBUTOR LocationCode
, CASE A.POP WHEN '' THEN '' ELSE A.TOWN+'~'+A.LOCALITY+'~'+A.SLOCALITY+'~'+A.POP END CustomerCode
, CASE A.POP WHEN '' THEN ISNULL(A.COMPANY_RANK,'') ELSE '' END CategoryCode1
, CASE A.POP WHEN '' THEN ISNULL(A.RANK,'') ELSE '' END CategoryCode2
, CASE A.POP WHEN '' THEN '' ELSE '' END CategoryCode3
, CASE A.POP WHEN '' THEN ISNULL(A.POPTYPE,'') ELSE '' END CategoryCode4
, CASE A.POP WHEN '' THEN ISNULL(A.PARAMETER3,'') ELSE '' END CategoryCode5
, CASE A.POP WHEN '' THEN '' ELSE '' END CategoryCode6
, CASE A.POP WHEN '' THEN ISNULL(A.LSM,'') ELSE '' END CategoryCode7
, CASE A.POP WHEN '' THEN ISNULL(A.STRATA,'') ELSE '' END CategoryCode8
, CASE A.POP WHEN '' THEN ISNULL(A.DISTRICT,'') ELSE '' END CategoryCode9
, CASE A.POP WHEN '' THEN SUBSTRING(RIGHT(l.zero+se.MASTER_CHANNEL,l.[1])+RIGHT(l.zero+se.CHANNEL,l.[2])+RIGHT(l.zero+se.SUB_CHANNEL,l.[3])+RIGHT(l.zero+se.ELEMENT,l.[4])+RIGHT(l.zero+se.SUB_ELEMENT,l.[5]),1,100) ELSE '' END CustomerHierarchyCode
, A.MP_CODE+'~'+A.SEQ_ID PromotionCode
, PS.pbs_period_fr StartDate
, PS.pbs_period_TO EndDate
, CASE PS.pbs_expire WHEN 1 THEN 0 ELSE 1 END ActiveIndicator
FROM #TEMP_SCH_POP A 
inner join l on l.company = a.company 
INNER JOIN PB_SETUP PS ON A.MP_CODE = PS.pbs_mp_code AND A.SEQ_ID = PS.pbs_seqid 
AND right(A.mp_code,3) in ('001','006','007','016','023','017','009','008','018','019','015')
and ps.pbs_period_to >= getdate()-15
LEFT JOIN SUB_ELEMENT SE ON A.SUB_ELEMENT = SE.SUB_ELEMENT
) 
MERGE IG_I_PromotionCustomer t 
USING s on s.TenantCode = t.TenantCode and s.LocationCode = t.LocationCode and s.CustomerCode = t.CustomerCode
and s.CategoryCode1 = t.CategoryCode1 and s.CategoryCode2 = t.CategoryCode2 and s.CategoryCode3 = t.CategoryCode3
and s.CategoryCode4 = t.CategoryCode4 and s.CategoryCode5 = t.CategoryCode5 and s.CategoryCode6 = t.CategoryCode6
and s.CategoryCode7 = t.CategoryCode7 and s.CategoryCode8 = t.CategoryCode8 and s.CategoryCode9 = t.CategoryCode9
and s.CustomerHierarchyCode = t.CustomerHierarchyCode and s.PromotionCode = t.PromotionCode
WHEN MATCHED  AND NOT (t.StartDate = s.StartDate and t.EndDate = s.EndDate and t.ActiveIndicator = s.ActiveIndicator)
THEN UPDATE SET t.StartDate = s.StartDate , t.EndDate = s.EndDate , t.ActiveIndicator = s.ActiveIndicator
, t.ETL_DateTime = getdate()
WHEN NOT MATCHED BY SOURCE  AND NOT (t.PromotionCode like '%~015~%') THEN DELETE
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, LocationCode, CustomerCode, CategoryCode1, CategoryCode2, CategoryCode3, CategoryCode4, CategoryCode5, CategoryCode6, CategoryCode7, CategoryCode8, CategoryCode9, CustomerHierarchyCode, PromotionCode, StartDate, EndDate, ActiveIndicator, ETL_DateTime) 
      VALUES (s.TenantCode, s.LocationCode, s.CustomerCode, s.CategoryCode1, s.CategoryCode2, s.CategoryCode3, s.CategoryCode4, s.CategoryCode5, s.CategoryCode6, s.CategoryCode7, s.CategoryCode8, s.CategoryCode9, s.CustomerHierarchyCode, s.PromotionCode, s.StartDate, s.EndDate, s.ActiveIndicator,getdate())
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;
select @step = @step + 1;
print @step;

if object_id('tempdb..#tempECustomer') is not null
drop table #tempECustomer;

with pex as (
select cm.company,cm.distributor, cm.town, cm.locality, cm.slocality, cm.pop, sd.Mp_Code, sd.Seq_Id
from cashmemo cm inner join 
(
select COMPANY, DISTRIBUTOR, DOCUMENT, SUB_DOCUMENT, DOC_NO, Mp_Code, Seq_Id
from scheme_discount
union all
select COMPANY, DISTRIBUTOR, DOCUMENT, SUB_DOCUMENT, DOC_NO, Mp_Code, Seq_Id
from SCHEME_SKU
) sd on cm.COMPANY = sd.COMPANY and cm.DISTRIBUTOR = sd.DISTRIBUTOR and cm.DOCUMENT = sd.DOCUMENT 
and cm.SUB_DOCUMENT = sd.SUB_DOCUMENT and cm.DOC_NO =sd.DOC_NO
and cm.VISIT_TYPE in ('01' , '02') and cm.SUB_DOCUMENT = '01' 
and not exists(select 1 from cashmemo sr where sr.company = cm.company and sd.distributor = cm.distributor
and sr.REF_DOCUMENT = cm.DOCUMENT and sr.REF_SUB_DOCUMENT = cm.SUB_DOCUMENT and sr.REF_DOC_NO = cm.DOC_NO 
and sr.visit_type = '02' and sr.DOCUMENT = 'CM' and sr.SUB_DOCUMENT in ('02','04')and sr.CASHMEMO_TYPE = '19')
inner join pb_Setup ps on ps.company = sd.company and ps.pbs_mp_code = sd.Mp_Code and ps.pbs_seqid = sd.Seq_Id and isnull(ps.CM_COUNT,0) > 0 
and ps.pbs_period_to >= getdate()-15
and cast(GETDATE() as DATE) between ps.pbs_period_fr and ps.pbs_period_to and ps.pbs_expire = 0
group by cm.company,cm.distributor, cm.town, cm.locality, cm.slocality, cm.pop
,ps.CM_COUNT
, sd.Mp_Code, sd.Seq_Id
having count(distinct cm.DOC_NO) >= isnull(ps.CM_COUNT,0)
union all
SELECT COMPANY, COLUMN01 DISTRIBUTOR, COLUMN04 TOWN, COLUMN05 LOCALITY, COLUMN06 SLOCALITY, COLUMN07 POP, COLUMN08 MP_CODE, COLUMN09 SEQ_ID  FROM MIS_KPI_DATA WHERE FIELD_COMB = 'DISTRIBUTOR~YEAR~JC~TOWN~LOCALITY~SLOCALITY~POP~MP_CODE~SEQ_ID' AND COLUMN02 = @YEAR AND COLUMN03 = @JCNO AND COLUMN08 IN ('018','019') AND KPI_RETURN_DESC = 'N'
)
select pc.TenantCode, pc.LocationCode, pc.PromotionCode, pc.CustomerCode
, pc.CategoryCode1, pc.CategoryCode2, pc.CategoryCode3, pc.CategoryCode4, pc.CategoryCode5
, pc.CategoryCode6, pc.CategoryCode7, pc.CategoryCode8, pc.CategoryCode9, pc.CustomerHierarchyCode
, c.CustomerCode eCustomerCode
into #tempECustomer
from pex p inner join IG_I_Customer c on c.TenantCode = p.DISTRIBUTOR and c.LocationCode = p.DISTRIBUTOR 
and c.CustomerCode = p.TOWN+'~'+p.LOCALITY+'~'+p.SLOCALITY+'~'+p.POP
inner join IG_I_PromotionCustomer pc on  pc.TenantCode = c.TenantCode and pc.LocationCode = c.LocationCode 
and pc.PromotionCode = p.Mp_Code + '~' + p.Seq_Id and (
pc.CustomerCode = c.CustomerCode or 
( pc.CustomerCode = ''
and pc.CategoryCode1 = c.CategoryCode1 
and pc.CategoryCode2 = c.CategoryCode2 
and pc.CategoryCode4 = c.CategoryCode4 
and pc.CategoryCode5 = c.CategoryCode5 
and pc.CategoryCode7 = c.CategoryCode7 
and pc.CategoryCode8 = c.CategoryCode8 
and pc.CategoryCode9 = c.CategoryCode9 
and pc.CustomerHierarchyCode = c.HierarchyCode
)
);


with c2 as (
select TenantCode, LocationCode, CustomerCode, CategoryCode1, CategoryCode2, CategoryCode3, CategoryCode4, CategoryCode5, CategoryCode6, CategoryCode7, CategoryCode8, CategoryCode9, CustomerHierarchyCode, PromotionCode
, stuff((select (', '+c2.eCustomerCode) from #tempECustomer c2 where c1.TenantCode = c2.TenantCode and c1.LocationCode = c2.LocationCode and c1.CustomerCode = c2.CustomerCode and c1.promotionCode = c2.promotionCode
and c1.CategoryCode1 = c2.CategoryCode1 
and c1.CategoryCode2 = c2.CategoryCode2
and c1.CategoryCode3 = c2.CategoryCode3
and c1.CategoryCode4 = c2.CategoryCode4
and c1.CategoryCode5 = c2.CategoryCode5
and c1.CategoryCode6 = c2.CategoryCode6
and c1.CategoryCode7 = c2.CategoryCode7
and c1.CategoryCode8 = c2.CategoryCode8
and c1.CategoryCode9 = c2.CategoryCode9
and c1.CustomerHierarchyCode = c2.CustomerHierarchyCode
for XML path('')),1,1,'') ExclusionCustomerCodes
from #tempECustomer c1
group by TenantCode, LocationCode, CustomerCode, CategoryCode1, CategoryCode2, CategoryCode3, CategoryCode4, CategoryCode5, CategoryCode6, CategoryCode7, CategoryCode8, CategoryCode9, CustomerHierarchyCode, PromotionCode
)
update c1 set c1.ExclusionCustomerCodes = c2.ExclusionCustomerCodes
output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
from IG_I_PromotionCustomer c1 inner join c2 on 
c1.TenantCode = c2.TenantCode and c1.LocationCode = c2.LocationCode and c1.CustomerCode = c2.CustomerCode and c1.promotionCode = c2.promotionCode
and c1.CategoryCode1 = c2.CategoryCode1 
and c1.CategoryCode2 = c2.CategoryCode2
and c1.CategoryCode3 = c2.CategoryCode3
and c1.CategoryCode4 = c2.CategoryCode4
and c1.CategoryCode5 = c2.CategoryCode5
and c1.CategoryCode6 = c2.CategoryCode6
and c1.CategoryCode7 = c2.CategoryCode7
and c1.CategoryCode8 = c2.CategoryCode8
and c1.CategoryCode9 = c2.CategoryCode9
and c1.CustomerHierarchyCode = c2.CustomerHierarchyCode
and not (CHECKSUM(c1.ExclusionCustomerCodes) = CHECKSUM(c2.ExclusionCustomerCodes))
;

delete from IG_I_PromotionGroup where exists (Select 1 from IG_I_PromotionControl c where IG_I_PromotionGroup.TenantCode = c.TenantCode and IG_I_PromotionGroup.PromotionCode = c.PromotionCode and c.PromotionTypeCode = '6') and GroupType='A';
delete from IG_I_PromotionGroup where exists (Select 1 from IG_I_PromotionControl c where IG_I_PromotionGroup.TenantCode = c.TenantCode and IG_I_PromotionGroup.PromotionCode = c.PromotionCode and c.PromotionTypeCode = '6' and c.RangeBasis = 0) and GroupType='Q';
delete from IG_I_PromotionGroup where exists (Select 1 from IG_I_PromotionControl c where IG_I_PromotionGroup.TenantCode = c.TenantCode and IG_I_PromotionGroup.PromotionCode = c.PromotionCode and c.PromotionTypeCode = '6' and c.RangeBasis = 2 and c.ConditionType='DT');
delete from IG_I_PromotionGroup where exists (Select 1 from IG_I_PromotionControl c where IG_I_PromotionGroup.TenantCode = c.TenantCode and IG_I_PromotionGroup.PromotionCode = c.PromotionCode and c.PromotionTypeCode = '6' and c.RangeBasis = 2 and c.PromotionCode LIKE '015~%');

update pa set pa.RangeLow = 0, pa.RangeHigh = 0
from ig_i_promotionAssignment pa where exists (select 1 from ig_i_promotionControl pc where pc.tenantCode = pa.tenantCode and pc.promotionCode = pa.promotionCode and pc.rangeBasis = 0 and pc.PromotionTypeCode = 6);


--if columnproperty(object_id('ig_i_promotionCustomer'),'POP_SeqNo','ColumnId') is null
--alter table ig_i_promotionCustomer add POP_SeqNo int;
if columnproperty(object_id('ig_i_promotionCustomer'),'AWS','ColumnId') is null
alter table ig_i_promotionCustomer add AWS decimal(22,2);

if object_id('tempdb..#IG_I_PROMOTIONCONTROL') is not null drop table #IG_I_PROMOTIONCONTROL
SELECT PC.* into #IG_I_PROMOTIONCONTROL from ig_i_promotioncontrol pc  where PC.promotioncode  like '015~%' and not exists (Select 1 from ig_i_promotioncontrol a where a.TenantCode = pc.TenantCode and a.promotionCode like '%~015~%' and pc.PromotionCode = substring(a.promotionCode, charindex('~',a.promotionCode)+1, 50) );
if object_id('tempdb..#IG_I_PROMOTIONASSIGNMENT') is not null drop table #IG_I_PROMOTIONASSIGNMENT
SELECT PA.* into #IG_I_PROMOTIONASSIGNMENT from ig_i_promotionAssignment PA  where promotioncode  like '015~%' and exists (select 1 from #IG_I_PROMOTIONCONTROL a where a.TenantCode = pa.TenantCode and a.PromotionCode = pa.PromotionCode);
if object_id('tempdb..#IG_I_PROMOTIONGROUP') is not null drop table #IG_I_PROMOTIONGROUP
SELECT PG.* into #IG_I_PROMOTIONGROUP FROM ig_i_promotiongroup PG       where promotioncode  like '015~%' and exists (select 1 from #IG_I_PROMOTIONCONTROL a where a.TenantCode = pg.TenantCode and a.PromotionCode = pg.PromotionCode);
if object_id('tempdb..#IG_I_PROMOTIONCUSTOMER') is not null drop table #IG_I_PROMOTIONCUSTOMER
SELECT PC.* into #IG_I_PROMOTIONCUSTOMER 
from IG_I_PROMOTIONCUSTOMER PC    where promotioncode  like '015~%' and exists (select 1 from #IG_I_PROMOTIONCONTROL a where a.TenantCode = pc.TenantCode and a.PromotionCode = pc.PromotionCode);

select @step = @step + 1;
print @step;


update pc set pc.aws = a.aws 
from #IG_I_PROMOTIONCUSTOMER pc
inner join (
SELECT COMPANY, COLUMN02 DISTRIBUTOR, COLUMN03 TOWN, COLUMN04 LOCALITY, COLUMN05 SLOCALITY, COLUMN06 POP, COLUMN07 MP_CODE, COLUMN08 SEQ_ID , isnull(KPI_RETURN_VALUE,0) aws
FROM MIS_KPI_DATA WHERE FIELD_COMB= 'COMPANY~DISTRIBUTOR~TOWN~LOCALITY~SLOCALITY~POP~MP_CODE~SEQ_ID~AWS' AND COLUMN07 = '015'
) a on a.distributor = pc.tenantCode and a.town+'~'+a.locality+'~'+a.slocality + '~'+ a.POP = pc.customerCode and a.mp_code+'~'+a.seq_id = pc.promotionCode;

select @step = @step + 1;
print @step;


delete from #IG_I_PROMOTIONCUSTOMER where isnull(aws,0) = 0;
delete from #IG_I_PROMOTIONASSIGNMENT where not exists (select 1 from #IG_I_PROMOTIONCUSTOMER c where c.tenantCode = #IG_I_PROMOTIONASSIGNMENT.tenantCode and c.promotionCode = #IG_I_PROMOTIONASSIGNMENT.promotionCode) ;
delete from #IG_I_PROMOTIONGROUP where not exists (select 1 from #IG_I_PROMOTIONCUSTOMER c where c.tenantCode = #IG_I_PROMOTIONGROUP.tenantCode and c.promotionCode = #IG_I_PROMOTIONGROUP.promotionCode) ;
delete from #IG_I_PROMOTIONCONTROL where not exists (select 1 from #IG_I_PROMOTIONCUSTOMER c where c.tenantCode = #IG_I_PROMOTIONCONTROL.tenantCode  and c.promotionCode = #IG_I_PROMOTIONCONTROL.promotionCode) ;

select @step = @step + 1;
print @step;


--update pc set pc.POP_SeqNO = a.rn
--from #IG_I_PROMOTIONCUSTOMER pc
--inner join (
--select TenantCode, LocationCode, PromotionCode, CustomerCode, row_number()Over(partition by TenantCode, LocationCode, PromotionCode order by CustomerCode) rn
--from #IG_I_PROMOTIONCUSTOMER ) a on a.TenantCode = pc.TenantCode and a.LocationCode = pc.LocationCode and a.CustomerCode = pc.CustomerCode and a.PromotionCode = pc.PromotionCode;

select @step = @step + 1;
print @step;

with s as(
select PC.TenantCode,LEN(( REPLACE(PCus.CustomerCode,'~','') +'~'+PC.PromotionCode))l, ( REPLACE(PCus.CustomerCode,'~','') +'~'+PC.PromotionCode) PromotionCode, PC.PromotionDescription, PC.PromotionRemarks, PC.PromotionTypeCode, PC.RangeBasis, PC.AmountBasis, PC.ExclusionOption, PC.PromotionIndicator,
       PC.ConditionType, PC.PromotionProductLevel, PC.ProRata, PC.AllowPromotionQuota, PC.PromotionQuotaCode, PC.PromotionQuota, PC.ETL_DateTime, PC.MinimumSKU 
       from #IG_I_PROMOTIONCUSTOMER PCus
inner join  #IG_I_PROMOTIONCONTROL PC on PCus.TenantCode=PC.TenantCode AND PCus.promotioncode=PC.promotioncode 
)
MERGE IG_I_PromotionControl t
USING s ON t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode
WHEN MATCHED  AND NOT (checksum(t.PromotionDescription) = checksum(s.PromotionDescription) AND checksum(t.PromotionRemarks) = checksum(s.PromotionRemarks) AND checksum(t.PromotionTypeCode) = checksum(s.PromotionTypeCode) 
AND checksum(t.RangeBasis) = checksum(s.RangeBasis) AND checksum(t.AmountBasis) = checksum(s.AmountBasis) AND checksum(t.ExclusionOption) = checksum(s.ExclusionOption) AND checksum(t.PromotionIndicator) = checksum(s.PromotionIndicator
) AND checksum(t.PromotionProductLevel) = checksum(s.PromotionProductLevel) AND checksum(t.AllowPromotionQuota) = checksum(s.AllowPromotionQuota) AND checksum(t.MinimumSKU) = checksum(s.MinimumSKU) AND checksum(t.Conditiontype) = checksum(s.Conditiontype))
THEN UPDATE SET t.PromotionDescription = s.PromotionDescription, t.PromotionRemarks = s.PromotionRemarks, t.PromotionTypeCode = s.PromotionTypeCode
, t.RangeBasis = s.RangeBasis, t.AmountBasis = s.AmountBasis, t.ExclusionOption = s.ExclusionOption, t.PromotionIndicator = s.PromotionIndicator
, t.PromotionProductLevel = s.PromotionProductLevel, t.AllowPromotionQuota = s.AllowPromotionQuota 
, t.MinimumSKU=s.MinimumSKU
, t.Conditiontype=s.Conditiontype
,t.ETL_DateTime=getdate()
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, PromotionDescription, PromotionRemarks, PromotionTypeCode, RangeBasis, AmountBasis, ExclusionOption, PromotionIndicator, PromotionProductLevel, AllowPromotionQuota,ETL_DateTime,MinimumSKU,Conditiontype) 
      VALUES (s.TenantCode, s.PromotionCode, s.PromotionDescription, s.PromotionRemarks, s.PromotionTypeCode, s.RangeBasis, s.AmountBasis, s.ExclusionOption, s.PromotionIndicator, s.PromotionProductLevel, s.AllowPromotionQuota,getdate(),s.MinimumSKU,s.Conditiontype)
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

select @step = @step + 1;
print @step;


with s as(
select pa.TenantCode, (REPLACE(PCus.CustomerCode,'~','')+'~'+pa.PromotionCode) PromotionCode
, PCus.AWS +  (PCus.AWS * pa.RangeLow / 100) RangeLow
, PCus.AWS +  (PCus.AWS * pa.RangeHigh / 100) RangeHigh
, pa.RepeatingRange, pa.PromotionAmount, pa.SlabNumber, pa.ETL_DateTime
from #IG_I_PROMOTIONCUSTOMER PCus
inner join  #IG_I_PromotionAssignment pa on PCus.TenantCode=pa.TenantCode AND PCus.promotioncode=pa.promotioncode
)
MERGE IG_I_PromotionAssignment t
USING s ON t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode and t.RangeLow = s.RangeLow
WHEN MATCHED  AND NOT (checksum(t.RangeLow) = checksum(s.RangeLow) AND checksum(t.RangeHigh) = checksum(s.RangeHigh) AND checksum(t.RepeatingRange) = checksum(s.RepeatingRange) 
AND checksum(t.PromotionAmount) = checksum(s.PromotionAmount) AND checksum(t.SlabNumber) = checksum(s.SlabNumber) )
THEN UPDATE SET t.RangeLow = s.RangeLow, t.RangeHigh = s.RangeHigh, t.RepeatingRange = s.RepeatingRange
, t.PromotionAmount = s.PromotionAmount, t.SlabNumber = s.SlabNumber
,t.ETL_DateTime=getdate()
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, RangeLow, RangeHigh, RepeatingRange, PromotionAmount, SlabNumber, ETL_DateTime) 
      VALUES (s.TenantCode, s.PromotionCode, s.RangeLow, s.RangeHigh, s.RepeatingRange, s.PromotionAmount, s.SlabNumber, getdate())
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

select @step = @step + 1;
print @step;

/*
with s as(
select pg.TenantCode, (cast(pcus.POP_SeqNO as varchar)+'~'+pg.PromotionCode) PromotionCode
, pg.GroupType, pg.ProductHierarchyCode, pg.ItemCode, pg.UnitsOfMeasure, pg.ItemTypeCode, pg.Quantity, pg.ETL_DateTime
from #IG_I_PROMOTIONCUSTOMER PCus
inner join  #IG_I_PromotionGroup pg on PCus.TenantCode=pg.TenantCode AND PCus.promotioncode=pg.promotioncode 
)
MERGE IG_I_PromotionGroup t
USING s ON t.TenantCode = s.TenantCode and t.PromotionCode = s.PromotionCode and t.GroupType = s.GroupType and t.ProductHierarchyCode = s.ProductHierarchyCode
and t.ItemCode = s.ItemCode and t.UnitsOfMeasure = s.UnitsOfMeasure and t.ItemTypeCode = s.ItemTypeCode
WHEN MATCHED  AND NOT (checksum(t.Quantity) = checksum(s.Quantity) )
THEN UPDATE SET t.Quantity = s.Quantity
,t.ETL_DateTime=getdate()
WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, PromotionCode, GroupType, ProductHierarchyCode, ItemCode, UnitsOfMeasure, ItemTypeCode, Quantity, ETL_DateTime) 
      VALUES (s.TenantCode, s.PromotionCode, s.GroupType, s.ProductHierarchyCode, s.ItemCode, s.UnitsOfMeasure, s.ItemTypeCode, s.Quantity, getdate())
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

*/

insert into IG_I_PromotionGroup (TenantCode, PromotionCode, GroupType, ProductHierarchyCode, ItemCode, UnitsOfMeasure, ItemTypeCode, Quantity, ETL_DateTime) 
select pg.TenantCode, (REPLACE(PCus.CustomerCode,'~','')+'~'+pg.PromotionCode) PromotionCode
, pg.GroupType, pg.ProductHierarchyCode, pg.ItemCode, pg.UnitsOfMeasure, pg.ItemTypeCode, pg.Quantity, pg.ETL_DateTime
from #IG_I_PROMOTIONCUSTOMER PCus
inner join  #IG_I_PromotionGroup pg on PCus.TenantCode=pg.TenantCode AND PCus.promotioncode=pg.promotioncode 


select @step = @step + 1;
print @step;

update pc set  
  pc.startDate = isnull(a.startDate,pc.startDate)
, pc.EndDate = isnull(a.EndDate,pc.EndDate)
, pc.ActiveIndicator =  isnull(a.ActiveIndicator,0) 
output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
from IG_I_PromotionCustomer pc 
left join IG_I_PromotionCustomer a on pc.tenantCode = a.tenantCode and a.promotionCode like '015~%' 
and a.promotionCode  = substring(pc.promotionCode, charindex('~',pc.promotionCode)+1, 50)
and a.CustomerCode = pc.CustomerCode
where pc.promotionCode like  '%~015~%'
and not (
checksum(pc.startDate) = checksum(isnull(a.startDate,pc.startDate))
and checksum(pc.EndDate) = checksum(isnull(a.EndDate,pc.EndDate))
and checksum(pc.ActiveIndicator) = checksum(isnull(a.ActiveIndicator,0))
);

select @step = @step + 1;
print @step;

with s as(
select PCus.TenantCode, PCus.LocationCode, PCus.CustomerCode, PCus.CategoryCode1, PCus.CategoryCode2, PCus.CategoryCode3, PCus.CategoryCode4
, PCus.CategoryCode5, PCus.CategoryCode6, PCus.CategoryCode7, PCus.CategoryCode8, PCus.CategoryCode9, PCus.CustomerHierarchyCode
, PCus.ExclusionCustomerCodes, PCus.SequenceNumber, (REPLACE(PCus.CustomerCode,'~','')+'~'+pcus.PromotionCode) PromotionCode, PCus.StartDate, PCus.EndDate, PCus.ActiveIndicator, PCus.ETL_DateTime, PCus.AWS
from #IG_I_PROMOTIONCUSTOMER PCus
)
MERGE IG_I_PromotionCustomer t
USING s ON t.TenantCode = s.TenantCode and t.locationCode = s.locationCode 
and t.CustomerCode = s.CustomerCode
and t.CategoryCode1 = s.CategoryCode1
and t.CategoryCode2 = s.CategoryCode2
and t.CategoryCode3 = s.CategoryCode3
and t.CategoryCode4 = s.CategoryCode4
and t.CategoryCode5 = s.CategoryCode5
and t.CategoryCode6 = s.CategoryCode6
and t.CategoryCode7 = s.CategoryCode7
and t.CategoryCode8 = s.CategoryCode8
and t.CategoryCode9 = s.CategoryCode9
and t.CustomerHierarchyCode = s.CustomerHierarchyCode
and t.PromotionCode = s.PromotionCode
WHEN MATCHED  AND NOT (checksum(t.ExclusionCustomerCodes) = checksum(s.ExclusionCustomerCodes) AND checksum(t.SequenceNumber) = checksum(s.SequenceNumber) AND checksum(t.StartDate) = checksum(s.StartDate) 
AND checksum(t.EndDate) = checksum(s.EndDate) AND checksum(t.ActiveIndicator) = checksum(s.ActiveIndicator)
AND checksum(t.AWS) = checksum(s.AWS))
THEN UPDATE SET t.ExclusionCustomerCodes = s.ExclusionCustomerCodes, t.SequenceNumber = s.SequenceNumber, t.StartDate = s.StartDate
, t.EndDate = s.EndDate, t.ActiveIndicator = s.ActiveIndicator
,t.ETL_DateTime=getdate()
--, t.POP_SeqNo = s.POP_SeqNo
, t.AWS = s.AWS

WHEN NOT MATCHED BY TARGET THEN
      INSERT (TenantCode, LocationCode, CustomerCode, CategoryCode1, CategoryCode2, CategoryCode3, CategoryCode4, CategoryCode5, CategoryCode6, CategoryCode7, CategoryCode8, CategoryCode9, CustomerHierarchyCode, ExclusionCustomerCodes, SequenceNumber, PromotionCode, StartDate, EndDate, ActiveIndicator, ETL_DateTime, AWS) 
      VALUES (s.TenantCode, s.LocationCode, s.CustomerCode, s.CategoryCode1, s.CategoryCode2, s.CategoryCode3, s.CategoryCode4, s.CategoryCode5, s.CategoryCode6, s.CategoryCode7, s.CategoryCode8, s.CategoryCode9, s.CustomerHierarchyCode, s.ExclusionCustomerCodes, s.SequenceNumber, s.PromotionCode, s.StartDate, s.EndDate, s.ActiveIndicator, getdate(), s.AWS)
      output inserted.TenantCode, inserted.PromotionCode into #PromotionCode
;

select @step = @step + 1;
print @step;


delete from IG_I_PromotionControl where PromotionCode like '015~%';
 

 

 
 


select @step = @step + 1;
print @step;


update t set ETL_DateTime = GETDATE() from IG_I_PromotionControl t where exists (Select 1 from #PromotionCode s where s.TenantCode = t.TenantCode and s.PromotionCode = t.PromotionCode);

select @step = @step + 1;
print @step;

/*
update c set ETL_DateTime = '1900-01-01'
from IG_I_PromotionControl c
where exists (select 1 from IG_I_PromotionCustomer pc where c.TenantCode = pc.tenantCode and c.PromotionCode = pc.PromotionCode 
and pc.EndDate <= convert(date,GETDATE())
);*/

select @step = @step + 1;
print @step;


delete from IG_I_PromotionControl where not exists (Select 1 from IG_I_PromotionCustomer pc where pc.TenantCode = IG_I_PromotionControl.TenantCode and pc.PromotionCode = IG_I_PromotionControl.PromotionCode);



select @step = @step + 1;
print @step;


delete from IG_I_PromotionGroup where not exists (Select 1 from IG_I_PromotionControl pc where pc.TenantCode = IG_I_PromotionGroup.TenantCode and pc.PromotionCode = IG_I_PromotionGroup.PromotionCode);
delete from IG_I_PromotionAssignment where not exists (Select 1 from IG_I_PromotionControl pc where pc.TenantCode = IG_I_PromotionAssignment.TenantCode and pc.PromotionCode = IG_I_PromotionAssignment.PromotionCode);
delete from IG_I_PromotionCustomer where not exists (Select 1 from IG_I_PromotionControl pc where pc.TenantCode = IG_I_PromotionCustomer.TenantCode and pc.PromotionCode = IG_I_PromotionCustomer.PromotionCode);


select @step = @step + 1;
print @step;


with CT as (
Select Mp_code,Seq_ID ,count(1) T From #TEMP_SCH_CM where Cashmemo_Type in ('01','05','06') group by Mp_code,Seq_ID
)
select Distinct 
 ct.MP_CODE +'~'+cast(ct.SEQ_ID as varchar) PromotionCode,
 Case when t=1 and c.Cashmemo_Type='01' then 1 when c.Cashmemo_Type='06' then 1  when t=1 and c.Cashmemo_Type='05' then 2   else 0 end Application_type 
INto #PromoFilter
from CT inner Join #TEMP_SCH_CM c on ct.Mp_code=c.Mp_code and ct.Seq_ID =c.Seq_ID
where c.Cashmemo_Type in ('01','05','06');

update c set c.ApplicationType = p.Application_type
from IG_I_PromotionControl c
inner Join  #PromoFilter p on c.PromotionCode=p.PromotionCode
 
 ;



DROP TABLE #TEMP_SCH_POP;
DROP TABLE #TEMP_SCH_sku;
DROP TABLE #TEMP_POP_ATR;
DROP TABLE #TEMP_EPOP_ATR;
DROP TABLE #TEMP_SKU_ATR;
DROP TABLE #TEMP_SCHEME_LIMITS;

delete from IG_I_PromotionControl where PromotionCode like '015~%';
delete from IG_I_PromotionAssignment where PromotionCode like '015~%';
delete from IG_I_PromotionGroup where PromotionCode like '015~%';
delete from IG_I_PromotionCustomer where PromotionCode like '015~%';




select  PBS_MP_CODE+'~'+ PBS_SEQID PromotionCode into #PromoExpire from pb_setup where pbs_period_to >= getdate()-15 and pbs_expire = 1;


UPDATE PC SET PC.ACTIVEINDICATOR =0   ,PC.ETL_DATETIME=GETDATE()
FROM  IG_I_PROMOTIONCUSTOMER PC WHERE EXISTS( SELECT 1 FROM PB_SETUP PB WHERE PB.PBS_PERIOD_TO >= GETDATE()-15 AND PB.PBS_EXPIRE=1
 AND PB.PBS_MP_CODE ='015' AND PC.PROMOTIONCODE LIKE '%~'+PB.PBS_MP_CODE+'~'+PB.PBS_SEQID+''
AND NOT (PC.ACTIVEINDICATOR=CASE PB.PBS_EXPIRE WHEN 1 THEN 0 ELSE 1 END)
);


UPDATE PC SET PC.ETL_DATETIME=GETDATE()
FROM  IG_I_PROMOTIONCONTROL PC WHERE EXISTS( SELECT 1 FROM PB_SETUP PB WHERE PB.PBS_PERIOD_TO >= GETDATE()-15 AND PB.PBS_EXPIRE=1
 AND PB.PBS_MP_CODE ='015' AND PC.PROMOTIONCODE LIKE '%~'+PB.PBS_MP_CODE+'~'+PB.PBS_SEQID+''
);


  
update t set ETL_DateTime = GETDATE() from IG_I_PromotionControl t where   exists (Select 1 from #PromotionCode s where s.TenantCode = t.TenantCode and s.PromotionCode = t.PromotionCode);
update t set ETL_DateTime = GETDATE() from IG_I_PromotionControl t where  exists (Select 1 from #PromoExpire s where  s.PromotionCode = t.PromotionCode);
update t set t.ETL_DateTime = GETDATE(),t.ActiveIndicator=0 from IG_I_PromotionCustomer t where exists (Select 1 from #PromoExpire s where  s.PromotionCode = t.PromotionCode);