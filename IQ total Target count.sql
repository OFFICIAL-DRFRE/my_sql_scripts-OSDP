use centegy_sndpro_uet
Declare @iq_date date ='20230501'

select distinct moc_year, moc_no, 
(SELECT count(POP) FROM POP WHERE ACTIVE=1) AS 'TOTAL OUTLET',
(select count(DISTINCT up_code) from suggested_order where MOC_YEAR= year(@iq_date) and MOC_NO= Right('0'+ cast(month(@iq_date)as varchar),2) and color=1) as 'RL',
(select count(DISTINCT up_code) from suggested_order where MOC_YEAR= year(@iq_date) and MOC_NO= right('0'+ cast(month(@iq_date)as varchar),2) and PACKTYPE=1) as 'EB',
(select count(DISTINCT up_code) from suggested_order where MOC_YEAR= year(@iq_date) and MOC_NO= right('0'+ cast(month(@iq_date)as varchar),2) and LOCAL_PACKTYPE=1) as 'MHSKU',
(select count(DISTINCT up_code) from suggested_order where MOC_YEAR= year(@iq_date) and MOC_NO= right('0'+ cast(month(@iq_date)as varchar),2) and PACKTYPE=2) as 'WP',
(select count(DISTINCT up_code) from suggested_order where MOC_YEAR= year(@iq_date) and MOC_NO= right('0'+ cast(MONTH(@iq_date)as varchar),2) and PACKTYPE=5) as 'NPD'
from SUGGESTED_ORDER 
 where MOC_YEAR=year(@iq_date) and MOC_NO= Right('0'+ cast(month(@iq_date)as varchar),2)
