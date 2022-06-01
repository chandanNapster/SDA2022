--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED AND PRESENTED IN FROM OF BINS SUCH AS 
-- CTC 0-5
-- CTC 5-10
-- CTC 10-15
-- CTC 15-20
-- CTC 20 and ABOVE
BEGIN TRANSACTION

CREATE TABLE #Placed2021(
	BIN VARCHAR(255),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20)
)

INSERT INTO #Placed2021
SELECT 'BIN05'   AS BIN, 
		grup.Company AS COMPANY, 
		grup.Course  AS COURSE, 
		grup.CTC     AS CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS AS NUM_STUDENTS_PLACED
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 0 AND grup.CTC <= 5
 UNION
 SELECT 'BIN510' AS BIN, grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 5 AND grup.CTC <= 10
  UNION
 SELECT 'BIN1015' AS BIN, grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <= 15
 UNION
 SELECT 'BIN1520' AS BIN, grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <= 20
 UNION
 SELECT 'BIN20100' AS BIN, grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20


--  SELECT pld.COMPANY, AVG(pld.CTC) AS AVERAGE_PACKAGE
--    FROM #Placed2021 AS pld
--GROUP BY pld.COMPANY
--  HAVING AVG(pld.CTC) < 3
--ORDER BY 2 DESC


--SELECT *
--  FROM #Placed2021
  

   SELECT pld.BIN, SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS
     FROM #Placed2021 AS pld
 GROUP BY pld.BIN
    UNION
   SELECT 'TOTAL', SUM(pld.NUM_OF_STUDENTS_PLACED)
     FROM #Placed2021 AS pld

DROP TABLE #Placed2021

ROLLBACK