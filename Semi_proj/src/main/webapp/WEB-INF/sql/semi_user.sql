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
   start with 1         -- 첫번째 출발은 2 부터 한다.
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
from tbl_review;

select *
from tbl_product;

select * from tab;

desc tbl_review;

select *
from tbl_member
where name like '%혜린%';

--------------------

--컬럼 추가
alter table tbl_product ADD prod_registerday date default sysdate; 

commit;

--컬럼 이름 변경
alter table tbl_product rename column PK_PROD_CODE TO PROD_CODE;


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

--상품가져오기 
select prod_code, prod_name, prod_kind, prod_image
	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock
	 ,prod_registerday
from tbl_product;     

--리뷰테이블 상품 포린키로 추가 (컬럼 추가, 제약 추가)
alter table tbl_review ADD fk_prod_code  NVARCHAR2(30);
commit;

ALTER TABLE tbl_review ADD CONSTRAINT FK_tbl_review_fk_prod_code foreign key(fk_prod_code) references tbl_product(prod_code);

alter table tbl_member drop column fk_prod_code;

-- 상품테이블 리뷰테이블 조인
select COUNT(*) AS REVIEW_CNT    
from tbl_review R JOIN tbl_product P
ON R.fk_prod_code = P.prod_code
where R.fk_prod_code= 'sneakers0009';

-- 상품리뷰 알아오기

select prod_code, prod_name, prod_kind, prod_image
	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock
	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count 
from tbl_product left JOIN 
(
    select fk_prod_code, count(*) as prod_review_count
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
order by prod_registerday desc;
---------------------------------------
select prod_code, prod_name, prod_kind, prod_image
	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock
	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count ,rownum
from
(select rownum ,prod_code, prod_name, prod_kind, prod_image
	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock
	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count
from tbl_product left JOIN 
(

    select fk_prod_code, count(*) as prod_review_count 
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
order by prod_registerday desc
)
where rownum between 1 and 30;




---------------------------------------
  select userid, name, email, gender, rownum AS RNO
  from 
  (
      select rownum AS RNO,userid, name, email, gender
      from 
      (
          select userid, name, email, gender
          from tbl_member
          where userid !='admin'
          order by registerday desc
      ) V
  ) T
  where RNO between 21 and 30;
 




-- 리뷰 데이터넣기

insert into tbl_review(REVIEW_CODE, FK_USERID , REVIEW_SUBJECT , REVIEW_CONTENTS  , REVIEW_REGISTERDAY,  REVIEW_GRADE , FK_PROD_CODE ) 
values('R123', 'jinhr40', '임시 리뷰', '한번 써보겠습니다', '임시데이터', 'sneakers0001');                     
    

--조인 예제
 select  B.boardno AS 글번호
          , B.subject AS 글제목
          , M.name AS 작성자명
          , to_char(B.registerday, 'yyyy-mm-dd hh24:mi:ss') AS 작성일자
    from tbl_new_board B JOIN tbl_new_member M
    ON B.fk_member_id = M.member_id
    order by 1 desc;

--조인 예제
select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender,
        birthyyyy, birthmm, birthdd,coin, point,registerday, pwdchangegap,
        logindate
FROM 
(
    select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender
         , substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd
         , coin, point, to_char(registerday, 'yyyy-mm-dd') AS registerday
         , trunc( months_between(sysdate, lastpwdchangedate) ) AS pwdchangegap
    from tbl_member
    where status = 1 and userid = 'leess' and pwd='29b204ad54a353a4709554362574a889be32d92f801500cd9abf32a2bb2954ed'
) M 
CROSS JOIN
(
    select max(logindate) as logindate
    from tbl_login_history
    where fk_userid = 'leess'
) H;


-- 총페이지수 가져오기

select ceil(count(*)/20)  
from tbl_product;  






