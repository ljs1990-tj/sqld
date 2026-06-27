-- SELECT(데이터 조회), INSERT(데이터 삽입)
-- UPDATE(데이터 수정), DELETE(데이터 삭제)

SELECT * 
FROM STUDENT 
WHERE STU_NAME = '옥한빛';


-- INSERT (모든 컬럼에 값을 넣을 때는 컬럼명 생략이 가능)
INSERT INTO STUDENT
VALUES('98761234', '홍길동', '컴퓨터정보', 2, 'A', 'M', 170, 60);

-- INSERT (특정 컬럼에만 값을 넣을때는 컬럼명 입력)
-- 학번, 이름, 학과, 성별
INSERT INTO STUDENT(STU_NO, STU_NAME, STU_DEPT, STU_GENDER)
VALUES('12341099', '홍길동', '전기전자', 'F');

SELECT * FROM STUDENT;
COMMIT; -- 데이터 수정(삽입,수정,삭제)을 확정, 커밋 이후에는 롤백 불가
ROLLBACK; -- 데이터 수정(삽입,수정,삭제)이 확정(COMMIT)되기전 되돌리기

-- 수정 (UPDATE)
-- 조건을 잘 주는게 중요!

UPDATE STUDENT
SET
    STU_GRADE = 3,
    STU_HEIGHT = STU_HEIGHT + 1
WHERE STU_NO = '98761234';
-- WHERE STU_NAME = '홍길동';

COMMIT;
ROLLBACK;
SELECT * FROM STUDENT;


-- 삭제
-- 조건이 중요!
-- DELETE FROM 테이블명 WHERE 조건

DELETE FROM STUDENT
WHERE STU_HEIGHT = '12341000';











