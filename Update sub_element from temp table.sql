use centegy_sndpro_uet
go


/* -------------------------------------------
	Run this script to create the temp table.
   -------------------------------------------
*/
create table channel_fix(
pop_code varchar(22) primary key not null,
sub_element varchar(10) not null
)

/* -----------------------------------------------------
	Once you finish uploading the outlets with the 
	correct sub_element to the system. Run this script
   -----------------------------------------------------	
*/

update pop set 
	sub_element = cf.sub_element, 
	poptype = case 
				when cf.sub_element in ('C10554','C21111') then '02' 
				when cf.sub_element='C11629' then '04' else '01' 
				end 
from pop p
inner join dbo.channel_fix cf on cf.pop_code = p.town+locality+slocality+POP

/*----------------------------------------------------
	 Once you finish updating your Sub elements, 
	 run the below command to delete the temp table
  ----------------------------------------------------	
*/

-- Drop table channel_fix