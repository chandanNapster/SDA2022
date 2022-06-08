
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
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
		   AND tbl.CTC IS NOT NULL
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25


 CREATE TABLE #ThreeYearData(
	BIN VARCHAR(2),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255),
	DATA_SHEET_FOR_YEAR NUMERIC
 
 )

INSERT INTO #ThreeYearData
SELECT *
FROM (SELECT *
		FROM #Placed2019
	   UNION
	  SELECT *
	    FROM #Placed2020
	   UNION
	  SELECT *
	  FROM #Placed2021 ) AS tab 


CREATE TABLE #Duplicate_Companies_1(
	COMPANY VARCHAR(255)
)


CREATE TABLE #Duplicate_Companies_2(
	COMPANY VARCHAR(255)
)

CREATE TABLE #Duplicate_Companies_3(
	COMPANY VARCHAR(255)
)


SELECT 'FINDING DUPLICATES COMPANIES'

--SELECT td.COMPANY
--FROM #ThreeYearData AS td
--GROUP BY td.COMPANY
--ORDER BY td.COMPANY

INSERT INTO #Duplicate_Companies_1
SELECT DISTINCT t.COMPANY
FROM #ThreeYearData AS t 
JOIN #ThreeYearData AS t1 ON t.COMPANY LIKE t1.COMPANY + '% %'

INSERT INTO #Duplicate_Companies_2 
SELECT DISTINCT t1.COMPANY
FROM #ThreeYearData AS t
JOIN #ThreeYearData AS t1 ON t.COMPANY LIKE t1.COMPANY + '% %'



--SELECT DISTINCT t.COMPANY, t1.COMPANY
--FROM #ThreeYearData AS t 
--JOIN #ThreeYearData AS t1 ON t.COMPANY = SOUNDEX(t1.COMPANY)
--ORDER BY t.COMPANY

INSERT INTO #Duplicate_Companies_3 
SELECT p.COMPANY
FROM (SELECT *
		FROM #Duplicate_Companies_1
	   UNION
	  SELECT *
		FROM #Duplicate_Companies_2) AS p


SELECT dc.COMPANY
FROM #Duplicate_Companies_3 AS dc


--SELECT *
--  FROM #ThreeYearData AS tc
-- WHERE tc.COMPANY IN (SELECT * FROM #Duplicate_Companies_3)

--SELECT *
--FROM #ThreeYearData
--EXCEPT
--SELECT *
--  FROM #ThreeYearData AS tc
-- WHERE tc.COMPANY IN (SELECT * FROM #Duplicate_Companies_3)

--SELECT 'JUST COMPANIES'
--SELECT p19.COMPANY
--FROM #Placed2019 AS p19
--GROUP BY p19.COMPANY

--SELECT p20.COMPANY
--FROM #Placed2020 AS p20
--GROUP BY p20.COMPANY

--SELECT p21.COMPANY
--FROM #Placed2021 AS p21
--GROUP BY p21.COMPANY


--SELECT *
--FROM #ThreeYearData
--WHERE COURSE = 'B.Tech Computer Science Engineering with Spl. In IT Infrastructure Management '




--SELECT 'ALL COMPANIES'
--SELECT COMPANY, COUNT(*) 
--FROM #ThreeYearData 
--GROUP BY COMPANY
--ORDER BY 1


--SELECT 'ALL DATA FOR THREE YEARS'
--SELECT *
--  FROM #ThreeYearData
--WHERE COMPANY = 'NxtGen'


	

SELECT 'COMPANIES THAT VISITED FOR ALL THREE YEARS'

SELECT tab.COMPANY, 
	   SUM(tab.CTC*tab.NUM_OF_STUDENTS_PLACED)/SUM(tab.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
FROM (SELECT *
		FROM #Placed2019
	   UNION
	  SELECT *
	    FROM #Placed2020
	   UNION
	  SELECT *
	  FROM #Placed2021 ) AS tab
WHERE EXISTS (SELECT * FROM #Placed2019 AS p19 WHERE p19.COMPANY = tab.COMPANY) 	
  AND EXISTS (SELECT * FROM #Placed2020 AS p20 WHERE p20.COMPANY = tab.COMPANY) 
  AND EXISTS (SELECT * FROM #Placed2021 AS p21 WHERE p21.COMPANY = tab.COMPANY) 
GROUP BY tab.COMPANY

SELECT 'COMPANIES THAT ONLY VISITED IN 2020 AND 2021 BUT NOT IN 2019'
SELECT tab.COMPANY, 
	   SUM(tab.CTC*tab.NUM_OF_STUDENTS_PLACED)/SUM(tab.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
FROM (SELECT *
		FROM #Placed2019
	   UNION
	  SELECT *
	    FROM #Placed2020
	   UNION
	  SELECT *
	  FROM #Placed2021 ) AS tab
WHERE NOT EXISTS (SELECT * FROM #Placed2019 AS p19 WHERE p19.COMPANY = tab.COMPANY) 	
  AND EXISTS (SELECT * FROM #Placed2020 AS p20 WHERE p20.COMPANY = tab.COMPANY) 
  AND EXISTS (SELECT * FROM #Placed2021 AS p21 WHERE p21.COMPANY = tab.COMPANY) 
GROUP BY tab.COMPANY


SELECT 'COMPANIES THAT ONLY VISITED IN 2019 AND 2020 BUT NOT IN 2021'
SELECT tab.COMPANY, 
	   SUM(tab.CTC*tab.NUM_OF_STUDENTS_PLACED)/SUM(tab.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
FROM (SELECT *
		FROM #Placed2019
	   UNION
	  SELECT *
	    FROM #Placed2020
	   UNION
	  SELECT *
	  FROM #Placed2021 ) AS tab
WHERE EXISTS (SELECT * FROM #Placed2019 AS p19 WHERE p19.COMPANY = tab.COMPANY) 	
  AND EXISTS (SELECT * FROM #Placed2020 AS p20 WHERE p20.COMPANY = tab.COMPANY) 
  AND NOT EXISTS (SELECT * FROM #Placed2021 AS p21 WHERE p21.COMPANY = tab.COMPANY) 
GROUP BY tab.COMPANY


SELECT 'COMPANIES THAT ONLY VISITED IN 2019 AND 2021 BUT NOT IN 2020'
SELECT tab.COMPANY, 
	   SUM(tab.CTC*tab.NUM_OF_STUDENTS_PLACED)/SUM(tab.NUM_OF_STUDENTS_PLACED) AS AVG_CTC
FROM (SELECT *
		FROM #Placed2019
	   UNION
	  SELECT *
	    FROM #Placed2020
	   UNION
	  SELECT *
	  FROM #Placed2021 ) AS tab
WHERE EXISTS (SELECT * FROM #Placed2019 AS p19 WHERE p19.COMPANY = tab.COMPANY) 	
  AND NOT EXISTS (SELECT * FROM #Placed2020 AS p20 WHERE p20.COMPANY = tab.COMPANY) 
  AND EXISTS (SELECT * FROM #Placed2021 AS p21 WHERE p21.COMPANY = tab.COMPANY) 
GROUP BY tab.COMPANY

--SELECT *
--  FROM #Placed2019 
--  WHERE COMPANY = 'AIS'
--WHERE COMPANY IN ('Jaro Education', 'Cognizant Technology Solutions','MAQ Software','Synopsys','Vmware','Xebia')


--SELECT DISTINCT p.COMPANY
--FROM #Placed2019 AS p
--SELECT *
--FROM #Placed2019
--WHERE COMPANY = 'IHS Markit'

SELECT 'TOTAL NUMBER OF STUDENTS PLACED IN ALL THREE YEARS'
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
		
 SELECT b.BIN AS Bin,
		b.BIN_DESC AS Bin_Description,
		plt21.NUM_OF_STUDENTS AS Total_students_Placed_2021,
		plt20.NUM_OF_STUDENTS AS Total_students_Placed_2020,
		plt19.NUM_OF_STUDENTS AS Total_students_Placed_2019
  FROM #BINS AS b
  LEFT
  JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS,	
				pld.BIN_DESC
           FROM #Placed2021 AS pld
       GROUP BY pld.BIN, 
				pld.BIN_DESC) AS plt21 ON b.BIN = plt21.BIN
   LEFT 
   JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
				pld.BIN_DESC
			FROM #Placed2020 AS pld
		GROUP BY pld.BIN, 
				 pld.BIN_DESC) AS plt20 ON b.BIN = plt20.BIN
   LEFT 
   JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
				pld.BIN_DESC
			FROM #Placed2019 AS pld
		GROUP BY pld.BIN, 
				 pld.BIN_DESC) AS plt19 ON b.BIN = plt19.BIN


--EXEC sp_get_Course_Company_CTC '2020'


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
DROP TABLE #Duplicate_Companies_1
DROP TABLE #Duplicate_Companies_2
DROP TABLE #Duplicate_Companies_3 

ROLLBACK