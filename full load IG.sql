update ig_task set UnProcessDataSent=RESEND_ALL_DATA where RESEND_ALL_DATA is not NULL;
update ig_task set RESEND_ALL_DATA='1' where RESEND_ALL_DATA 01is not NULL;

update ig_task set RESEND_ALL_DATA= UnProcessDataSent where RESEND_ALL_DATA is not NULL;

