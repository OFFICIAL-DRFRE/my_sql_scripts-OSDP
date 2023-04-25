--select count(*) from pop where active='1' and LATITUDE !='0'
select dsr='Zelalem', count(*) as 'total no. of outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='B001') 
select dsr='Zelalem', count(*) as 'geo coded outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='B001') and LONGITUDE != 0

select dsr='Leulseged', count(*) as 'total no. of outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='OHS1') 
select dsr='Leulseged', count(*) as 'geo coded outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='OHS1') and LONGITUDE != 0

select dsr='Serkalem', count(*) as 'total no. of outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='A001') 
select dsr='Serkalem', count(*) as 'geo coded outlets' from POP where pop in (select pop from SECTION_POP_PERMANENT where PJp='A001') and LONGITUDE != 0