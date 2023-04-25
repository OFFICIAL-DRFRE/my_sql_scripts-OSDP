use centegy_sndpro_uet

select * from MIS_KPI_DATA where kpi_id in (select kpi_id from mis_kpi where field_group = '206')
and column02 = '2021' and column03 = '09'

select * from policy where field_group = '206' and date_to = '20210930'

select * from policy_detail where policy_id in (
select policy_id from POLICY_DETAIL where policy_id in (select POLICY_ID from policy where field_group='206')
and field_comb='YEAR~JCNO' and VALUE_COMB_FROM='2021~10'
)
and field_comb='DISTRIBUTOR' and VALUE_COMB_FROM='15274408'


