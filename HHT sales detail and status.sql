use centegy_sndpro_uet
select sh.routecode PJP,ph.ldesc PJP_name, sh.documentprefix+'-'+cast(sh.documentnumber as varchar) doc_no,sh.customercode, p.name 'Outlet name', 
sequencenumber 'no.', itemcode 'sku code',s.ldesc 'SKU desc', itemquantity 'total in pcs', totallineamount 'total price',
case 
	when sh.process_status = 0 then 'not processed yet'
	when sh.process_status = 1 then 'Successful'
	when sh.process_status = 2 then 'Failed'
	when sh.process_status = 3 then 'Partial Success'
	when sh.process_status = 4 then 'Already Exists on System'
	else 'Status Unknown' end as Process_status,
sh.process_description from ig_o_salesorderheader sh 
inner join ig_o_salesorderdetail sd on sh.documentnumber=sd.documentnumber and sh.documentprefix=sd.documentprefix
inner join pop p on p.town+p.locality+p.slocality+p.pop = replace(sh.customercode, '~', '')
inner join pjp_head ph on ph.pjp= sh.routecode
inner join SKU s on s.sku =sd.itemcode
where 
--process_status > 4 --and
synckey in (
'9e88e03b-4a9b-4248-8b61-78c6b1613c7d',
'faa6177c-89f2-4ee5-b02c-e1f9af6e3085'
)