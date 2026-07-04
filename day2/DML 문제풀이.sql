-- Q1. student 테이블에 등록된 모든 학생의 모든 정보(전체 컬럼)를 
-- 조회하는 쿼리를 작성하세요.
SELECT *
FROM STUDENT;
-- Q2. student 테이블에서 학생들의 학번(stu_no), 이름(stu_name), 
-- 학과(stu_dept) 딱 3개의 컬럼만 골라서 조회하는 쿼리를 작성하세요.
SELECT STU_NO, STU_NAME, STU_DEPT
FROM STUDENT;

-- Q3. student 테이블에서 소속 학과(stu_dept)가 '기계'인 학생들의 모든 정보를 조회하는 쿼리를 작성하세요.
SELECT *
FROM STUDENT
WHERE STU_DEPT = '기계';
-- Q4. student 테이블에서 몸무게(stu_weight)가 60kg 이상인 학생들의 이름과 몸무게를 조회하는 쿼리를 작성하세요.
SELECT STU_NAME, STU_WEIGHT
FROM STUDENT
WHERE STU_WEIGHT >= 60;
-- Q5. student 테이블에서 1학년(stu_grade = 1)이면서 동시에 여학생(stu_gender = 'F')인 학생들의 모든 정보를 조회하는 쿼리를 작성하세요.
SELECT *
FROM STUDENT
WHERE STU_GRADE = 1 AND STU_GENDER = 'F';
-- Q6. student 테이블의 모든 학생을 이름(stu_name) 기준 가나다순(오름차순)으로 정렬하여 조회하는 쿼리를 작성하세요.
SELECT *
FROM STUDENT
ORDER BY STU_NAME ASC; -- 오름차순(ASC, 생략가능), 내림차순(DESC)
-- Q7. student 테이블에서 아직 신체검사를 받지 않아 키(stu_height) 정보가 비어있는(NULL) 학생들의 이름과 학과를 조회하는 쿼리를 작성하세요.
SELECT STU_NAME, STU_DEPT
FROM STUDENT
WHERE STU_HEIGHT IS NULL;
-- Q8. student 테이블에서 이름이 '김인중'인 학생의 학년(stu_grade)을 2학년으로 수정하는 쿼리를 작성하세요.
UPDATE STUDENT 
SET 
    STU_GRADE = 2
WHERE STU_NAME = '김인중';
COMMIT; -- 확정
ROLLBACK; -- 커밋전 되돌리기

-- Q9. 수강내역(enrol) 테이블에서 성적이 너무 낮아 취소 처리해야 하는, 점수(enr_grade) 50점 미만의 기록을 모두 삭제하는 쿼리를 작성하세요.
SELECT * FROM ENROL;
DELETE FROM ENROL 
WHERE ENR_GRADE < 50;
ROLLBACK;

-- Q10. 지금까지 수정한 학생의 진급 정보와 삭제한 수강 내역을 메모리에서 하드디스크(데이터베이스)로 영구히 반영하여 확정 짓는 명령어를 작성하세요.
COMMIT;


