use Centegy_SnDPro_UET
Declare @datefr date ='20230501'
Declare @dateto date ='20230531'

select distinct
			s.[KD Code],s.[KD Name],
			s.[Year],
			s.[Month] 'Month',
			format( sum([GSV]), 'N', 'en-us') GSV, 
			format( sum([Discount Amt]), 'N', 'en-us') discount,
			format( sum(s.gsv) + sum(s.[discount amt]), 'N', 'en-us') total
		from(
			select cm.distributor 'KD Code',d.NAME 'KD Name',CM.POP_NAME 'Outlet Name',
				SE.LDESC 'Channel Type',cm.town+cm.locality+cm.slocality+cm.POP 'POP_code', convert(varchar,cm.DOC_DATE,23) Doc_date, Cm.DOC_NO,year(cm.DOC_DATE) 'Year',
				 datename(month, cm.DOC_DATE)'Month',pj.pjp as  'pjp', ds.NAME AS DSR,S.LDESC 'SKU Name' ,c.sku,c.amount+c.GST 'GSV',
				((C.QTY1 * s.sell_factor1)+(QTY2 * s.sell_factor2)+(QTY3 * s.sell_factor3)) 'Number of pcs', isnull(sum(sd.discount+sd.gst),0) 'Discount Amt'
			from CASHMEMO_DETAIL c
				inner join sku s on s.sku = c.sku
				inner join CASHMEMO cm on cm.DOC_NO=c.DOC_NO
				inner join pop p on p.town+p.locality+p.slocality+p.pop = cm.town+cm.locality+cm.slocality+cm.pop and p.PERFECT_STORE_LEVEL='003'
				inner join SUB_ELEMENT SE on p.SUB_ELEMENT=SE.SUB_ELEMENT
				inner join distributor d on d.distributor=c.distributor
				inner join PJP_HEAD pj on pj.SELL_CATEGORY = cm.SELL_CATEGORY and pj.PJP = cm.PJP
				inner join DSR ds on pj.distributor = ds.distributor and pj.DSR = ds.DSR
				left join scheme_discount_detail sd on sd.doc_no=c.doc_no and sd.sku=c.sku
				where cm.sub_document in ('01','02','03','04') and cm.document ='cm'  and cm.visit_type='02'
				and cm.DOC_DATE between @datefr and @dateto 
				group by cm.distributor,d.NAME ,CM.POP_NAME ,
					SE.LDESC,cm.town+cm.locality+cm.slocality+cm.POP,cm.DOC_DATE, Cm.DOC_NO,year(cm.DOC_DATE),
					Month(cm.DOC_DATE),pj.pjp, ds.NAME,S.LDESC,c.sku,c.amount,
					((C.QTY1*s.sell_factor1)+(QTY2*s.sell_factor2)+(QTY3*s.sell_factor3))
		)s
	group by s.[KD Code], s.[KD Name], s.[Year], s.[Month]
	