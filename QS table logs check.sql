
select * from  qs_updated_version where synchronizer = (select Distributor from Distributor) and QS_TABLE_ID in (
Select qs_table_id from qs_table where qs_group_id in (
Select qs_group_id from qs_group where qs_parent_group_id ='0303'))

