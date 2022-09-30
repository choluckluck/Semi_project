show user;
--USER이(가) "SEMI_ORAUSER3"입니다.


create table tbl_main_image
(imgno           number not null
,imgfilename     varchar2(100) not null
,title           Nvarchar2(20)
,imgcontent      Nvarchar2(100)
,constraint PK_tbl_main_image_imgno primary key(imgno)
);

creat table tbl_grade
(
);

create table tbl_member
(userid             Nvarchar2(10)   not null   -- 회원아이디
,name               Nvarchar2(30)   not null  -- 회원명
,pwd                varchar2(200)   not null  -- 비밀번호 (SHA-256 암호화 대상)
,email              varchar2(200)   not null  -- 이메일 (AES-256 암호화/복호화 대상)
,phone_number       varchar2(200)            -- 연락처 (AES-256 암호화/복호화 대상) 
,postcode           varchar2(5)              -- 우편번호
,address            varchar2(200)            -- 주소
,detailaddress      varchar2(200)            -- 상세주소
,extraaddress       varchar2(200)            -- 참고항목
,gender             varchar2(1)              -- 성별   남자:1  / 여자:2
,birthday           varchar2(10)             -- 생년월일 
,grade_code         Nvarchar2(30) not null   -- 등급코드
,point              number default 0         -- 적립금 
,account_name       varchar2(30)             -- 계좌번호 주인이름
,bank_name          varchar2(30)             -- 은행명
,account            number                   -- 계좌번호
,registerday        date default sysdate     -- 가입일자 
,last_pwd_change_date  date default sysdate     -- 마지막으로 암호를 변경한 날짜  
,status             number(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,idle               number(1) default 0 not null     -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint pk_tbl_member_userid primary key(userid)
,constraint uq_tbl_member_email  unique(email)
,constraint uq_tbl_member_phone_number unique(phone_number)
,constraint ck_tbl_member_gender check( gender in('1','2') )
,constraint ck_tbl_member_status check( status in(0,1) )
,constraint ck_tbl_member_idle check( idle in(0,1) )
);

--데이터넣기 

update tbl_member set userid = 'JHS';
                     
update tbl_member set userid = 'JHS', pwd = 1234, name='조하솔', email='hs@naver.com', phone_number='01012345678', postcode='12345'
                     ,address='서울', detailaddress='서울', extraaddress='서울', gender =1,  birthday='1234567' , account_name='조하솔'
                     ,bank_name ='국민', account='123456789', status=1;
                     
insert into tbl_member(userid, pwd, name, email, phone_number,  postcode, address, detailaddress,extraaddress, gender, birthday ,account_name, bank_name,account, grade_code ) 
values('JHS', 'qwer1234$', '조하솔', 'hs@naver.com', '01012345678' ,'12345', '서울', '서울' , '서울', '1', '1234567', '조하솔' , '국민', '123456789', '0');                     

insert into tbl_member(userid, pwd, name, email, phone_number,  postcode, address, detailaddress,extraaddress, gender, birthday ,account_name, bank_name,account, grade_code ) 
values('KSM', 'qwer1234$', '김성민', 'sm@naver.com', '010567890' ,'12345', '서울', '서울' , '서울', '1', '1234567', '김성민' , '신한', '123456789', 'welcome');                     

insert into tbl_member(userid, pwd, name, email, phone_number,  postcode, address, detailaddress,extraaddress, gender, birthday ,account_name, bank_name,account, grade_code ) 
values('KHJ', 'qwer1234$', '김혜준', 'hj@naver.com', '01056788' ,'12345', '서울', '서울' , '서울', '2', '1234567', '김혜준' , '신한', '123456789', 'welcome');                     
                           
              
commit;

alter table tbl_member ADD grade_code NVARCHAR2(30) default 0 not null; 

create table tbl_cart
(cart_code          Nvarchar2(30) not null    --장바구니 코드 
,fk_userid          Nvarchar2(30)  not null   -- 아이디
,fk_prod_code      Nvarchar2(30)  not null    -- 상품코드
,quantity           number                      -- 수량
,constraint FK_tbl_cart_fk_userid foreign key(fk_userid) references tbl_member(userid) 
,constraint FK_tbl_cart_fk_prod_code foreign key(fk_prod_code) references tbl_product(prod_code) 
);

ALTER TABLE tbl_cart ADD CONSTRAINT pk_tbl_cart_cart_code primary key(cart_code);

create sequence seq_cart_code
   start with 1         -- 첫번째 출발은 1 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
insert into tbl_member(cart_code, fk_userid, fk_prod_code, email, phone_number,  postcode, address, detailaddress,extraaddress, gender, birthday ,account_name, bank_name,account, grade_code ) 
values('KHJ', 'qwer1234$', '김혜준', 'hj@naver.com', '01056788' ,'12345', '서울', '서울' , '서울', '2', '1234567', '김혜준' , '신한', '123456789', 'welcome');                     
       
    
   
   

create table tbl_like
(like_code          Nvarchar2(30) not null    --관심상품 코드 
,fk_userid          Nvarchar2(30)  not null   -- 아이디
,fk_prod_code      Nvarchar2(30)  not null    -- 상품코드
,constraint pk_tbl_like_like_code primary key(like_code)
,constraint FK_tbl_like_fk_userid foreign key(fk_userid) references tbl_member(userid) 
,constraint FK_tbl_like_fk_prod_code foreign key(fk_prod_code) references tbl_product(prod_code) 
);

create table tbl_like
(like_code          Nvarchar2(30) not null    --장바구니 코드 
,fk_userid          Nvarchar2(30)  not null   -- 아이디
,fk_prod_code      Nvarchar2(30)  not null    -- 상품코드
,constraint pk_tbl_like_like_code primary key(like_code)
,constraint FK_tbl_like_fk_userid foreign key(fk_userid) references tbl_member(userid) 
,constraint FK_tbl_like_fk_prod_code foreign key(fk_prod_code) references tbl_product(prod_code) 
);

create table tbl_notice
(notice_code       Nvarchar2(30) not null    --공지게시판 글번호
,fk_userid         Nvarchar2(30)  not null    -- 아이디
,notice_subject    Nvarchar2(200) not null    --글제목
,notice_cotents    Nvarchar2(2000) not null    --글내용
,notice_registerday  date default sysdate    --작성일자
,notice_file_1      Nvarchar2(300)        --첨부파일1
,notice_file_2      Nvarchar2(300)               --첨부파일2
,notice_file_3      Nvarchar2(300)               --첨부파일3
,constraint pk_tbl_notice_notice_code  primary key(notice_code )
,constraint FK_tbl_notice_fk_userid foreign key(fk_userid) references tbl_member(userid) 
);


--테이블 조회
select *
from tbl_member;

select * from tab;

desc tbl_member;

--------------------




commit;

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'tbl_member';

select *
from user_constraints

create table tbl_return
(return_code   nvarchar(30)   not null   -- 반품코드
,fk_order_code   nvarchar(30)   not null   -- 주문코드 (fk)
,return_reason   nvarchar(30)             -- 반품사유
,return_detail   nvarchar(300)            -- 상세사유
,constraint PK_tbl_return_return_code primary key(return_code)
,constraint FK_tbl_return_order_code foreign key(fk_order_code) references tbl_order(order_code)
);

select * 
from TBL_PRODUCT;

select *
from ALL_USERS;









select prod_code, prod_name, prod_kind, prod_image
    ,prod_high, prod_color ,prod_size, prod_price, prod_stock
    ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count ,rownum AS RNO
from
(select rownum AS RNO ,prod_code, prod_name, prod_kind, prod_image
    ,prod_high, prod_color ,prod_size, prod_price, prod_stock
    ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count
from tbl_product left JOIN 
(

    select fk_prod_code, count(*) as prod_review_count 
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
where prod_kind like '%' and prod_color like '%' and prod_name like '%스니%' and prod_price between '0' and '30000' 
and prod_color like '%yellow%' or prod_color like '%red%' 
order by prod_registerday desc
)
where RNO between 1 and 30
order by prod_price desc;




select prod_code, prod_name, prod_kind, prod_image
    ,prod_high, prod_color ,prod_size, prod_price, prod_stock
    ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count ,rownum AS RNO
from
(select rownum AS RNO ,prod_code, prod_name, prod_kind, prod_image
    ,prod_high, prod_color ,prod_size, prod_price, prod_stock
    ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count
from tbl_product left JOIN 
(
    select fk_prod_code, count(*) as prod_review_count 
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
where prod_kind like '%' and prod_color like '%' and prod_name like '%스니%' and prod_price between '0' and '30000' 
and prod_color in ('yellow','red')
order by prod_registerday desc
)
where RNO between 1 and 30
order by prod_price desc;

select *
from tbl_member;

select *
from tbl_payment;


select *
from tabs;

select *
from 


select *
from tbl_prod_detail

---------------------------------------------------------------------

SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, 
birthday, grade_code, point, account_name, bank_name, account, registerday, pwdchangegap, 
nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap
FROM 
(
select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender 
, birthday, grade_code, point, account_name, bank_name, account, to_char(registerday, 'yyyy-mm-dd') AS registerday 
, trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap
from tbl_member
where status = 1 and userid = 'jinhr46' and pwd = 'qwer1234$' 
) M 
CROSS JOIN 
(
select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap
from tbl_login_history
where fk_userid = 'jinhr46'
) H

------------------------------------------------------------------------------------------------------------------------------------
String sql = "SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, \n"+
"birthday, grade_code, point, account_name, bank_name, account, registerday, pwdchangegap, \n"+
"nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap, \n"+
"status, idle\n"+
"FROM \n"+
"(\n"+
"select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender \n"+
", birthday, grade_code, point, account_name, bank_name, account, to_char(registerday, 'yyyy-mm-dd') AS registerday \n"+
", trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap , status, idle\n"+
"from tbl_member\n"+
"where status = 1 and userid = 'jinhr46' and pwd = 'qwer1234$' \n"+
") M \n"+
"CROSS JOIN \n"+
"(\n"+
"select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap\n"+
"from tbl_login_history\n"+
"where fk_userid = 'jinhr46'\n"+
") H";




select *
from tbl_login_history

insert into tbl_login_history
values('jinhr46', '22/09/29', '123.123.123')

commit;

create table tbl_login_history
(fk_userid              NVARCHAR2(30)            not null    --
,logindate              date default sysdate    not null
,clientip               varchar2(20)            not null    --123.234.234.234
,constraint FK_tbl_login_history_fk_userid foreign key(fk_userid) references tbl_member(userid)
);

select *
from tabs;
------------------------------------------------------------------

create or replace procedure pcd_member_insert 
(p_userid  IN  nvarchar2
,p_name    IN  varchar2
)
is
begin
     for i in 1..50 loop
         insert into tbl_member(userid, name, pwd, email, phone_number, postcode, address, detailaddress, extraaddress, gender, birthday, GRADE_CODE, ACCOUNT_NAME, BANK_NAME, ACCOUNT  ) 
         values(p_userid||i, p_name||i, 'qwer1234$', p_userid||i||'gmail.com', '010233423'||i , '06105' , '서울 강남구', '논현동' ,'211-10', '2', '1994-05-12', 'welcome', p_name , '카카오뱅크', '3779554731957'); 
     end loop;
end pcd_member_insert;
--Procedure PCD_MEMBER_INSERT이(가) 컴파일되었습니다.

exec pcd_member_insert('jinhr','진혜린');
commit;

exec pcd_member_insert('choejh','최지희');
commit;


alter table tbl_order add point_use_amount number default 0;
alter table tbl_order add discount_amount number default 0;
alter table tbl_order add real_amount number default 0;

select *
from tbl_member;

create or replace procedure pcd_order_insert
(p_ordercode IN varchar2
,p_userid    IN nvarchar2
)
is
begin
    for i in 1..9 loop
            insert into tbl_order(order_code, fk_userid, orderdate, expectdate, order_amount, order_state, point_use_amount, discount_amount, real_amount)
            values(p_ordercode||lpad(i,4,'0'), p_userid||i, sysdate, '22/09/31', 20000, '배송중', 1000, 2000, 17000)
    end loop;
end pcd_order_insert;



select *
from tbl_order



create sequence seq_ordercode
   start with 1         -- 첫번째 출발은 2 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    
create sequence seq_membercode
   start with 1         -- 첫번째 출발은 2 부터 한다.
   increment by 1        -- 증가치는 1 이다. 즉, 1씩 증가한다.
    nomaxvalue
    nominvalue
    nocycle
    nocache;