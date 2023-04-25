select * from RtParameterDefinition where ParameterDescription like'%Duplicate%'

update RtLocationParameters set parametervalue=0 where ParameterID=245 and LocationId in (select locationID from RtLocationDetails)

update RtRouteParameters set ParameterValue=0 where parameterid=245 and RouteNumber in (select RouteNumber from RtRouteDetails)