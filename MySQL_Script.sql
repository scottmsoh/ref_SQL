

-- CREATE TABLE WHILE CREATING COLUMNS
CREATE TABLE TEST_TV (
	VIDEO_NAME VARCHAR(30),
	VIEW_CNT INT,
	NAME_CAST VARCHAR(30),
	CAST_NUM INT
	);


-- INSERT VALUES INTO COLUMNS
INSERT INTO TEST_TV VALUES ('아저씨','365', '원빈', '5');
INSERT INTO TEST_TV VALUES ('바비', '333', '마고로비', '10');
INSERT INTO TEST_TV VALUES ('바비2', '444', '마고로비', '22');
INSERT INTO TEST_TV VALUES ('아저씨2','3633', '원빈', '33');

-- SELECT TABLE
SELECT * FROM TEST_TV;

-- CHECK EXISTED VALUES IN TABLE
SELECT * FROM TEST_TV WHERE VIDEO_NAME = '아저씨2';

-- DELETE VALUES FROM TABLE 
DELETE FROM TEST_TV WHERE VIDEO_NAME = '아저씨2';

-- CREATE TABLE
CREATE TABLE CAST_INFO (
	VIDEO_NAME VARCHAR(40),
	MAIN_ACT VARCHAR(30),
	SUB_ACT VARCHAR(30),
	MAIN_AGE INT,
	SUB_AGE INT
	);

-- INSERT VALUE IN TABLE
INSERT INTO CAST_INFO VALUES ('아저씨', '원빈', '꼬맹', '30', '14');
INSERT INTO CAST_INFO VALUES ('아저씨2', '원빈', '꼬맹2', '40', '24');
INSERT INTO CAST_INFO VALUES ('바비', '마고로비', '디카프리오', '35', '50');

SELECT * FROM CAST_INFO;

-- View every exsting table in database
SHOW TABLES;

-- Inner Join 
SELECT A.VIDEO_NAME, A.VIEW_CNT, B.MAIN_ACT, B.SUB_ACT, B.MAIN_AGE, B.SUB_AGE  
	FROM TEST_TV A, CAST_INFO B
	WHERE A.VIDEO_NAME = B.VIDEO_NAME;

-- CREATE NEW TABLE AFTER inner Join
CREATE TABLE MERGGED_TABLE AS
SELECT A.VIDEO_NAME, A.VIEW_CNT, B.MAIN_ACT, B.SUB_ACT
	FROM TEST_TV A, CAST_INFO B
	WHERE A.VIDEO_NAME = B.VIDEO_NAME;

SELECT * FROM MERGGED_TABLE;

--  DROP
DROP TABLE MERGGED_TABLE;

-- Outter Join: which will contain every values from left table if columns are empty it will be null
SELECT A.VIDEO_NAME, A.VIEW_CNT, B.MAIN_ACT, B.SUB_ACT
	FROM TEST_TV A
	LEFT OUTER JOIN CAST_INFO B
	ON A.VIDEO_NAME = B.VIDEO_NAME;

-- INNER JOIN
SELECT A.VIDEO_NAME, A.VIEW_CNT, B.MAIN_AGE, B.SUB_AGE
	FROM TEST_TV A, CAST_INFO B
	WHERE A.VIDEO_NAME = B.VIDEO_NAME;

-- LEFT OUTER JOIN
SELECT A.DDD, A.BBB, B.CC, B.AAA
	FROM TABLE_A A
	LEFT OUTER JOIN TABLE_B B
	ON A.MOVIE_NAME = B.MOVIE_NAME;


-- Update table and columns 
ALTER TABLE MERGGED_TABLE
ADD COLUMN MAIN_AGE INT,
ADD COLUMN SUB_AGE INT;


-- Join more columns for exsiting created new table
UPDATE MERGGED_TABLE C
JOIN CAST_INFO D ON C.VIDEO_NAME = D.VIDEO_NAME
SET C.MAIN_AGE = D.MAIN_AGE,
	C.SUB_AGE = D.SUB_AGE;
	
SELECT * FROM MERGGED_TABLE;

COMMIT;
	
-- When I try to connect database directly
-- moving to directory where mysql located in (/usr/local/mysql/bin)
-- 

SELECT User, Host FROM mysql.user;

USE MYSQL;
	
SELECT * FROM MERGGED_TABLE;

-- Data exloration and preprocessing
-- Find Average and Median at specific column


-- AVERAGE
SELECT AVG(VIEW_CNT) AS AVERAGE_CNT
FROM TEST_TV
WHERE VIEW_CNT IS NOT NULL;

-- MEDIAN
SELECT ROUND(VIEW_CNT,2)
FROM(SELECT VIEW_CNT, PERCENT_RANK() OVER (ORDER BY VIEW_CNT) percent
     FROM TEST_TV) a
WHERE percent = 0.5;

-- FIND NULL VALUES IN TABLE AND SPECIFIC COLUMN
SELECT * FROM TEST_TV WHERE VIEW_CNT IS NULL;

-- COUNT NULL VALUE IN COLUMN
SELECT COUNT(*)
FROM TEST_TV
WHERE VIEW_CNT IS NULL;

-- IF MANY COLUMNS
SELECT *
FROM TEST_TV
WHERE column1 IS NULL
   OR column2 IS NULL
   OR column3 IS NULL;
  
  
USE testdb;

show TABLES;

-- Check Database Character Encoding

SHOW CREATE DATABASE testdb;
SHOW CREATE TABLE MERGGED_TABLE;

   
   
-- 예를 들어 상품판매정보,상품정보,고객 데이터,시장 데이터 조인 필요 (KEY ), 어떤 값들은 LEFT JOIN (LEFT는 다 가져오고, 없는 것들은 null 처리)
-- INNER JOIN은 둘이 매칭되는 값만 가져옴 ID가 KEY값이니 매칭되는 것만 가져오는것이 맞음 (INNER JOIN), 

-- KEY 값 INNER JOIN 무조건,

SELECT AAA,
		DDD,
		CCC,
		FFF,
		KKK,
		QQQ,
		EEE
		FROM TABLE_A
		LEFT JOIN;
	
-- INNER JOIN CASE
	
SELECT A.AAA,
		A.BB,
		B.CC
		FROM TABLE_A A, TABLE_B B
		ON A.MOVIE_NAME = B.MOVIE_NAME;
	
-- Groupby 
SELECT CATEGORY, COUNT(*) FROM TEST_TV GROUP BY CATEGORY;
SELECT CATEGORY, SUM(VIEW_CNT) FROM TEST_TV GROUP BY CATEGORY;
SELECT CATEGORY, AVG(VIEW_CNT) FROM TEST_TV GROUP BY CATEGORY;
SELECT CATEGORY, MAX(VIEW_CNT) FROM TEST_TV GROUP BY CATEGORY;
SELECT CATEGORY, MIN(VIEW_CNT) FROM TEST_TV GROUP BY CATEGORY ORDER BY MIN(VIEW_CNT) DESC;
SELECT CATEGORY, MIN(VIEW_CNT) FROM TEST_TV GROUP BY CATEGORY ORDER BY MIN(VIEW_CNT) ASC;
SELECT CATEGORY, MAX(VIEW_CNT), MIN(VIEW_CNT), SUM(VIEW_CNT), COUNT(*) FROM TEST_TV GROUP BY CATEGORY;

SELECT * FROM TEST_TV;

-- ADD NEW COLUMNS
ALTER TABLE TEST_TV
ADD CATEGORY VARCHAR(30);


-- ADD VALUES AT THIS NEW COLUMNS (#1)
UPDATE TEST_TV
SET CATEGORY = '액션'
WHERE VIDEO_NAME = '아저씨';

UPDATE TEST_TV
SET CATEGORY = '로맨스'
WHERE VIDEO_NAME = '바비';


-- ADD VALUES AT THIS NEW COLUMNS (#2)
UPDATE TEST_TV
SET CATEGORY = CASE 
    WHEN VIDEO_NAME = '아저씨2' THEN '액션'
    WHEN VIDEO_NAME = '바비2' THEN '로맨스'
    -- Add more WHEN-THEN pairs for other updates
END
WHERE VIDEO_NAME IN ('아저씨2', '바비2');

SELECT * FROM TEST_TV;

COMMIT;
   
   




-
