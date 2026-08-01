-- 조인(INNER)

SELECT *
FROM STUDENT;
-- 학생 이름, 시험 점수 같이 출력하고싶다
-- STUDENT테이블에 STU_NO(학번) 있고, ENROL에도 학번 있네?
-- 두 테이블 조인하면 되겠다 - 학번이 같은 애들끼리
SELECT * 
FROM ENROL;

SELECT S.STU_NO, STU_NAME, ENR_GRADE
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;

SELECT S.STU_NO, STU_NAME, AVG(ENR_GRADE)
FROM STUDENT S
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME;

-- INNER JOIN -> 양쪽 테이블에 조건에 맞는 데이터가 있을 때 해당 데이터를 출력
-- EX) 진현무라는 학생은 시험을 한번도 안봤기 때문에(ENROL 테이블에 정보 없음)
--     INNER JOIN 결과에 나오지 않음

-- OUTER(LEFT) 조인 (RIGHT)
-- 한쪽 테이블에라도 데이터가 있으면 조건만족안해도 데이터 나온다.
SELECT S.STU_NO, STU_NAME, E.*
FROM STUDENT S
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO;

SELECT S.STU_NO, STU_NAME, E.*
FROM STUDENT S
RIGHT JOIN ENROL E ON S.STU_NO = E.STU_NO;

-- FULL
SELECT S.STU_NO, STU_NAME, E.*
FROM STUDENT S
FULL JOIN ENROL E ON S.STU_NO = E.STU_NO;

-- 시험본 학생 수
-- LEFT를 이용하면 시험을 안 본 학생들의 숫자 0으로 출력 가능
SELECT S.STU_NO, STU_NAME, COUNT(ENR_GRADE)
FROM STUDENT S
--INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
LEFT JOIN ENROL E ON S.STU_NO = E.STU_NO
GROUP BY S.STU_NO, STU_NAME
ORDER BY COUNT(ENR_GRADE) DESC;

-- 오라클 조인
-- 1. FROM 절에 조인하고자 하는 테이블 다 들어감
-- 2. 조인조건은 WHERE에서
-- 3. LEFT조인은 '(+)' 사용
SELECT *
FROM STUDENT S, ENROL E
WHERE S.STU_NO = E.STU_NO(+); -- OUTER 조인(기준 - STUDENT)
--WHERE S.STU_NO = E.STU_NO; -- INNER 조인

-- ANSI조인의 다른 유형
-- 테이블 별칭 사용 X
SELECT *
FROM STUDENT S
INNER JOIN ENROL E USING(STU_NO);

-- NATURAL
-- 양쪽 테이블에서 같은 이름의 컬럼명(타입도 같은거) 찾아서 조인
-- 잘 안쓰는 이유 : 
-- 1. 같은 컬럼명이 2개이상인데 1개의 컬럼으로만 조인하고 싶어도 2개이상이 조인 조건에 들어가버림
-- 2. 컬럼명이 다른 애들끼리 조인하는 경우도 많음
-- 3. 조인조건이 무조건 같은거끼리만 하는건 아님(특정 사이 값, 다른거 등이 조건이 될 수 있음)
SELECT *
FROM STUDENT S
NATURAL JOIN ENROL E ;


-- CROSS JOIN
-- 모든 경우의 수 다 나옴
-- 테스트용으로 일부러 사용하는 경우가 종종 있지만 
-- 그 외에는 실수일 경우가 대부분이므로 주의할 필요 있음
SELECT *
FROM STUDENT S
INNER JOIN ENROL E ON 1=1;

-- 이 형태 잘 기억
-- WHERE에 조인 조건 없어서 CROSS 조인 발생 해버림
SELECT *
FROM STUDENT S, ENROL E;

-- SELF 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.ENAME AS 상사
FROM EMP E1
LEFT JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- Non-Equi Join (비등가 조인)
SELECT *
FROM EMP E
INNER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL;

--

SELECT S.STU_NO
FROM STUDENT S 
INNER JOIN ENROL E ON S.STU_NO = E.STU_NO;


SELECT STU_NO, S.STU_NAME
FROM STUDENT S 
INNER JOIN ENROL E USING(STU_NO);




