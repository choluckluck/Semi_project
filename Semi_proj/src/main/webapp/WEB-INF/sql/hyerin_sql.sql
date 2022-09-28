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

---------------- review 개수와 함께 상품 정보를 구하는 sql문  *** 메인의 New arrival 노출----------------
select prod_code, prod_name, prod_kind , prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,'0') as prod_review_count
from tbl_product left JOIN 
(
    select fk_prod_code, count(*) as prod_review_count
    from tbl_review
    group by fk_prod_code
)
ON prod_code = fk_prod_code
order by prod_registerday desc;



update tbl_product set prod_color = 'yellow,red'
where prod_code = 'sneakers0006';
commit;


select * from tbl_product
order by prod_registerday desc;


-- tbl_product 테이블에 메인노출여부(md_pick_yn) 컬럼 추가
alter table tbl_product add md_pick_yn varchar2(5) default 'N';

select * from tbl_product


desc tbl_order

select * from tab;


create sequence seq_order_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;

select * from tbl_member;

ALTER TABLE tbl_order drop column FK_DELIVERY_CODE;



-- tbl_order 테이블에 데이터 추가
insert into tbl_order values('order-000'||seq_order_code.nextval, 'jinhr18', sysdate, null, '49900', '입금대기' );

select * from tbl_order

commit;

ALTER TABLE tbl_order_detail drop column ORDER_DETAIL_CODE;

commit;

desc tbl_order_detail


desc tbl_payment
ALTER TABLE tbl_payment drop column PAYMENT_CODE;


insert into tbl_order_detail values('order-0001', 'flat004', '3', '150000' );

insert into tbl_payment values('order-0001', '150000', '0', '0', '150000');

commit;
select * from tbl_product


--------------- ** 주문수량을 product와 합쳐서 보여줌 ** 메인의 BEST 노출---------------------
select prod_code, prod_name, prod_kind , prod_high, prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,0) as prod_review_count, nvl(prod_order_count,0) as prod_order_count, prod_saleprice
from tbl_product
left JOIN 
(
    select fk_prod_code, count(*) as prod_order_count
    from tbl_order_detail
    group by fk_prod_code
)OD
ON prod_code = OD.fk_prod_code
left join
(
    select fk_prod_code, count(*) as prod_review_count
    from tbl_review
    group by fk_prod_code
)R
ON prod_code = R.fk_prod_code
order by prod_order_count desc









------- ** 노출여부값이 Y일때 md'pick에 랜덤하게 보이기 -----
SELECT prod_code, prod_name, prod_kind , prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,0) as prod_review_count
FROM (
   SELECT prod_code, prod_name, prod_kind , prod_image, prod_price, prod_color, prod_registerday, prod_review_count
   FROM tbl_product
   left join
    (
        select fk_prod_code, count(*) as prod_review_count
        from tbl_review
        group by fk_prod_code
    )R
   ON prod_code = R.fk_prod_code
   WHERE md_pick_yn = 'Y'
   ORDER BY DBMS_RANDOM.VALUE
)
WHERE ROWNUM < 5


select * from tbl_member

select * from tbl_product

select * from TBL_LIKE
select * from tab

insert into tbl_like values('like-0002', 'jinhr40', 'sneakers0006');
commit;

jinhr40 flat004

---------------------- ****** 하트(위시) 처리 ****** ------------------------------
select fk_userid, fk_prod_code
from tbl_like
where fk_userid = 'jinhr40' and fk_prod_code = 'flat004';

String sql = "select fk_userid, fk_prod_code\n"+
"from tbl_like\n"+
"where fk_userid = 'jinhr40'";

desc tbl_member

select * from tbl_product





select * from tbl_product


desc tbl_product

ALTER TABLE tbl_product add prod_saleprice varchar2(50);

alter table tbl_product add prod_description varchar2(4000);

alter table tbl_product add prod_point varchar2(50);

select * from tbl_product

update tbl_product set prod_saleprice = '27000'
where prod_price = '30000'

commit;

select md_pick_yn from tbl_product

select * from tbl_product

update tbl_product set md_pick_yn = 'Y'
where prod_code like '%1%'

commit

;