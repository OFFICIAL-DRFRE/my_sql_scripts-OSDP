USE CENTEGY_SNDPRO_UET

update POP set 
MARKET_NAME = REPLACE(market_name, '	', ' ') ,
name = REPLACE(name, '	', ' ') ,
street = REPLACE(street, '	', ' ') 
where street like '%	%' or STREET like '%  %' or
		name like '%	%' or name like '%  %' OR
		street like '%	%' or STREET like '%  %'
