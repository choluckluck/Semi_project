show user;

select * from tab;

select * from tbl_member 



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

desc tbl_product

select * from tbl_order_detail




----------------------------------** 관리자 페이지 ** ------------------------------------------

------------------ ** 상품 최신순 정렬 ** ------------------
select prod_code, prod_kind, prod_image, prod_name, prod_price, prod_stock, md_pick_yn
from tbl_product
order by PROD_REGISTERDAY desc

-- 페이징
select ceil(count(*)/10)
from tbl_product
order by PROD_REGISTERDAY desc




------------------ ** 상품 주문순 정렬 ** ------------------
select prod_code, prod_kind, prod_image , prod_name, prod_price, prod_stock, prod_color, md_pick_yn, nvl(prod_order_count, 0) as prod_order_count
from tbl_product
left JOIN 
(
    select fk_prod_code, count(*) as prod_order_count
    from tbl_order_detail
    group by fk_prod_code
)OD
ON prod_code = OD.fk_prod_code
order by prod_order_count desc







------------------- ** 상품 종류별 정렬 ** ------------------
-- ** 종류별
select prod_code, prod_kind, prod_image, prod_name, prod_price, prod_stock, md_pick_yn
from tbl_product
where prod_kind = 'sneakers'



----------------------------------------------

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




create table tbl_prod_detail(
prod_detail_code	varchar2(30)	not null
,fk_prod_code	nvarchar2(30)	not null
,prod_color	varchar2(20)	
,prod_size	varchar2(20)
,prod_stock	varchar2(100)

,constraint PK_tbl_prod_detail_prod_detail_code	 primary key(prod_detail_code)
,constraint FK_tbl_prod_detail_fk_prod_code foreign key(fk_prod_code) references tbl_product(prod_code)	
)


desc tbl_product

select * from tbl_payment


select * from tbl_member;



select * from tbl_product



delete from TBL_PRODUCT 






desc tbl_product



create sequence seq_product_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;

desc tbl_product

ALTER TABLE tbl_product MODIFY PROD_PRICE number;

create or replace procedure pcd_product_insert
(p_prod_name  IN  varchar2
,p_prod_kind  IN  char
,p_prod_image in varchar2
,p_prod_high in varchar2
,p_prod_price in number
,p_PROD_SALEPRICE in varchar2
,p_prod_description in varchar2
)
is
begin
for i in 1..10 loop
insert into tbl_product(prod_code, PROD_NAME, PROD_KIND, PROD_IMAGE, PROD_HIGH, PROD_PRICE, prod_registerday, MD_PICK_YN, PROD_SALEPRICE, prod_description, prod_point)
values('prod-'||lpad(seq_product_code.nextval,4,0), p_prod_name||i, p_prod_kind, p_prod_image||i||'.jpg', p_prod_high, p_prod_price, sysdate, 'N', p_PROD_SALEPRICE, p_prod_description, trunc(p_prod_price*0.01,-1) );
end loop;
end pcd_product_insert;





select * from tbl_member

select 'prod-'||lpad(i,4,0)
from dual;

exec pcd_product_insert('라비스 플랫','flat','flat','1',80000,50000,'완전 귀여운신발ㅋㅋ');

select * from tbl_product


exec pcd_product_insert('테슬 로퍼','loafer','loafer','2',62800,62800,'갖고싶어지는 신발......이네요...ㅋ');

exec pcd_product_insert('레이첼 블로퍼','bloafer','bloafer','3.5',59800,50000,'가을에 이거 신고싶어짐');

exec pcd_product_insert('제이 미들 펌프스','pumps','pumps','7',39800,39800,'이번 f/w 신상이에요');

exec pcd_product_insert('비비롱 롱부츠','boots','boots','8.5',99800,79800,'진짜 예뿌당..');

exec pcd_product_insert('케비 스니커즈','sneakers','sneakers','2',19800,19800,'편하게 신기 딱좋아요');

exec pcd_product_insert('해든 슬링백','slingback','slingback','6.5',89800,79800,'함 신어보세유');


exec pcd_product_insert('체이니 뮬','mule','mule','3.5',59800,59800,'큐티빠띠');


select * from tbl_product

commit;


/*
tbl_prod_detail 정보

PROD_DETAIL_CODE NOT NULL VARCHAR2(30)  
FK_PROD_CODE     NOT NULL NVARCHAR2(30) 
PROD_COLOR                VARCHAR2(20)  
PROD_SIZE                 VARCHAR2(20)  
PROD_STOCK                VARCHAR2(100) 
*/


-- tbl_prod_detail 시퀀스
create sequence seq_prod_detail_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;


ALTER TABLE tbl_prod_detail MODIFY PROD_STOCK number;

select * from tbl_product

select * from tbl_prod


-- tbl_prod_detail에 데이터를 일괄로 넣어주는 프로시저

create or replace procedure pcd_prod_detail_insert
(p_PROD_COLOR in varchar2
,p_PROD_SIZE in varchar2
,p_prod_stock in number
)
is
begin
for i in 1..10 loop
    insert into tbl_prod_detail(PROD_DETAIL_CODE, FK_PROD_CODE, PROD_COLOR, PROD_SIZE, PROD_STOCK)
    values('d-prod-'||lpad(seq_prod_detail_code.nextval,4,0), 'prod-'||lpad(i+80,4,0), p_PROD_COLOR, p_PROD_SIZE, p_prod_stock );
end loop;
end pcd_prod_detail_insert;



exec pcd_prod_detail_insert('blue','230',124);

exec pcd_prod_detail_insert('blue','235',134);

exec pcd_prod_detail_insert('blue','240',231);

exec pcd_prod_detail_insert('blue','245',0);

exec pcd_prod_detail_insert('blue','250',4);


commit;

select * from tbl_product --90개

select * from tbl_prod_detail


select * from tbl_prod_detail
order by fk_prod_code

commit;

select distinct P.prod_code, P.prod_color
from
(
    select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, md_pick_yn, prod_color, prod_size   
    from tbl_product
    join
    tbl_prod_detail
    on prod_code = fk_prod_code
    where prod_code = 'prod-0001'
) P

------------------------ 색상, 리뷰, 주문수 조인 ------------------------------------------

select PO.prod_code, P.prod_color, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, md_pick_yn, nvl(review_count, 0) as review_count, nvl(prod_order_count, 0) as prod_order_count
from tbl_product PO
JOIN
(
    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color
    from
    (
        select distinct prod_code, prod_color
        from tbl_product
        join
        tbl_prod_detail
        on prod_code = fk_prod_code
    ) P
    group by prod_code
) P
ON PO.prod_code = P.prod_code
LEFT JOIN
(
    select fk_prod_code, count(*) as review_count
    from tbl_review
    group by fk_prod_code
) R
ON fk_prod_code = P.prod_code
LEFT JOIN
(
    select fk_prod_code, count(*) as prod_order_count
    from tbl_order_detail
    group by fk_prod_code
) OD
ON OD.fk_prod_code = P.prod_code





-- MD PICK
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



select PO.prod_code, P.prod_color, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, md_pick_yn, nvl(review_count, 0) as review_count, nvl(prod_order_count, 0) as prod_order_count
from tbl_product PO
JOIN
(
    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color
    from
    (
        select distinct prod_code, prod_color
        from tbl_product
        join
        tbl_prod_detail
        on prod_code = fk_prod_code
    ) P
    group by prod_code
) P
ON PO.prod_code = P.prod_code
LEFT JOIN
(
    select fk_prod_code, count(*) as review_count
    from tbl_review
    group by fk_prod_code
) R
ON fk_prod_code = P.prod_code
LEFT JOIN
(
    select fk_prod_code, count(*) as prod_order_count
    from tbl_order_detail
    group by fk_prod_code
) OD
ON OD.fk_prod_code = P.prod_code
WHERE md_pick_yn = 'Y' and ROWNUM < 5
ORDER BY DBMS_RANDOM.VALUE




select * from tbl_product
where md_pick_yn = 'Y'

update tbl_product set md_pick_yn = 'Y'
where prod_code = 'prod-0089'

commit;