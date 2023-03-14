Declare @pjp varchar(4)='F001'
Declare @day varchar(4)='01'
Declare @pfrom varchar(10)='00000215'
Declare @pto   varchar(10)='00000260'

--update SECTION_POP_PERMANENT set POP_INDEX=null where pjp=@pjp and SECTION=@day
--Delete from SECTION_POP_PERMANENT where pjp=@pjp and SECTION=@day

insert into SECTION_POP_PERMANENT
(COMPANY,TOWN,LOCALITY,SLOCALITY,POP,DISTRIBUTOR,SELL_CATEGORY,STATUS_DAY,SECTION,PJP)
select '23',TOWN,LOCALITY,slocality,pop,DISTRIBUTOR,'001','99',@day,@pjp  from POP
where POP between @pfrom and @pto 

UPDATE P SET POP_Index = A.P FROM SECTION_POP_PERMANENT P INNER JOIN (
SELECT CAST(ROW_NUMBER()over(order BY COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP)+(select isNULL(MAX(pop_index),0) from SECTION_POP_PERMANENT where pjp=@pjp and Section=@day)  AS VARCHAR(5))P, COMPANY,DISTRIBUTOR,TOWN,LOCALITY,SLOCALITY,POP,PJP,SECTION FROM SECTION_POP_PERMANENT
WHERE POP_Index IS  NULL and PJP=@pjp and section=@day
) A ON A.COMPANY = P.COMPANY AND A.DISTRIBUTOR = P.DISTRIBUTOR AND A.TOWN = P.TOWN AND A.LOCALITY = P.LOCALITY AND A.SLOCALITY  = P.SLOCALITY AND A.POP = P.POP and a.PJP=p.PJP and a.SECTION=p.section
where p.PJP=@pjp and p.SECTION=@day

select * from SECTION_POP_PERMANENT where pjp=@pjp and SECTION=@day order by pop, pjp,section, POP_INDEX

--update SECTION_POP_PERMANENT set POP_INDEX=null where PJP=@pjp and section=@day
