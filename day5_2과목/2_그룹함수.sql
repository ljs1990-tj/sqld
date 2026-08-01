-- SUM
-- 전체 합, 전체 평균
SELECT 
    SUM(SAL), ROUND(AVG(SAL), 2)
FROM EMP;

-- 직급별 합, 평균
-- 그룹으로 묶은 컬럼만 SELECT에서 사용 가능
SELECT 
    JOB,
    SUM(SAL), ROUND(AVG(SAL), 2)
FROM EMP
GROUP BY JOB;

-- MAX() / MIN()
-- 회사에서 가장 큰 급여를 받는 사람과 적은 급여를 받는 사람의 급여
SELECT 
    MAX(SAL), MIN(SAL)
FROM EMP;

-- 각 부서에서 가장 큰 급여를 받는 사람과 적은 급여를 받는 사람의 급여
SELECT 
    DEPTNO,
    MAX(SAL), MIN(SAL)
FROM EMP
GROUP BY DEPTNO;

-- 미니퀴즈 (STUDENT)
-- 각 학과별 평균 키, 가장 큰 키 값 출력
-- 출력 -> 학과명, 평균 키, 학과에서 가장 큰 키

SELECT 
    STU_DEPT,
    AVG(STU_HEIGHT), MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT;

-- COUNT()
-- 괄호안에 컬럼명이 들어가면 해당 컬럼에 NULL이 아닌 값들의 수를 출력
SELECT 
    COUNT(*), -- 전체 학생 수,
    COUNT(STU_HEIGHT) -- STU_HEIGHT에서 값이 NULL이 아닌 학생 수
FROM STUDENT;

-- WHERE, HAVING
-- WHERE는 그룹을 묶기 전 조건, HAVING 그룹을 묶은 후 조건

-- 각 학과에서 남자들의 평균 키, 가장 큰 키
SELECT 
    STU_DEPT,
    AVG(STU_HEIGHT), MAX(STU_HEIGHT)
FROM STUDENT
WHERE STU_GENDER = 'M'
GROUP BY STU_DEPT;

-- 각 학과별 평균 키가 170이상인 학과의 평균 키, 가장 큰 키
SELECT 
    STU_DEPT,
    AVG(STU_HEIGHT), MAX(STU_HEIGHT)
FROM STUDENT
GROUP BY STU_DEPT
HAVING AVG(STU_HEIGHT) >= 170;





