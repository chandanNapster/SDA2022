--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED AND PRESENTED IN FROM OF BINS SUCH AS 
-- CTC 0-5
-- CTC 5-10
-- CTC 10-15
-- CTC 15-20
-- CTC 20 and ABOVE
USE SDA2019
GO

BEGIN TRANSACTION

DECLARE @top INT
DECLARE @percentage FLOAT
SET @percentage = 0.250

CREATE TABLE #Placed2020(
	BIN INT,
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255)
)

INSERT INTO #Placed2020
SELECT  1, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'0 to 2.5 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 0 AND grup.CTC <=  2.5
 UNION
 SELECT 2, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'2.5 to 5 Lakhs Per Annum'
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData]AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 2.5 AND grup.CTC <= 5
  UNION
 SELECT 3, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'5 to 7.5 Lakhs Per Annum'
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 5 AND grup.CTC <= 7.5
 UNION
 SELECT 4, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'7.5 to 10 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 7.5 AND grup.CTC <= 10
 UNION
 SELECT 5, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'10 to 12.5 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <=12.5
 UNION
 SELECT 6, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'12.5 to 15 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 12.5 AND grup.CTC <=15
 UNION
 SELECT 7, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'15 to 17.5 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <=17.5
 UNION
 SELECT 8, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'17.5 to 20 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 17.5 AND grup.CTC <=20
 UNION
 SELECT 9, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'20 to 25 Lakhs Per Annum'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20 AND grup.CTC <=25
 UNION
 SELECT 10, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'25 Lakhs Per Annum and Above'
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25



CREATE TABLE #High_Placed(
	COURSE VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #Low_Placed(
	COURSE VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #High_CTC_Offered(
	COURSE VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #Low_CTC_Offered(
	COURSE VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)


SET @top =(SELECT CEILING( COUNT(*)*(@percentage)) 
			FROM (SELECT p.COURSE
					FROM #Placed2020 AS p
					GROUP BY p.COURSE) AS COURSES)


INSERT INTO #High_Placed
SELECT p.COURSE,
	   plt.NUMBER_OF_STUDENTS_PLACED, 
	   p.BIN, 
	   AVG(plt.AVG_CTC) AS AVG_CTC
FROM #Placed2020 AS p
JOIN (SELECT TOP (@top) plt20.COURSE, 
					    SUM(plt20.NUM_OF_STUDENTS_PLACED) AS NUMBER_OF_STUDENTS_PLACED,
						plt20.BIN,
						AVG(plt20.CTC) AS AVG_CTC
			FROM #Placed2020 AS plt20
		GROUP BY plt20.COURSE,
				 plt20.BIN
		ORDER BY 2 DESC) AS plt ON p.COURSE = plt.COURSE 
							   AND p.BIN = plt.BIN 	
GROUP BY p.COURSE, 
		 plt.NUMBER_OF_STUDENTS_PLACED,
		 p.BIN



INSERT INTO #Low_Placed
 SELECT p.COURSE, 
		plt.NUMBER_OF_STUDENTS_PLACED,
	   p.BIN,
	   AVG(plt.AVG_CTC) AS AVG_CTC
FROM #Placed2020 AS p
JOIN (SELECT TOP (@top) plt20.COURSE, 
					    SUM(plt20.NUM_OF_STUDENTS_PLACED) AS NUMBER_OF_STUDENTS_PLACED,
						plt20.BIN,
						AVG(plt20.CTC) AS AVG_CTC
			FROM #Placed2020 AS plt20
		GROUP BY plt20.COURSE,
				 plt20.BIN
		ORDER BY 2 ASC) AS plt ON p.COURSE = plt.COURSE 
							   AND p.BIN = plt.BIN 	
GROUP BY p.COURSE, 
		 plt.NUMBER_OF_STUDENTS_PLACED,
		 p.BIN		



INSERT INTO #High_CTC_Offered
 SELECT p.COURSE, 
		SUM(p.NUM_OF_STUDENTS_PLACED) AS NUMBER_OF_STUDENTS_PLACED,
		p.BIN, 
		plt.AVG_CTC
 FROM #Placed2020 AS p
 JOIN (SELECT TOP (@top) plt20.COURSE, 
						 AVG(plt20.CTC) AS AVG_CTC,
						 plt20.BIN
			 FROM #Placed2020 AS plt20
		 GROUP BY plt20.COURSE,
				  plt20.BIN
		 ORDER BY 2 DESC) AS plt ON p.COURSE = plt.COURSE 
										AND p.BIN = plt.BIN
GROUP BY p.COURSE, 
		 plt.AVG_CTC, 
		 p.BIN										





INSERT INTO #Low_CTC_Offered
SELECT  p.COURSE,
		SUM(p.NUM_OF_STUDENTS_PLACED) AS NUMBER_OF_STUDENTS_PLACED,
		p.BIN, 
		plt.AVG_CTC		
 FROM #Placed2020 AS p
 JOIN (SELECT TOP (@top) plt20.COURSE, 
						 AVG(plt20.CTC) AS AVG_CTC,
						 plt20.BIN
			 FROM #Placed2020 AS plt20
		 GROUP BY plt20.COURSE,
				  plt20.BIN
		 ORDER BY 2 ASC) AS plt ON p.COURSE = plt.COURSE 
							   AND p.BIN = plt.BIN
GROUP BY p.COURSE, 
		 plt.AVG_CTC, 
		 p.BIN	


SELECT 'TOP X PERCENT COURSE FROM WHICH MAXIMUM NUMBER OF STUDENTS WERE PLACED'
SELECT *
  FROM #High_Placed

SELECT 'BOTTOM X PERCENT COURSE FROM WHICH MINIMUM NUMBER OF STUDENTS WERE PLACED'
SELECT *
  FROM #Low_Placed

SELECT 'TOP X PERCENT COURSES WHERE STUDENTS GOT MAXIMUM CTC'
SELECT *
  FROM #High_CTC_Offered

SELECT 'BOTTOM X PERCENT COURSES WHERE STUDENTS GOT MINIMUM CTC'
SELECT *
  FROM #Low_CTC_Offered


SELECT 'HIGH PLACED LOW CTC'
SELECT *
  FROM #High_Placed AS hp
  JOIN #Low_CTC_Offered AS lc ON hp.COURSE = lc.COURSE
							 AND hp.BIN = lc.BIN


SELECT 'LOW PLACED HIGH CTC'
SELECT *
  FROM #Low_Placed AS lp
  JOIN #High_CTC_Offered AS hc ON lp.COURSE = hc.COURSE
							  AND lp.BIN = hc.BIN

SELECT 'HIGH PLACED HIGH CTC'
SELECT *
  FROM #High_Placed AS hp
  JOIN #High_CTC_Offered AS hc ON hp.COURSE = hc.COURSE 
							  AND hp.BIN = hc.BIN

SELECT 'LOW PLACED LOW CTC'
SELECT *
  FROM #Low_Placed AS lp
  JOIN #Low_CTC_Offered AS lc ON lp.COURSE = lc.COURSE
							 AND lp.BIN = lc.BIN

DROP TABLE #Placed2020
DROP TABLE #High_Placed
DROP TABLE #Low_Placed
DROP TABLE #High_CTC_Offered
DROP TABLE #Low_CTC_Offered


ROLLBACK