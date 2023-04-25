
---Run this to deactivate POPs that aren't in any permanent section----

--Update pop set active=0 where town+locality+slocality+pop not in (select town+locality+slocality+pop 
--from section_pop_permanent) AND ACTIVE = '1'


---Run this script to confirm number of POPS not in any permanent section------

select * from POP where town+locality+slocality+pop not in (select town+locality+slocality+pop 
from section_pop_permanent) AND ACTIVE = '1'


