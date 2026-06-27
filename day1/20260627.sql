-- DDL, DCL, DML, TCL
-- DML (Data Manipulation Language)
-- SELECT(데이터 조회), INSERT(데이터 삽입)
-- UPDATE(데이터 수정), DELETE(데이터 삭제)

SELECT *
FROM STUDENT; -- *은 전체를 의미

SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT;

SELECT *
FROM SUBJECT;

SELECT *
FROM ENROL;

-- 조건(WHERE)
-- '기계'과 학생들만 조회
SELECT *
FROM STUDENT
WHERE STU_DEPT != '기계'; -- 기계과가 아닌 학생들
-- WHERE STU_DEPT = '기계'; -- 기계과 학생들

-- 키가 168 이상 학생들 조회 OR 168 초과
SELECT *
FROM STUDENT
WHERE STU_HEIGHT >= 168; -- 168 이상
-- WHERE STU_HEIGHT > 168; -- 168 초과

-- 조건이 2개이상일 때 
-- AND(2개 이상 '모두' 만족할 때), OR('1개' 라도 만족할 때)

-- 전기전자과 이면서 성별이 남자(STU_GENDER가 'M')인 학생 조회
SELECT *
FROM STUDENT
WHERE STU_DEPT = '전기전자' AND STU_GENDER = 'M';

-- '컴퓨터정보' 학과 이거나 3학년인 학생(STU_GRADE가 3) 조회
SELECT *
FROM STUDENT
WHERE STU_DEPT = '컴퓨터정보' OR STU_GRADE = 3;

-- 1학년이거나 3학년인 학생 출력
SELECT *
FROM STUDENT
WHERE STU_GRADE IN(1, 3);
-- WHERE STU_GRADE = 1 OR STU_GRADE = 3;

-- NULL 은 빈 값을 의미
-- NULL에 대한 조건

SELECT *
FROM STUDENT
WHERE STU_HEIGHT IS NOT NULL; -- 키가 NULL이 아닌 학생들
-- WHERE STU_HEIGHT IS NULL; -- 키가 NULL값인 학생들


-- LIKE - 특정 단어 포함
-- % => 여러글자 포함, _(언더바) => 한글자 
SELECT *
FROM STUDENT
WHERE STU_NO LIKE '2015____';
-- WHERE STU_NO LIKE '%5';

