use centegy_sndpro_uet

DECLARE @promo int = 582

select distinct
		p.PromotionCode, 
		p.PromotionDescription,
		pa.PromotionAmount 'Discount %', 
		convert(varchar, startdate, 23) as 'Start Date', 
		convert(varchar, EndDate,23) as 'End Date',  
		case
			when ActiveIndicator=1 then 'Yes'
			else 'No' 
		end as 'Active'
from IG_I_PromotionControl p
	inner join IG_I_PromotionCustomer pc on pc.PromotionCode = p.PromotionCode
	inner join ig_i_PromotionAssignment pa on pa.promotionCode = p.PromotionCode
where p.PromotionCode = '001~' + cast(@promo as varchar)  

