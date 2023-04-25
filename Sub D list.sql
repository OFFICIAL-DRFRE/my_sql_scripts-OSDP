use centegy_sndpro_uet
select T.LDESC TOWN, p.DISTRIBUTOR 'KD Code', d.NAME KD_Name,p.NAME [Outlet name],p.PHONE_NO,p.MARKET_NAME, se.ldesc 'Channel type',  convert(varchar, p.DATE_ENTRY,23) 'Date oF Entry', 
Month(p.date_entry) 'Month',year(P.date_entry) 'Year', case when p.ACTIVE=1 then 'Yes' else 'No' end as 'Active Status' from pop p
Inner Join TOWN T ON p.COMPANY=t.COMPANY and p.TOWN= T.TOWN
Inner Join SUB_ELEMENT se ON t.COMPANY=se.COMPANY and p.SUB_ELEMENT = se.SUB_ELEMENT
inner join Distributor d on d.COMPANY=p.COMPANY and d.DISTRIBUTOR=p.DISTRIBUTOR
where p.POPTYPE='04' and DATE_ENTRY between '20200101' and '20211231'

