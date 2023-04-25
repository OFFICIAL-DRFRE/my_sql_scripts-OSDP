select COUNT(*) as "Active Outlets" from pop where ACTIVE=1
Select COUNT(*) as "Number of outlets in section Pop permanent" from pop where pop in (select pop from SECTION_POP_PERMANENT)

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='B001' 

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='A005' 

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='OHS1'

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='new2'

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='A001'

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='A002'

select COUNT(*) as "total number of outlets sectioned in Dead PJPs" from SECTION_POP_PERMANENT where PJP='A006'

 /*count  by channel 
Select  s.ldesc,sp.PJP, ph.ldesc PJP, COUNT(*) as "Number of outlets in section Pop permanent" from SECTION_POP sp 
inner join PJP_HEAD ph on ph.pjp=sp.pjp
inner join pop p on p.town+p.locality+p.slocality+p.pop=sp.town+sp.LOCALITY+sp.SLOCALITY+sp.POP 
inner join sub_element s on p.SUB_ELEMENT=s.SUB_ELEMENT where s.ldesc like 'ph%'
group by sp.pjp,ph.LDESC, s.ldesc 
*/


--select sp.pjp,ph.LDESC,sp.POP,p.name,MARKET_NAME from SECTION_POP_PERMANENT  sp
--inner join pop p on p.POP=sp.POP --and p.ACTIVE=1
--inner join PJP_HEAD ph on ph.pjp=sp.pjp
--where sp.pop not in ( select pop from CASHMEMO where DOC_DATE between '20201001' and '20201031' and CASHMEMO_TYPE in ('01','02','03','04','18'))

-- select distinct pjp,POP_NAME,CASHMEMO_TYPE from CASHMEMO where DOC_DATE between '20201001' and '20201031' and CASHMEMO_TYPE <> '01' 
-- --and pjp='A005'  
-- --select * from SECTION_POP_PERMANENT
 