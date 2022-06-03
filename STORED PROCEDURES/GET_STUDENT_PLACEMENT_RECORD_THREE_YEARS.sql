
BEGIN TRANSACTION

CREATE TABLE #Placed2019(
	BIN VARCHAR(2),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255),
	DATA_SHEET_FOR_YEAR NUMERIC
)

INSERT INTO #Placed2019
SELECT  1, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'0 to 2.5 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 0 AND grup.CTC <=  2.5
 UNION
 SELECT 2, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'2.5 to 5 Lakhs Per Annum',
		2019
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 2.5 AND grup.CTC <= 5
  UNION
 SELECT 3, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'5 to 7.5 Lakhs Per Annum',
		2019
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 5 AND grup.CTC <= 7.5
 UNION
 SELECT 4, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'7.5 to 10 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 7.5 AND grup.CTC <= 10
 UNION
 SELECT 5, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'10 to 12.5 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <=12.5
 UNION
 SELECT 6, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'12.5 to 15 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 12.5 AND grup.CTC <=15
 UNION
 SELECT 7, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'15 to 17.5 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <=17.5
 UNION
 SELECT 8, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'17.5 to 20 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 17.5 AND grup.CTC <=20
 UNION
 SELECT 9, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'20 to 25 Lakhs Per Annum',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20 AND grup.CTC <=25
 UNION
 SELECT 10, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'25 Lakhs Per Annum and Above',
		2019
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25


 --SELECT *
 --  FROM #Placed2019

--  SELECT pld.BIN, SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS_PLACED, pld.BIN_DESC
--    FROM #Placed2019 AS pld
--GROUP BY pld.BIN, pld.BIN_DESC
--UNION
-- SELECT 'TOTAL', SUM(NUM_OF_STUDENTS_PLACED), ''
--   FROM #Placed2019

 -- SELECT pld.BIN, SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, pld.BIN_DESC
 --    FROM #Placed2019 AS pld
 --GROUP BY pld.BIN, pld.BIN_DESC
	--UNION
   --SELECT 'TOTAL', SUM(pld.NUM_OF_STUDENTS_PLACED)
   --  FROM #Placed2019 AS pld



   CREATE TABLE #Placed2020(
	BIN VARCHAR(2),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255),
	DATA_SHEET_FOR_YEAR NUMERIC
)

INSERT INTO #Placed2020
SELECT  1, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'0 to 2.5 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 0 AND grup.CTC <=  2.5
 UNION
 SELECT 2, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'2.5 to 5 Lakhs Per Annum',
		2020
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData]AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 2.5 AND grup.CTC <= 5
  UNION
 SELECT 3, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'5 to 7.5 Lakhs Per Annum',
		2020
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 5 AND grup.CTC <= 7.5
 UNION
 SELECT 4, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'7.5 to 10 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 7.5 AND grup.CTC <= 10
 UNION
 SELECT 5, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'10 to 12.5 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <=12.5
 UNION
 SELECT 6, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'12.5 to 15 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 12.5 AND grup.CTC <=15
 UNION
 SELECT 7, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'15 to 17.5 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <=17.5
 UNION
 SELECT 8, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'17.5 to 20 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 17.5 AND grup.CTC <=20
 UNION
 SELECT 9, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'20 to 25 Lakhs Per Annum',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20 AND grup.CTC <=25
 UNION
 SELECT 10, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'25 Lakhs Per Annum and Above',
		2020
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25

CREATE TABLE #Placed2021(
	BIN VARCHAR(2),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255),
	DATA_SHEET_FOR_YEAR NUMERIC
)

INSERT INTO #Placed2021
SELECT  1, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'0 to 2.5 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 0 AND grup.CTC <=  2.5
 UNION
 SELECT 2, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'2.5 to 5 Lakhs Per Annum',
		2021
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 2.5 AND grup.CTC <= 5
  UNION
 SELECT 3, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'5 to 7.5 Lakhs Per Annum',
		2021
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 5 AND grup.CTC <= 7.5
 UNION
 SELECT 4, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'7.5 to 10 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 7.5 AND grup.CTC <= 10
 UNION
 SELECT 5, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'10 to 12.5 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <=12.5
 UNION
 SELECT 6, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'12.5 to 15 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 12.5 AND grup.CTC <=15
 UNION
 SELECT 7, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'15 to 17.5 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <=17.5
 UNION
 SELECT 8, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'17.5 to 20 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData]AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 17.5 AND grup.CTC <=20
 UNION
 SELECT 9, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'20 to 25 Lakhs Per Annum',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20 AND grup.CTC <=25
 UNION
 SELECT 10, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		'25 Lakhs Per Annum and Above',
		2021
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25


 CREATE TABLE #BINS(
	BIN VARCHAR(2),
	BIN_DESC VARCHAR(50)
 )

 INSERT INTO #BINS
 VALUES (1,'0 to 2.5 Lakhs Per Annum'),
		(2,'2.5 to 5 Lakhs Per Annum'),
		(3,'5 to 7.5 Lakhs Per Annum'),
		(4,'7.5 to 10 Lakhs Per Annum'),
		(5,'10 to 12.5 Lakhs Per Annum'),
		(6,'12.5 to 15 Lakhs Per Annum'),
		(7,'15 to 17.5 Lakhs Per Annum'),
		(8,'17.5 to 20 Lakhs Per Annum'),
		(9,'20 to 25 Lakhs Per Annum'),
		(10,'25 Lakhs Per Annum and Above')
		
 --SELECT b.BIN AS Bin,
	--	b.BIN_DESC AS Bin_Description,
	--	plt21.NUM_OF_STUDENTS AS Total_students_Placed_2021,
	--	plt20.NUM_OF_STUDENTS AS Total_students_Placed_2020,
	--	plt19.NUM_OF_STUDENTS AS Total_students_Placed_2019
 -- FROM #BINS AS b
 -- LEFT
 -- JOIN (SELECT pld.BIN, 
	--			SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS,	
	--			pld.BIN_DESC
 --          FROM #Placed2021 AS pld
 --      GROUP BY pld.BIN, 
	--			pld.BIN_DESC) AS plt21 ON b.BIN = plt21.BIN
 --  LEFT 
 --  JOIN (SELECT pld.BIN, 
	--			SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
	--			pld.BIN_DESC
	--		FROM #Placed2020 AS pld
	--	GROUP BY pld.BIN, 
	--			 pld.BIN_DESC) AS plt20 ON b.BIN = plt20.BIN
 --  LEFT 
 --  JOIN (SELECT pld.BIN, 
	--			SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
	--			pld.BIN_DESC
	--		FROM #Placed2019 AS pld
	--	GROUP BY pld.BIN, 
	--			 pld.BIN_DESC) AS plt19 ON b.BIN = plt19.BIN

DECLARE @top INT

SET @top =(SELECT CEILING( COUNT(*)*.2) 
			FROM (SELECT DISTINCT p.COMPANY
					FROM #Placed2020 AS p
					GROUP BY p.COMPANY) AS COMPANIES)

SELECT 'TOP 20 Percent Companies in which highest number of students were placed' + 'The Company count is' + STR(@top)

--SELECT TOP (@top)  p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed, p.BIN
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY, p.BIN
--     ORDER BY 2 DESC


--SELECT 'Top companies that hired students and average CTC'

SELECT plt20.COMPANY, SUM(p.CTC*p.NUM_OF_STUDENTS_PLACED)/SUM(p.NUM_OF_STUDENTS_PLACED), AVG(p.CTC), plt20.BIN
	FROM (SELECT TOP (@top)  p.COMPANY, 
							 SUM(p.NUM_OF_STUDENTS_PLACED) AS placed, 
							 p.BIN
			FROM #Placed2020 as p
		GROUP BY p.COMPANY, 
				 p.BIN
		ORDER BY placed DESC) AS plt20
    JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
	                     AND plt20.BIN = p.BIN
GROUP BY plt20.COMPANY, plt20.BIN
--SELECT TOP (@top) p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY
--     ORDER BY 2 DESC



--SELECT plt.COMPANY, AVG(p.CTC)
--FROM  (SELECT TOP 10 p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY
--     ORDER BY placed DESC) AS plt
--JOIN #Placed2020 AS p ON plt.COMPANY = p.COMPANY
--GROUP BY plt.COMPANY

SELECT 'BOTTOM 20 Percent Companies in which lowest number of students were placed' + 'The Company Count is' + STR(@top)

--SELECT TOP (@top) p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed, p.BIN
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY, p.BIN
--     ORDER BY 2 ASC


SELECT plt20.COMPANY, SUM(p.CTC * p.NUM_OF_STUDENTS_PLACED)/SUM(p.NUM_OF_STUDENTS_PLACED), AVG(p.CTC), plt20.BIN
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

--SELECT TOP (@top) p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY
--     ORDER BY 2 ASC


--SELECT plt.COMPANY, SUM(p.CTC * p.NUM_OF_STUDENTS_PLACED)/SUM(p.NUM_OF_STUDENTS_PLACED), AVG(p.CTC)
--FROM  (SELECT TOP 10 p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED) AS placed
--         FROM #Placed2020 as p
--     GROUP BY p.COMPANY
--     ORDER BY placed ASC) AS plt
--JOIN #Placed2020 AS p ON plt.COMPANY = p.COMPANY
--GROUP BY plt.COMPANY

SELECT 'TOP 20 PERCENT COMPANIES THAT OFFERED THE MAXIMUM CTC'

SELECT p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED), p.BIN, plt20.Avg_CTC
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


SELECT 'BOTTOM 20 PERCENT COMPANIES THAT OFFERED THE MINIMUM CTC'

SELECT p.COMPANY, SUM(p.NUM_OF_STUDENTS_PLACED),p.BIN, plt20.Avg_CTC
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



--SELECT *
--  FROM( SELECT TOP 10 plt.COMPANY, plt.CTC
--		  FROM #Placed2020 AS plt
--      GROUP BY plt.COMPANY, plt.CTC
--      ORDER BY plt.CTC DESC) AS plt20
--  JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
-- ORDER BY p.CTC DESC


-- SELECT *
--  FROM( SELECT TOP 10 plt.COMPANY, plt.CTC
--		  FROM #Placed2020 AS plt
--      GROUP BY plt.COMPANY, plt.CTC
--      ORDER BY plt.CTC ASC) AS plt20
--  JOIN #Placed2020 AS p ON plt20.COMPANY = p.COMPANY 
-- ORDER BY p.CTC ASC









DROP TABLE #Placed2021
DROP TABLE #Placed2020
DROP TABLE #Placed2019
DROP TABLE #BINS

ROLLBACK