update POP set name=tp.name, PHONE_NO=tp.phone_no, MARKET_NAME=tp.market_name, STREET=tp.street from pop p
inner join temp_pop tp on p.town+p.locality+p.slocality+p.pop=tp.town+tp.locality+tp.slocality+tp.pop
