select tp.*,p.name,p.MARKET_NAME,p.STREET,p.PHONE_NO,
case when (p.name=tp.name) then 'Match' else 'no Match' end as Name_validation,
case when (p.MARKET_NAME=tp.Market_name) then 'Match' else 'no Match' end as  market_validation,
 case when (p.STREET=tp.street) then 'Match' else 'no Match' end as street_validation,
 case when (p.PHONE_NO=tp.phone_no) then 'Match' else 'no Match' end as PHONE_NO_validation 
 from POP p
inner join excel_pop tp on tp.town+tp.locality+tp.slocality+tp.pop=p.TOWN+p.LOCALITY+p.SLOCALITY+p.pop