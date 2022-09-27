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


create sequence seq_product_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;


select to_char(prod_registerday,'yyyy-mm-dd hh24:mi:ss') from tbl_product



desc tbl_product

select 


create or replace procedure pcd_product_insert
(p_prod_name  IN  varchar2
,p_prod_kind  IN  char
,p_prod_image in varchar2
,p_prod_high in varchar2
,p_prod_color in varchar2
,p_prod_size in varchar2
,p_prod_price in varchar2
,p_prod_stock in varchar2
)
is
begin
for i in 1..10 loop
insert into tbl_product(prod_code, PROD_NAME, PROD_KIND, PROD_IMAGE, PROD_HIGH, PROD_COLOR, PROD_SIZE, PROD_PRICE, PROD_STOCK )
values(p_prod_kind||lpad(seq_product_code.nextval,4,0), p_prod_name||i, p_prod_kind, p_prod_image||i, p_prod_high, p_prod_color, p_prod_size, p_prod_price, p_prod_stock);
end loop;
end pcd_product_insert;
--Procedure PCD_PRODUCT_INSERT이(가) 컴파일되었습니다.

exec pcd_product_insert('flatshose','flat','flat','1','navy','230,235,240','50000','40');

commit;

exec pcd_product_insert('ankle00','앵클슈즈','ankle','ankle','5','black','240,245,250','100000','25');

commit;

exec pcd_product_insert('스니커즈','sneakers','sneakers','3','yellow','220,225,230,235','30000','100');


select * from tbl_product 

select * from tab;


desc TBL_REVIEW





insert into tbl_review values('review0001','jinhr1','귀엽당','귀여운듯 잘산듯요ㅋㅋ',sysdate,null,null,null,'5','sneakers0009');

insert into tbl_review values('review0002','jinhr1','이건좀...','아.. 제발... 개별루..ㅠ 비추합니다',sysdate,null,null,null,'1','sneakers0009');

insert into tbl_review values('review0003','jinhr2','ㄱㅊㄱㅊ 적당히추천','ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ내용채우깅ㅇㅇㅇ',sysdate,null,null,null,'4','sneakers0008');

insert into tbl_review values('review0004','jinhr3','예뿌네용','이거신고 나가니까 애들이 칭찬해줌ㅎㅎㅎ',sysdate,null,null,null,'4','sneakers0007');

insert into tbl_review values('review0005','jinhr4','귀여워요ㅎㅎㅎ^^','잘신을게요~',sysdate,null,null,null,'5','sneakers0006');


commit;

select * from tbl_review

select * from tbl_member

select * from tbl_product order by prod_registerday desc;


update tbl_product set prod_image = 'sneakers10.jpg'
where prod_code = 'sneakers0010'

commit;

select * from tbl_product

---------------- review 개수와 함께 상품 정보를 구하는 sql문 ----------------
select prod_code, prod_name, prod_kind , prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,'0') as prod_review_count
from tbl_product left JOIN 
(
    select fk_prod_code, count(*) as prod_review_count
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
where rownum <= 4
order by prod_registerday desc;







