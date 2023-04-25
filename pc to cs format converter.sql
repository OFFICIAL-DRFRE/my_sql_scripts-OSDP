use centegy_sndpro_uet
Declare @q int=7662

select sku,batch,
cz= Isnull(floor(@q/NullIF(72,0)),0),
Dz=ISNULL(FLOOR((@q-(floor(@q/72)*72))/(Nullif(12,0))),0),
Pc = ISNULL( floor(@q-((floor(@q/NullIF(72,0))*72)+
(FLOOR((@q-(floor(@q/NullIF(72,0))*72))/(Nullif(12,0)))*12))) ,0)