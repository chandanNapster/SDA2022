
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
		



 SELECT b.BIN AS Bin,
		b.BIN_DESC AS Bin_Description,
		plt21.DATA_SHEET_FOR_YEAR AS Data_For_Year,
		plt21.NUM_OF_STUDENTS AS Total_students_Placed,
		plt20.DATA_SHEET_FOR_YEAR AS Data_For_Year,
		plt20.NUM_OF_STUDENTS AS Total_students_Placed,
		plt19.DATA_SHEET_FOR_YEAR AS Data_For_Year,
		plt19.NUM_OF_STUDENTS AS Total_students_Placed
  FROM #BINS AS b
  LEFT
  JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS,	
				pld.BIN_DESC, 
				pld.DATA_SHEET_FOR_YEAR
           FROM #Placed2021 AS pld
       GROUP BY pld.BIN, 
				pld.BIN_DESC, 
				pld.DATA_SHEET_FOR_YEAR) AS plt21 ON b.BIN = plt21.BIN
   LEFT 
   JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
				pld.BIN_DESC, 
				pld.DATA_SHEET_FOR_YEAR
			FROM #Placed2020 AS pld
		GROUP BY pld.BIN, 
				 pld.BIN_DESC, 
				 pld.DATA_SHEET_FOR_YEAR) AS plt20 ON b.BIN = plt20.BIN
   LEFT 
   JOIN (SELECT pld.BIN, 
				SUM(pld.NUM_OF_STUDENTS_PLACED) AS NUM_OF_STUDENTS, 
				pld.BIN_DESC, 
				pld.DATA_SHEET_FOR_YEAR
			FROM #Placed2019 AS pld
		GROUP BY pld.BIN, 
				 pld.BIN_DESC, 
				 pld.DATA_SHEET_FOR_YEAR) AS plt19 ON b.BIN = plt19.BIN


DROP TABLE #Placed2021

DROP TABLE #Placed2020


DROP TABLE #Placed2019

DROP TABLE #BINS

ROLLBACK