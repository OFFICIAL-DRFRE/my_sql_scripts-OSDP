SELECT        TOP (200) COMPANY, TOWN, LOCALITY, SLOCALITY, POP, DISTRIBUTOR, NAME, MARKET_NAME, STREET, PHONE_NO, 
                         SUB_ELEMENT, owner_name
FROM            POP
order by pop desc