-- 제약조건
SELECT * FROM STUDENT;
SELECT * FROM ENROL;

INSERT INTO ENROL VALUES(101, 12341234, 100);
ROLLBACK;

DELETE FROM STUDENT WHERE STU_NO = 20131001;



ALTER TABLE student ADD (stu_email varchar(50));

SELECT * 
FROM STUDENT;

ALTER TABLE student MODIFY (stu_name varchar(20));

ALTER TABLE student DROP COLUMN stu_email;



CREATE TABLE enrol2 (
  sub_no char(3) , -- 외래키 (FK)
  stu_no char(8) REFERENCES student(stu_no), -- 외래키 (FK)
  enr_grade NUMBER
);

-- DELETE, TRUNCATE => 데이터 삭제, DROP => 테이블 삭제
DROP TABLE ENROL2;


INSERT INTO STUDENT(STU_NO, STU_NAME) VALUES (12123434, NULL);

ALTER TABLE STUDENT MODIFY (STU_NAME UNIQUE);


SELECT *
FROM EMP E1
INNER JOIN EMP E2 ON E1.MGR = E2.EMPNO;

-- 계층형 질의
SELECT LEVEL, ENAME, MGR
FROM emp
START WITH MGR IS NULL -- 시작: KING
CONNECT BY PRIOR EMPNO = MGR;
-- (나의 사번 = 누군가의 매니저사번)

--

SELECT LEVEL, ENAME, MGR
FROM emp
START WITH ENAME = 'SMITH' -- 시작: 최사원
CONNECT BY PRIOR MGR = EMPNO;
-- (나의 매니저사번 = 누군가의 사번)


-- ROWNUM
-- 레코드(ROW)에 순번 작성해주는 애

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE ROWNUM <= 3
ORDER BY STU_HEIGHT DESC;


--

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT;

SELECT STU_NO
FROM (
    SELECT STU_NO, STU_NAME, STU_DEPT
    FROM STUDENT
);


-- 가장 키가 큰 학생 3명

-- 1. 학생들을 키가 큰 순서대로 정렬

SELECT ROWNUM, S.*
FROM STUDENT S
WHERE STU_HEIGHT IS NOT NULL 
ORDER BY STU_HEIGHT DESC;


SELECT ROWNUM, T.*
FROM (
    SELECT *
    FROM STUDENT S
    WHERE STU_HEIGHT IS NOT NULL 
    ORDER BY STU_HEIGHT DESC
) T 
WHERE ROWNUM <= 3;


-- 시험 평균점수가 가장 높은 상위 3명 학번, 이름, 평균점수 출력
-- STUDENT, ENROL

SELECT *
FROM (
    SELECT S.STU_NO, STU_NAME, AVG(ENR_GRADE) AS AVG_GRADE
    FROM STUDENT S
    INNER JOIN ENROL E ON S.STU_NO = E.STU_NO
    GROUP BY S.STU_NO, STU_NAME
    ORDER BY AVG_GRADE DESC
)
WHERE ROWNUM <= 3;

-- 각 학생별 시험 평균 점수(학번, 이름, 평균점수 출력) 구한 후 내림차순
-- 1. STUDENT, ENROL 조인
-- 2. GROUP BY 학번, 이름 
-- 3. 평균점수 기준 내림차순


SELECT *
FROM STUDENT S
WHERE STU_NO IN (
    SELECT STU_NO
    FROM ENROL E
    WHERE S.STU_NO = E.STU_NO
)










