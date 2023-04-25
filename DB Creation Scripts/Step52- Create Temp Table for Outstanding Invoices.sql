if exists (select 1 from sysobjects where name = 'dl_ar' and xtype = 'U')
drop table dl_ar
go

create table dl_ar (
code nvarchar(255), 
name nvarchar(255), 
net float
)