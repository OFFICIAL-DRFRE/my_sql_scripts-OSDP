delete from users where name not in
('System Administrator','Promotion Sales Ops Team','CD Ops Assis.','LE Support')
and DESIGNATION <>'01'
go

DECLARE @comp_code VARCHAR(2)
DECLARE @dist_code VARCHAR(10)

SET @comp_code = (select top 1 company from company)
SET @dist_code = (select top 1 DISTRIBUTOR from DISTRIBUTOR)
insert into users
select distinct @comp_code as Company,
@dist_code as Distributor,
dl.[User_ID] as [User_ID],
d.DESIGNATION as Designation,
dl.name as NAme,
NULL as Password,
'1' as status,
(select working_date from DISTRIBUTOR where DISTRIBUTOR=@dist_code) as Password_date,
dl.expiry_days as Expiry_days,
dl.expiry_alert as Expiry_alert,
dl.pass_width as Password_Width,
'4' as Password_Element,
'1' as Password_policy,
'1' as ischanged,
NULL as email,
'0' as Is_notifiable,
NULL as User_lang,
NULL as Row_Ver,
NULL as CELL_NO
from DL_Users dl join DESIGNATION d on dl.level=d.LDESC
where not exists (select 1 from USERS u where dl.[user_id]=u.USER_ID)

update u set u.expiry_days=dl.expiry_days, 
u.Expiry_alert =dl.expiry_alert,
u.Password_Width=dl.pass_width from USERS u join DL_Users dl on u.DISTRIBUTOR=dl.Distributor
and u.USER_ID=dl.User_ID and u.NAME=dl.Name join DESIGNATION d on dl.level=d.LDESC

---update User password----
update USERS set password=(select top 1 password from USERS where DESIGNATION='01')
where password is null