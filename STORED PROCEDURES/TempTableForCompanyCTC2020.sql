--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED AND PRESENTED IN FROM OF BINS SUCH AS 
-- CTC 0-5
-- CTC 5-10
-- CTC 10-15
-- CTC 15-20
-- CTC 20 and ABOVE
USE SDA2020
GO

BEGIN TRANSACTION
DECLARE @top INT
DECLARE @percentage FLOAT
SET @percentage = 0.35


CREATE TABLE #Placed2020(
	BIN VARCHAR(2),
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData]AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
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
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%'
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25





SET @top =(SELECT CEILING( COUNT(*)*(@percentage)) 
			FROM (SELECT DISTINCT p.COMPANY
					FROM #Placed2020 AS p
					GROUP BY p.COMPANY) AS COMPANIES)

CREATE TABLE #High_Placed(
	COMPANY VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #Low_Placed(
	COMPANY VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #High_CTC_Offered(
	COMPANY VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)

CREATE TABLE #Low_CTC_Offered(
	COMPANY VARCHAR(255),
	NUM_STUDENTS NUMERIC,
	BIN INT,
	AVG_CTC MONEY
)





--SELECT 'TOP 20 PERCENT COMPANIES IN WHICH HIGHEST NUMBER OF STUDENTS WERE PLACED' + 'THE COMPANY COUNT IS' + STR(@top)

INSERT INTO #High_Placed

SELECT plt20.COMPANY, 
	   SUM(p.NUM_OF_STUDENTS_PLACED), 
	   plt20.BIN,
	   SUM(p.CTC*p.NUM_OF_STUDENTS_PLACED)/SUM(p.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
	FROM (SELECT TOP (@top)  p.COMPANY, 
							 SUM(p.NUM_OF_STUDENTS_PLACED) AS placed, 
							 p.BIN
			FROM #Placed2020 as p
		GROUP BY p.COMPANY, 
				 p.BIN
		ORDER BY placed DESC) AS plt20
    JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
	                     AND plt20.BIN = p.BIN
GROUP BY plt20.COMPANY,
		 plt20.BIN


--SELECT 'BOTTOM 20 PERCENT COMPANIES IN WHICH LOWEST NUMBER OF STUDENTS WERE PLACED' + 'THE COMPANY COUNT IS' + STR(@top)

INSERT INTO #Low_Placed
SELECT plt20.COMPANY, 
	   SUM(p.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS_PLACED, 
	   plt20.BIN,
	   SUM(p.CTC * p.NUM_OF_STUDENTS_PLACED)/SUM(p.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
FROM (SELECT TOP (@top) p.COMPANY, 
						SUM(p.NUM_OF_STUDENTS_PLACED) AS placed, 
						p.BIN
         FROM #Placed2020 as p
     GROUP BY p.COMPANY, 
			  p.BIN
     ORDER BY placed ASC) AS plt20
JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
                     AND plt20.BIN = p.BIN
GROUP BY plt20.COMPANY, plt20.BIN



--SELECT 'TOP 20 PERCENT COMPANIES THAT OFFERED THE MAXIMUM CTC'

INSERT INTO #High_CTC_Offered
SELECT p.COMPANY, 
	   SUM(p.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS_PLACED, 
	   p.BIN, 
	   plt20.Avg_CTC
FROM (SELECT TOP (@top) plt.COMPANY, 
					SUM(plt.CTC * plt.NUM_OF_STUDENTS_PLACED)/SUM(plt.NUM_OF_STUDENTS_PLACED) AS Avg_CTC, 
					plt.BIN AS BIN
			FROM #Placed2020 AS plt
		GROUP BY plt.COMPANY, 
				 plt.BIN
		ORDER BY 2 DESC) AS plt20
JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
					 AND plt20.BIN = p.BIN
GROUP BY p.COMPANY, 
		 p.BIN,
		 plt20.Avg_CTC
ORDER BY plt20.Avg_CTC DESC


--SELECT 'BOTTOM 20 PERCENT COMPANIES THAT OFFERED THE MINIMUM CTC'

INSERT INTO #Low_CTC_Offered
SELECT p.COMPANY, 
	   SUM(p.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS_PLACED,
	   p.BIN, 
	   plt20.Avg_CTC
 FROM (SELECT TOP (@top) plt.COMPANY, 
					SUM(plt.CTC * plt.NUM_OF_STUDENTS_PLACED)/SUM(plt.NUM_OF_STUDENTS_PLACED) AS Avg_CTC, 
					plt.BIN AS BIN
    FROM #Placed2020 AS plt
GROUP BY plt.COMPANY, 
		 plt.BIN
ORDER BY 2 ASC) AS plt20
JOIN #Placed2020 AS p ON p.COMPANY = plt20.COMPANY 
                     AND p.BIN = plt20.BIN
GROUP BY p.COMPANY, 
		 p.BIN,
		 plt20.Avg_CTC
ORDER BY plt20.Avg_CTC DESC


SELECT 'COMPANIES TAKING MAXIMUM STUDENTS'
  SELECT *
    FROM #High_Placed
ORDER BY 2 DESC


SELECT 'COMPANIES TAKING MINIMUM STUDENTS'  
SELECT *
  FROM #Low_Placed


SELECT 'COMPANIES GIVING MAXIMUM CTC'
  SELECT *
    FROM #High_CTC_Offered
ORDER BY 4 DESC

SELECT 'COMPANIES GAVING MINIMUM CTC'

  SELECT *
    FROM #Low_CTC_Offered
ORDER BY 4 DESC


SELECT 'HIGH PLACED LOW CTC'
SELECT *
  FROM #High_Placed AS hp
  JOIN #Low_CTC_Offered AS lc ON hp.COMPANY = lc.COMPANY 
                             AND hp.BIN = lc.BIN

SELECT 'LOW PLACED HIGH CTC'
SELECT *
  FROM #Low_Placed AS lp
  JOIN #High_CTC_Offered AS hc ON lp.COMPANY = hc.COMPANY
                              AND lp.BIN = hc.BIN


SELECT 'HIGH PLACED HIGH CTC'
SELECT *
  FROM #High_Placed AS hp
  JOIN #High_CTC_Offered AS hc ON hp.COMPANY = hc.COMPANY
							  AND hp.BIN = hc.BIN

SELECT 'LOW PLACED LOW CTC'
SELECT *
  FROM #Low_Placed AS lp
  JOIN #Low_CTC_Offered AS lc ON lp.COMPANY = lc.COMPANY
							 AND lp.BIN = lc.BIN


DROP TABLE #Placed2020
DROP TABLE #High_Placed
DROP TABLE #Low_Placed
DROP TABLE #High_CTC_Offered
DROP TABLE #Low_CTC_Offered

ROLLBACK