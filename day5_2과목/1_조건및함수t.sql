-- IN 
SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계' OR STU_DEPT = '전기전자';

SELECT *
FROM STUDENT
WHERE STU_DEPT IN ('기계', '전기전자');

-- BETWEEN

SELECT *
FROM STUDENT
WHERE STU_HEIGHT >= 170 AND STU_HEIGHT <= 180;

SELECT *
FROM STUDENT
WHERE STU_HEIGHT BETWEEN 170 AND 180;

-- LIKE
-- % 는 0글자이상, _ 는 한글자
SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '%김%';

SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '김_';

SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '김__';

-- ESCAPE 문자
SELECT *
FROM STUDENT
WHERE STU_NAME LIKE '%@%%' ESCAPE '@';
-- WHERE STU_NAME LIKE '%%%';

-- NVL 
-- COMM이 NULL인 사람들의 값을 0으로 출력
SELECT E.*, NVL(COMM, 0)
FROM EMP E;

SELECT *
FROM EMP
WHERE SAL+NVL(COMM, 0) >= 2000;
-- WHERE SAL+COMM >= 2000;

-- NVL2
SELECT ENAME, COMM, NVL2(COMM, '값있다!', '없다!')
FROM EMP;

-- NULLIF

SELECT 
    NULLIF('A', 'A') AS 같으면NULL, 
    NULLIF('A', 'B') AS 다르면첫번째거
FROM DUAL;

-- NULLIF 예시
-- 만약 목표액이 0이면 에러 발생
SELECT 부서이름, (달성액 / 목표액) AS 달성률
FROM 매출테이블;

-- 목표액이 0일경우 'NULLIF(목표액, 0)' 가 NULL이 되서 나눗셈 에러 발생 X
SELECT 
    부서이름, 
    (달성액 / NULLIF(목표액, 0)) AS 달성률,
    NVL((달성액 / NULLIF(목표액, 0)), '계산불가') AS 달성률
FROM 매출테이블;

-- COALESCE

SELECT STU_NAME, STU_HEIGHT, COALESCE(TO_CHAR(STU_HEIGHT), STU_NAME)
FROM STUDENT;

-- 예시
-- 핸드폰번호 없으면 집전화번호 출력, 근데 집전화번호 없으면 비상연락망 출력
-- 3개다 없으면 '연락처 없음' 출력
SELECT COALESCE(핸드폰번호, 집전화번호, 비상연락망, '연락처 없음') AS 연락처
FROM 회원테이블;

-- DECODE
-- 성별이 M -> 남자, F -> 여자, NULL -> 알수없음
SELECT 
    STU_NAME,
    DECODE(STU_GENDER, 'M', '남자'), -- STU_GENDER가 'M'이면 '남자' 아니면 NULL 출력
    DECODE(STU_GENDER, 'M', '남자', '여자'), -- STU_GENDER가 'M'이면 '남자' 아니면 '여자' 출력
    DECODE(STU_GENDER, 'M', '남자', 'F', '여자'), -- STU_GENDER가 'M'이면 '남자' 'F' 면 '여자' 출력
    DECODE(STU_GENDER, 'M', '남자', 'F', '여자', '알수없음') 
    -- STU_GENDER가 'M'이면 '남자' 'F' 면 '여자' 아니면 '알수없음' 출력
FROM STUDENT;

-- CASE ~ WHEN
-- 80점 이상은 'A' 출력, 60점 이상은 'B', 나머지는 'C'
SELECT 
    STU_NO, 
    ENR_GRADE,
    CASE
        WHEN ENR_GRADE >= 80 THEN 'A'
        WHEN ENR_GRADE >= 60 THEN 'B'
        ELSE 'C'
    END AS 학점
FROM ENROL;













