use centegy_sndpro_uet
go

--Create a temporary pop table for the new Geo codes
if not exists ( select 1 from sys.tables where name = 'RTGeocode')
	Begin
		create table RTGeocode(
		distributor varchar(10),
		pop_code varchar(22),
		longitude numeric(16,8) not null,
		latitude numeric(16,8) not null,
		primary key (distributor, pop_code)
		)
		Print 'Table created successfully'
	end
	else
	begin
		print 'RTgeocode already exist'
	end

--insert the data into the RTGEOCode table

--Check before updating geo code
select x.pop_code,name,x.longitude,x.latitude, p.longitude, p.LATITUDE,
	round(dbo.distance(x.longitude, x.latitude,p.LONGITUDE,p.LATITUDE),0) distance, 
	convert(varchar, UPDATED_DATE, 23) Updated_date from pop p 
inner join RTGeocode x on x.pop_code = p.town+p.LOCALITY+p.SLOCALITY+p.POP and x.distributor=p.distributor
where x.longitude <> p.longitude

--update the geocode 
UPDATE POP SET LONGITUDE = x.longitude, LATITUDE = x.latitude,  UPDATED_DATE = cast(getdate() as date) from pop p
inner join RTGeocode x on x.pop_code = p.town+p.LOCALITY+p.SLOCALITY+p.POP and x.distributor=p.distributor
where x.longitude<>0

