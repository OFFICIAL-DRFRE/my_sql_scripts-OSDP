select 'ETB	'+cast( REPLACE(CONVERT(varchar(20), (CAST(sum(PRICE_UNIT1) AS money)), 1), '.', ',')as varchar) from PRICE_STRUCTURE


select format(   sum(PRICE_UNIT1),'c','et-ET') from PRICE_STRUCTURE
