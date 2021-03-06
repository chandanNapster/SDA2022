/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Sl#]
      ,[SAP ID]
      ,[Students' Name]
      ,[Status]
      ,[Date of Offer]
      ,[MTH]
      ,[Month]
      ,[Company]
      ,[Sector]
      ,[Profile Offered]
      ,[Company Type]
      ,[Course]
      ,[CTC]
      ,[Type of Offer]
      ,[School]
      ,[2nd Offer]
      ,[CTC 2 (LPA)]
      ,[3rd Offer]
      ,[CTC 3 (LPA)]
      ,[4th Offer]
      ,[CTC 4 (LPA)]
      ,[CSO 4]
      ,[CSO 3]
      ,[CSO 2]
      ,[CSO 1]
  FROM [SDA2020].[dbo].[SourceData]
  ORDER BY 1

  --TO CHECK THE TOTAL NUMBER OF ROWS IN THE EXCEL SHEET
 SELECT COUNT(*)
   FROM [SDA2020].[dbo].[SourceData]


 -- TO CHECK IF THERE ARE NO DUPLICATES WRT SAPID
  SELECT t21.[SAP ID]
  FROM [SDA2020].[dbo].[SourceData] AS t21
  GROUP BY t21.[SAP ID]
  HAVING COUNT(t21.[SAP ID]) = 1


  --TO VERIFY THAT NO DUPLICATE SAP ID's EXIST IN THE TABLE
  SELECT COUNT(*)
  FROM ( SELECT t21.[SAP ID]
			FROM [SDA2020].[dbo].[SourceData] AS t21
			GROUP BY t21.[SAP ID]
			HAVING COUNT(t21.[SAP ID]) = 1 
		) AS t2




 -- ANALYSIS ON THE DATA
  -- TO CHECK IF FIRST FEW COLUMNS HAVE NO NULL VALUES
  -- THIS IS DONE JUST TO ENSURE THAT WE HAVE SOME BASE LINE COLUMNS THAT ARE POPULATED WITH DATA..
  -- ESSENTIALLY THIS IS MY ASSUMPTION THAT SAP_ID, STUDENT_NAME, COURSE, SCHOOL AND PLACEMENT STATUS MUST NOT BE NULL
  SELECT *
  FROM [SDA2020].[dbo].[SourceData] AS tbl
  WHERE tbl.[Students' Name] IS NULL 
	 OR tbl.Course IS NULL 
	 OR tbl.School IS NULL 
	 --OR tbl.Program IS NULL  
	 --OR tbl.School1 IS NULL 
	 --OR tbl.[UG/PG] IS NULL
	 OR tbl.[Status] IS NULL 
	 --OR tbl.[Month] IS NULL


	 --NEXT I CHECK THAT IF A STUDENT IS PLACED THEN DATE OF OFFER MUST NOT BE NULL	
	 -- CHECK IF COMPANY NAME IS NULL

SELECT *
  FROM [SDA2020].[dbo].[SourceData] AS tbl
  WHERE tbl.Status = 'placed' AND (tbl.[Date of Offer] IS NULL OR tbl.Company IS NULL)


  --CHECK THAT IF A STUDENT IS PLACED 
  --THEN DATE OF OFFER MUST NOT BE NULL	 
  --     COMPANY NAME IS NULL
  --     SECTOR, PROFILE OFFERED IS NULL
  --     COMPANY TYPE IS NULL
 SELECT *
   FROM [SDA2020].[dbo].[SourceData] AS tbl
  WHERE tbl.Status = 'placed' 
    AND (tbl.[Date of Offer] IS NULL 
	 OR tbl.Company IS NULL 
	 OR tbl.Sector IS NULL 
	 OR tbl.[Profile Offered] IS NULL 
	 OR tbl.[Company Type] IS NULL) 

-- STUDENT IS PLACED AND CTC IS NULL
	SELECT *
      FROM [SDA2020].[dbo].[SourceData] AS tbl
     WHERE tbl.Status = 'placed' 
	   AND tbl.CTC IS NULL

-- STUDENT IS PLACED AND CTC IS NULL OR OFFER TYPE IS NULL
    SELECT *
      FROM [SDA2020].[dbo].[SourceData] AS tbl
     WHERE tbl.Status = 'placed' 
	   AND (tbl.CTC IS NULL OR tbl.[Type of Offer] IS NULL) 

-- UNPLACED STUDENTS 
	SELECT *
      FROM [SDA2020].[dbo].[SourceData] AS tbl
     WHERE tbl.Status != 'placed'

-- FIND VARIOUS STATUS CATEGORIES FOR UNPLACED STUDENTS
    SELECT tbl.Status, COUNT(*)
      FROM [SDA2020].[dbo].[SourceData] AS tbl
     WHERE tbl.Status != 'placed' 
	 GROUP BY tbl.Status

-- FIND COURSES WHERE STUDENTS ARE NOT PLACED
-- SORT THEM BY NUMBER OF STUDENTS WHO ARE UNPLACED BASED ON COURSE
    SELECT tbl.Course , COUNT(*) AS TOTAL_UNPLACED_STUDENTS
      FROM [SDA2020].[dbo].[SourceData] AS tbl
     WHERE tbl.Status != 'placed'
	 GROUP BY tbl.Course
	 ORDER BY 2 DESC

-- OBSERVATION HIGHER NUMBER OF STUDENTS WERE UNPLACED FOR BCA
    SELECT *
	  FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status != 'placed' AND tbl.Course LIKE '%Bachelors of Computer Application%'

-- BFSI BEING CLOSED
	SELECT tbl.Status, COUNT(*)
	  FROM [SDA2020].[dbo].[SourceData] AS tbl
	 WHERE tbl.Course LIKE '%B.Tech Computer Science Engineering with Spl. In Banking Financial Services & Insurance%'
	 GROUP BY tbl.Status
	 UNION 
	 SELECT 'TOTAL', COUNT(*)
	 FROM [SDA2020].[dbo].[SourceData] AS tbl
	 WHERE tbl.Course LIKE '%B.Tech Computer Science Engineering with Spl. In Banking Financial Services & Insurance%'


	 --PLACED STUDENT ANALYSIS
	 SELECT *
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' AND tbl.CTC > 20

--PLACED STUDENTS GROUPED BASED ON COURSE	

     SELECT tbl.Course, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Course
      UNION
     SELECT 'TOTAL', COUNT(*)
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%'

--PLACED STUDENTS GROUPED BASED ON COURSE 
     SELECT tbl.Course, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Course
   ORDER BY TOTAL_NUM_OF_PLACED_STUDENTS DESC

--PLACED STUDENTS GROUPED BASED ON COMPANY

     SELECT tbl.Company, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company
   ORDER BY TOTAL_NUM_OF_PLACED_STUDENTS DESC

--PLACED STUDENTS GROUPED BASED ON COURSE AND COMPANY
     SELECT tbl.Company, tbl.Course ,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company, tbl.Course
   ORDER BY 1 DESC,2 DESC, 3 DESC


--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
     SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2020].[dbo].[SourceData] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company, tbl.Course, tbl.CTC
   ORDER BY 1 DESC,2 DESC, tbl.CTC DESC


--TEST SCRIPT

SELECT *
  FROM [SDA2020].[dbo].[SourceData] AS tbl
 WHERE tbl.Company = 'WIPRO Technologies'


--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED BASED ON A RANGE

--THIS QUERY CAN BE USED TO FIND MAX AND MIN PACKAGE
SELECT grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC BETWEEN 20 AND 100

--OBSERVATION NO CTC ABOVE 20 LAKHS	


--MINIMUM SALARY OFFERED
SELECT  MIN(grup.CTC)
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
-- WHERE grup.CTC BETWEEN 0 AND 2.1

--MAXIMUM SALARY OFFERED
SELECT  MAX(grup.CTC)
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2020].[dbo].[SourceData] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup


--HIGHLY EMPLOYBLE STUDENTS
 SELECT *
  FROM [SDA2020].[dbo].[SourceData] AS tbl
 WHERE tbl.Status = 'placed' AND (tbl.[2nd Offer] IS NOT NULL OR tbl.[3rd Offer] IS NOT NULL OR tbl.[4th Offer] IS NOT NULL)

 --STUDENTS WITH MORE THAN 3 OFFERS
 SELECT *
  FROM [SDA2020].[dbo].[SourceData] AS tbl
 WHERE tbl.Status = 'placed' AND (tbl.[2nd Offer] IS NOT NULL AND tbl.[3rd Offer] IS NOT NULL AND tbl.[4th Offer] IS NOT NULL)