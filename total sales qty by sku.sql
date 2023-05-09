use CENTEGY_SNDPRO_UET

Declare @datefrom date = '20230501'
Declare @dateto   date = '20230507'
Declare @poptype varchar(2) ='02'

select cm.distributor 'KD Code' ,                                 --pt. LDESC poptype,
c.sku Sku_code, S.LDESC 'SKU Name' , 
 convert( int, sum( ((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))) 'Total in PC',
convert( float, round( sum( (((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3)))/s.SELL_FACTOR1 ) ,2)) 'Total in CS'
from CASHMEMO_DETAIL c
inner join sku s on s.sku = c.sku
inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
inner join pop p on p.pop =cm.pop
inner join POP_TYPE pt on pt.POPTYPE=p.poptype
inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
where cm.sub_document in ('01','02','04') and cm.document ='cm' and cm.visit_type = '02' and 
cm.Delv_date between @datefrom and @dateto
and s.ldesc like 'sun%5kg'
                                                                --and p.POPTYPE=@poptype
group by cm.DISTRIBUTOR, s.ldesc,c.SKU                          --,pt.LDESC
