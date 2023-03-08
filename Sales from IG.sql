select RouteCode,sd.DocumentNumber, DocumentDate,sh.CustomerCode, CustomerName ItemCode, ldesc SKU, ItemQuantity , ' ', ' ', sh.Process_Status,Process_Description from IG_O_SalesOrderDetail sd
inner join IG_O_SalesOrderHeader sh on sh.DocumentNumber=sd.DocumentNumber and sh.DocumentPrefix=sd.DocumentPrefix
inner join IG_I_Customer c on c.CustomerCode=sh.CustomerCode and CustomerStatus = 1
inner join sku s on s.sku =sd.ItemCode
where RouteCode = 'A002' and sh.DocumentDate > '20221211' and Process_Status =4
order by DocumentDate, sh.DocumentNumber