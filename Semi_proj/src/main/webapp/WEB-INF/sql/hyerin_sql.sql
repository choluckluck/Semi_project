

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



create sequence seq_order_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;



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



---------------------- ****** 하트(위시) 처리 ****** ------------------------------
select fk_userid, fk_prod_code
from tbl_like
where fk_userid = 'jinhr40' and fk_prod_code = 'flat004';








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

-- prod_code 시퀀스

create sequence seq_product_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;


--상품데이터 입력하는 프로시저
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





exec pcd_product_insert('라비스 플랫','flat','flat','1',80000,50000,'완전 귀여운신발ㅋㅋ');

select * from tbl_product


exec pcd_product_insert('테슬 로퍼','loafer','loafer','2',62800,62800,'갖고싶어지는 신발......이네요...ㅋ');

exec pcd_product_insert('레이첼 블로퍼','bloafer','bloafer','3.5',59800,50000,'가을에 이거 신고싶어짐');

exec pcd_product_insert('제이 미들 펌프스','pumps','pumps','7',39800,39800,'이번 f/w 신상이에요');

exec pcd_product_insert('비비롱 롱부츠','boots','boots','8.5',99800,79800,'진짜 예뿌당..');

exec pcd_product_insert('케비 스니커즈','sneakers','sneakers','2',19800,19800,'편하게 신기 딱좋아요');

exec pcd_product_insert('해든 슬링백','slingback','slingback','6.5',89800,79800,'함 신어보세유');


exec pcd_product_insert('체이니 뮬','mule','mule','3.5',59800,59800,'큐티빠띠');



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






select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn, prod_colorList, prod_sizeList, prod_stockList
from
(
    select rownum as rno, prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn
    from v_tbl_product
    where prod_name like '%'||'니'||'%' and prod_kind = 'ankle'
)
left join ( select * from v_tbl_prod_detail )VPD on VPD.fk_prod_code = prod_code
where rno between 1 and 10






select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_color,prod_price,prod_size, prod_registerday,nvl(review_count, 0) as review_count, prod_saleprice, rownum AS RNO, prod_order_count
from
(
select PO.prod_code, P.prod_color, P.prod_size, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, nvl(review_count, 0) as review_count ,rownum AS RNO, nvl(prod_order_count,0) as prod_order_count
from tbl_product PO
JOIN
(
    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color
        ,LISTAGG(P.prod_size,',') WITHIN GROUP (ORDER BY P.prod_size) AS prod_size 
    from
    (
        select distinct prod_code, prod_color, prod_size
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
ON R.fk_prod_code = P.prod_code
LEFT JOIN 
(
    select fk_prod_code, count(*) as prod_order_count  
    from tbl_order_detail
    group by fk_prod_code
)OD
ON OD.fk_prod_code = R.fk_prod_code
where prod_kind like '%' and prod_name like '%' and prod_price between 1 and 5000000
and (prod_color like '%r%' or prod_color like '%%' or prod_color like '%나나%')
and (prod_size like '%%' or prod_size like '%나나%')
order by prod_order_count desc
)
where RNO between 1 and 90
order by RNO desc;



select PO.prod_code, prod_name, prod_kind, prod_image, prod_high, prod_color,prod_price, prod_saleprice, prod_size, prod_registerday, nvl(prod_review_count,0) as prod_review_count ,nvl(prod_order_count,0) as prod_order_count
from tbl_product PO
left join
(
    select fk_prod_code, count(*) as prod_order_count  
    from tbl_order_detail
    group by fk_prod_code 
) OD
on PO.prod_code = OD.fk_prod_code
left join
(
    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color
        ,LISTAGG(P.prod_size,',') WITHIN GROUP (ORDER BY P.prod_size) AS prod_size 
    from
    (
        select distinct prod_code, prod_color, prod_size
        from tbl_product
        join
        tbl_prod_detail
        on prod_code = fk_prod_code
    ) P
    group by prod_code
) CS
on PO.prod_code = CS.prod_code
left join
(
    select fk_prod_code, count(*) as prod_review_count
    from tbl_review
    group by fk_prod_code
)R
on PO.prod_code = r.fk_prod_code




----------------- **** 상품 리뷰 페이지 => select sql문

select fk_prod_code, prod_name, prod_image, fk_userid, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade 
from
(
    select rownum as rno, fk_prod_code, prod_name, prod_image, fk_userid, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade 
    from tbl_review
    left join
    tbl_product
    on fk_prod_code = prod_code
)
where rno between 1 and 10 and prod_name like '%라%'
order by review_registerday desc

select * from tbl_review





------ 총페이지수 알아오기 
select ceil(count(*)/10)
from tbl_review
left join
tbl_product
on fk_prod_code = prod_code
order by review_registerday desc


select ceil(count(*)/10)
from tbl_member


select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, grade_code, point, account_name, bank_name, account, registerday, status, idle
from
(
    select rownum as rno, userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, grade_code, point, account_name, bank_name, account, registerday, status, idle
    from tbl_member
)
where rno between 11 and 20


select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, grade_code, point, account_name, bank_name, account, registerday, status, idle
from
(
    select rownum as rno, userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender, birthday, grade_code, point, account_name, bank_name, account, registerday, status, idle
    from tbl_member
    where userid like '%'||'h'||'%'
)
where rno between 21 and 30
order by registerday desc 




select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn
from 
(
    select rownum as rno, prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn
    from v_tbl_product
)
where rno between 81 and 90


--tbl_prod_detail의 view 만들기
create or replace view v_tbl_prod_detail
as
select fk_prod_code, listagg(prod_color,',') within group (order by prod_color) as prod_colorList, listagg(prod_size,',') within group (order by prod_size) as prod_sizeList, listagg(prod_stock, ',') within group (order by prod_stock) as prod_stockList
from tbl_prod_detail
group by fk_prod_code
;

/*
tbl_order_detail

FK_ORDER_CODE   NOT NULL NVARCHAR2(30) 
FK_PROD_CODE    NOT NULL NVARCHAR2(30) 
ORDER_BUY_COUNT          NUMBER(10)    
ORDER_PRICE     NOT NULL NUMBER(10)    
*/

/*
tbl_order

ORDER_CODE       NOT NULL NVARCHAR2(30) 
FK_USERID        NOT NULL NVARCHAR2(30) 
ORDERDATE        NOT NULL DATE          
EXPECTDATE                VARCHAR2(50)  
ORDER_AMOUNT     NOT NULL NUMBER(10)    
ORDER_STATE      NOT NULL NVARCHAR2(30) 
POINT_USE_AMOUNT          NUMBER        
DISCOUNT_AMOUNT           NUMBER        
REAL_AMOUNT               NUMBER        

*/

-- ** tbl_qna 테이블에 데이터 넣어주기 ** --

desc tbl_qna
/*
QNA_CODE       NOT NULL NVARCHAR2(30)   
FK_USERID NOT NULL NVARCHAR2(30)   
CATEGORY                NVARCHAR2(20)   
SUBJECT                 NVARCHAR2(500)  
CONTENTS                NVARCHAR2(1000) 
REGISTERDAY    NOT NULL DATE            
FILE_1                  NVARCHAR2(300)  
FILE_2                  NVARCHAR2(300)  
FILE_3                  NVARCHAR2(300)  
ANSWER_YN               VARCHAR2(5)     
*/

create sequence seq_qna_code
start with 1    -- 첫번째 출발은 1이다
increment by 1  -- 증가치는 1이다.
nomaxvalue      -- 최대값이 없는 무제한
nominvalue      -- 최소값이 없다
nocycle         -- 반복을 하지 않는다
nocache;

/*
tbl_qna의 category check값

상품문의 prod
교환반품 e/r
취소변경 c/c
as문의 a/s

*/

-- tbl_qna에 데이터를 넣어주는 프로시저
create or replace procedure pcd_qna_insert
(p_fk_userid  IN  varchar2
,p_subject  IN  varchar2
,p_contents in varchar2
)
is
begin
for i in 1..5 loop
    insert into tbl_qna(QNA_CODE, fk_userid, CATEGORY, SUBJECT, CONTENTS, REGISTERDAY, ANSWER_YN)
    values(seq_qna_code.nextval, p_fk_userid||(i+5), 'a/s', p_subject, p_contents, sysdate, 'N');
end loop;
end pcd_qna_insert;

exec pcd_qna_insert('choejh','저 이거 반품신청좀 할게요','지금 신청해도 되는건가요?? 이거 신청하면 언제쯤 반품돼요?',null,null,null);

exec pcd_qna_insert('jinhr','방금 주문했는데 하나 더 교환 가능한가요','안된다면 주문취소하고 다시 할 수 있을까요ㅠ',null,null,null);

exec pcd_qna_insert('choejh','방금왔는데 까져있어요..','관리좀 똑바로 해주세요..ㅠㅠ 교환 되나요?');

commit;


desc tbl_member

create table tbl_qna_comment
(qcomment_code            NVARCHAR2(30)     not null  
,fk_qna_code              NVARCHAR2(30)     not null --문의글번호
,qcomment_contents        NVARCHAR2(1000) 
,qcomment_registerday     DATE              not null
,constraint PK_tbl_qna_comment_qcomment_code primary key(qcomment_code)
,constraint FK_tbl_qna_comment_fk_qna_code foreign key(fk_qna_code) references tbl_qna (qna_code)
);


select * from tbl_qna_comment


select * from tbl_order_detail

select fk_prod_code, count(*) as prod_order_count  
from tbl_order_detail
group by fk_prod_code 
