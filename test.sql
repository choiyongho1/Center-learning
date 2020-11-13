-- 문제 1.
-- 맴버중 100만원 이상 구매한 맴버 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요

SELECT
    MEMBER.NAME,
    PAYMENT_HISTORY.ORDER_PRICE
FROM
    MEMBER, PAYMENT_HISTORY
WHERE
    PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID;

-- 문제 2.
-- 맴버중 평균 결제 금액이 10만원 이상인 맴버의 이름을 출력하세요
-- member, payment_history 테이블 사용
-- 이름, 결제 금액을 출력하세요

SELECT
    MEMBER.NAME,
    PAYMENT_HISTORY.ORDER_PRICE
FROM
    MEMBER, PAYMENT_HISTORY
WHERE
    PAYMENT_HISTORY.MEMBER_ID = MEMBER.ID AND 
    PAYMENT_HISTORY.ORDER_PRICE >= 100000;

-- 문제 3.
-- 카테고리중 상품이 5개 이상 등록된 카테고리의 이름을 출력하세요
-- category, product 사용

SELECT
    CATEGORY.NAME,
    COUNT(CATEGORY_ID)
FROM    
    PRODUCT, CATEGORY
WHERE
    PRODUCT.CATEGORY_ID = CATEGORY.ID
GROUP BY
   PRODUCT.NAME
HAVING
    COUNT(CATEGORY.ID) >= 5;

-- 문제 4.
-- CATALOGUE 테이블을 신규로 만들어주세요 (만약 있다면 삭제하여 주세요)
-- 테이블의 구성은 ID, NAME, PRICE, ORIGIN 입니다
-- 데이터는 PRODUCT 안의 데이터를 INSERT SELECT 문을 사용하여 데이터를 넣어 주세요

CREATE TABLE CATALOGUE (
    id number NOT NULL,
    name varchar2(200) NOT NULL,
    price number NOT NULL,
    origin varchar2(200)
);

INSERT INTO CATALOGUE
SELECT id, name, price, origin
FROM PRODUCT;

-- 문제 5.
-- PRODUCT 테이블에서 가격이 10000000(천만)원 이상인 상품의 가격을 일괄적으로 1000000(백만원) 으로 변경하세요
-- PRODUCT 테이블 사용, UPDATE 구문 사용

UPDATE PRODUCT
SET PRICE = PRICE / 10
WHERE PRICE >= 1000000;

-- 문제 6.
-- 문제 5번을 푸신 후, PRODUCT 의 가격 != PAYMENT_HISTORY.ORDER_PRICE / PAYMENT_HISTORY.ORDER_COUNT 
-- 인 값들을 찾으세요
-- 5번으로 인해 가격이 다운된 상품들을 찾고, PAYMENT_HISTORY 에서 구한 단가로 비교하면 됩니다

SELECT 
    PAYMENT_HISTORY.ORDER_PRICE / PAYMENT_HISTORY.ORDER_COUNT AS 단가,
    PRODUCT.PRICE
FROM
    PRODUCT, PAYMENT_HISTORY
WHERE
    PAYMENT_HISTORY.PRODUCT_ID = PRODUCT.ID AND 
    PRODUCT.PRICE != PAYMENT_HISTORY.ORDER_PRICE / PAYMENT_HISTORY.ORDER_COUNT;

-- 추가 문제 #1.
-- 카탈로그 테이블에 CATEGORY_ID 를 추가로 생성해주시고
-- NAME 기준으로 PRODUCT 테이블에 있는 데이터(카테고리 id)를 CATALOGUE 테이블에 추가해 주시고
-- CATALOGUE 테이블에서 FK(외래키) 를 설정해주세요
-- 서브 쿼리 사용 필요