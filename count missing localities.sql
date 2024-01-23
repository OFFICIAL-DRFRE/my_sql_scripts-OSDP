use Centegy_SnDPro_UET
go

Declare @t int = 175
Declare @l int = 1065
Declare @sl int = 3659

select (select name from distributor) DT_name, case when count(*)= @t  then cast( count(*) as varchar) +' - Match' else cast( count(*)-@t  as varchar)  + ' - missing Town'   end as Town from TOWN					
UNION
select (select name from distributor) DT_name, case when count(*)= @l  then cast( count(*) as varchar) +' - Match' else cast( count(*)-@l as varchar)   + '- missing locality'  end as Locality from LOCALITY			
UNION
select (select name from distributor) DT_name, case when count(*)= @sl then cast( count(*) as varchar) +' - Match' else cast( count(*)-@sl as varchar)  + '- missing sub locality' end as Sub_locality from SUB_LOCALITY	

