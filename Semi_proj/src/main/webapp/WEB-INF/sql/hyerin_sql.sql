show user;

select * from tab;

select * from tbl_member 

create table tbl_member
(member_code    nvarchar2(30)   not null
,name           nvarchar2(30)   not null
,userid         nvarchar2(10)   not null
,pwd            varchar2(200)   not null
,email          varchar2(200)   not null
,phone_number   varchar2(200)   not null
,post_code      varchar2(5)   

);


select *
from user_constraints



select * from tab;

desc tbl_qna;

desc tbl_review;

select * from tbl_product


create sequence seq_productNo
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;





