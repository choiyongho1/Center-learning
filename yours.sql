-- DATE 형간의 비교는 그냥 '20200101' 과 같이 VARCHAR 쓰셔도 비교가 가능하긴 하지만
-- 옳은 방법은 아닙니다.
-- 따라서 TO_DATE 함수를 사용하여 비교하는것이 옳습니다

SELECT
    *
FROM
    PAYMENT_HISTORY
WHERE
    ORDER_DATE >= TO_DATE('20200101') AND
    ORDER_DATE < TO_DATE('20200201');

-- 문제 1.
-- PAYMENT_HISTORY 에서 1월달 매출(ORDER_PRICE)의 합을 구해 주세요

SELECT
    SUM(ORDER_PRICE)
FROM
    PAYMENT_HISTORY
WHERE
    ORDER_DATE >= TO_DATE('20200101') AND
    ORDER_DATE < TO_DATE('20200201');

-- 월별 매출을 뽑기 위해서는 날짜 데이터를 MONTH 까지 잘라서
-- 자른 데이터를 기준으로 그룹 바이 구문을 사용하면 MONTH 기준으로 뽑을수 있습니다
-- TO_CHAR(바꿀날짜컬럼, 포멧 문자열)
-- YYYY - 4자리 년도
-- MM - 2자리 월
-- DD - 2자리 일

SELECT
    TO_CHAR(ORDER_DATE, 'YYYYMM') AS MONTH,
    SUM(ORDER_PRICE)
FROM
    PAYMENT_HISTORY
GROUP BY
    TO_CHAR(ORDER_DATE, 'YYYYMM');

-- 문제 1.
-- PAYMENT_HISTORY 에서 1월달 매출(ORDER_PRICE)의 합을 구해 주세요
-- 월별 매출을 뽑기 위해서는 날짜 데이터를 MONTH 까지 잘라서
-- 자른 데이터를 기준으로 그룹 바이 구문을 사용하면 MONTH 기준으로 뽑을수 있습니다
-- TO_CHAR(바꿀날짜컬럼, 포멧 문자열)
-- YYYY - 4자리 년도
-- MM - 2자리 월
-- DD - 2자리 일
-- HH24 - 24시간 시간
-- MI - 분
-- SS - 초
-- https://aesya.tistory.com/15

SELECT
    TO_CHAR(ORDER_DATE, 'YYYY-MM-DD') AS MONTH,
    SUM(ORDER_PRICE)
FROM
    PAYMENT_HISTORY
WHERE
    ORDER_DATE >= TO_DATE('20200101') AND
    ORDER_DATE < TO_DATE('20200201')
GROUP BY
    TO_CHAR(ORDER_DATE, 'YYYY-MM-DD');

-- 오라클 유용한 함수 정리
-- https://dexcore.tistory.com/424

-- 문제 3.
-- 안녕하세요 마케팅팀입니다
-- 혹시 1월 ~ 3월의 매출액과 판매 대수를 각각 알고싶은데
-- 데이터를 보내주실수 있을까요?
-- 최대한 빨리 부탁드리겠습니다
-- 감사합니다

SELECT
    TO_CHAR(ORDER_DATE, 'YYYY-MM') AS MONTH,
    SUM(ORDER_PRICE) AS 매출액,
    COUNT(ORDER_COUNT) AS 판매대수
FROM
    PAYMENT_HISTORY
WHERE
    ORDER_DATE >= TO_DATE('20200101') AND
    ORDER_DATE < TO_DATE('20200401') 
GROUP BY
    TO_CHAR(ORDER_DATE, 'YYYY-MM');

-- 문제4.
-- 안녕하세요 xxx 님 YY팀 ZZZ입니다
-- 혹시 데이터 담당하시는거 같아서
-- 문의 드리는데요
-- 요즘 이제 월별 단일 매출액이 가장 높은 금액이 얼마인지 궁굼해서 -> MAX 사용
-- 요청드립니다
-- 감사합니다

SELECT
    TO_CHAR(ORDER_DATE, 'YYYY-MM') AS MONTH,
    MAX(ORDER_PRICE) AS 매출액
FROM
    PAYMENT_HISTORY
GROUP BY
    TO_CHAR(ORDER_DATE, 'YYYY-MM')
ORDER BY 
    TO_CHAR(ORDER_DATE, 'YYYY-MM');