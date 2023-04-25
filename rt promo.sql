

use XFULET

update RtCustomerPromotionMapping set ActiveIndicator=0 where PromotionPlanNumber in ( select PromotionPlanNumber
from RtPromotionControl where PromotionCode in ('001~311', '001~233', '001~298', '001~315','001~363' ,'001~347'
,'001~349','001~351','001~316','001~317','001~364'))