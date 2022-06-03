--A STORED PROCEDURE FOR
--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED AND PRESENTED IN FROM OF BINS SUCH AS 
-- CTC 0-5
-- CTC 5-10
-- CTC 10-15
-- CTC 15-20
-- CTC 20 and ABOVE
USE [SDA2019]
GO 

IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'sp_get_Course_Company_CTC_2019')

	DROP PROCEDURE sp_get_Course_Company_CTC_2019   
GO

CREATE PROCEDURE sp_get_Course_Company_CTC_2019
AS

CREATE TABLE #Placed2019(
	BIN VARCHAR(2),
	COMPANY VARCHAR(250),
	COURSE VARCHAR(250),
	CTC MONEY,
	NUM_OF_STUDENTS_PLACED NUMERIC(20),
	BIN_DESC VARCHAR(255)
)

INSERT INTO #Placed2019
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


 SELECT *
   FROM #Placed2019

  SELECT pld.BIN, SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS_PLACED, pld.BIN_DESC
    FROM #Placed2019 AS pld
GROUP BY pld.BIN, pld.BIN_DESC
UNION
 SELECT 'TOTAL', SUM(NUM_OF_STUDENTS_PLACED), ''
   FROM #Placed2019

 -- SELECT pld.BIN, SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, pld.BIN_DESC
 --    FROM #Placed2019 AS pld
 --GROUP BY pld.BIN, pld.BIN_DESC
	--UNION
   --SELECT 'TOTAL', SUM(pld.NUM_OF_STUDENTS_PLACED)
   --  FROM #Placed2019 AS pld


DROP TABLE #Placed2019