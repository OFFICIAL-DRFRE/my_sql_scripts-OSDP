
--- Product Hierarchy ---
update child_screen set SDESC = 'DIVISION' , LDESC = 'DIVISION' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '1'
update child_screen set SDESC = 'SUB DIVISION2' , LDESC = 'SUB DIVISION2' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '2'
update child_screen set SDESC = 'CATEGORY' , LDESC = 'CATEGORY' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '3'
update child_screen set SDESC = 'MARKET' , LDESC = 'MARKET' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '4'
update child_screen set SDESC = 'BRAND' , LDESC = 'BRAND' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '5'
update child_screen set SDESC = 'SECTOR' , LDESC = 'SECTOR' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '6'
update child_screen set SDESC = 'CORPORATE PRODUCT' , LDESC = 'CORPORATE PRODUCT' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '7'
update child_screen set SDESC = 'SUB BRAND' , LDESC = 'SUB BRAND' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '8'
update child_screen set SDESC = 'BASEPACK' , LDESC = 'BASEPACK' where Master_screen_id = '2' and Screen_id = '20' and child_Screen_id = '9'

--- Geo Hierarchy ---
update child_screen set SDESC = 'Country' , LDESC = 'Country' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '1'
update child_screen set SDESC = 'Province' , LDESC = 'Province' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '2'
update child_screen set SDESC = 'Town / City' , LDESC = 'Town / City' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '3'
update child_screen set SDESC = 'District' , LDESC = 'District' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '4'
update child_screen set SDESC = 'Village' , LDESC = 'Village' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '5'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '6'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '7'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '8'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '19' and child_Screen_id = '9'


--- Sales Hierarchy ---
update child_screen set SDESC = 'National' , LDESC = 'National' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '1'
update child_screen set SDESC = 'Region' , LDESC = 'Region' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '2'
update child_screen set SDESC = 'Area' , LDESC = 'Area' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '3'
update child_screen set SDESC = 'Distributor' , LDESC = 'Distributor' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '4'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '5'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '6'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '7'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '8'
update child_screen set INDEX_BY = '0' where Master_screen_id = '2' and Screen_id = '18' and child_Screen_id = '9'
