/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Sl#]
      ,[SAP ID]
      ,[Name]
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
      ,[CTC (LPA)]
      ,[Type of Offer1]
      ,[Sector1]
      ,[Program]
      ,[Company Type1]
      ,[CSO 2]
      ,[CSO 1]
      ,[F24]
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase]

  SELECT *
    FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase]


  --TO CHECK THE TOTAL NUMBER OF ROWS IN THE EXCEL SHEET
 SELECT COUNT(*)
   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase]


 -- TO CHECK IF THERE ARE NO DUPLICATES WRT SAPID
  SELECT t21.[SAP ID]
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
  GROUP BY t21.[SAP ID]
  HAVING COUNT(t21.[SAP ID]) > 1


  --DUPLICATE ROW VALUE FOUND
  SELECT *
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
  WHERE t21.[SAP ID] = 500045563


  --TO VERIFY THAT NO DUPLICATE SAP ID's EXIST IN THE TABLE
  SELECT COUNT(*)
    FROM (SELECT t21.[SAP ID]
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
  GROUP BY t21.[SAP ID]
  HAVING COUNT(t21.[SAP ID]) = 1) AS t2


   -- ANALYSIS ON THE DATA
  -- TO CHECK IF FIRST FEW COLUMNS HAVE NO NULL VALUES
  -- THIS IS DONE JUST TO ENSURE THAT WE HAVE SOME BASE LINE COLUMNS THAT ARE POPULATED WITH DATA..
  -- ESSENTIALLY THIS IS MY ASSUMPTION THAT SAP_ID, STUDENT_NAME, COURSE, SCHOOL AND PLACEMENT STATUS MUST NOT BE NULL
  SELECT *
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.[Name] IS NULL 
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
   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.Status = 'placed' 
    AND (tbl.[Date of Offer] IS NULL 
			OR tbl.Company IS NULL)


--CHECK THAT IF A STUDENT IS PLACED 
  --THEN DATE OF OFFER MUST NOT BE NULL	 
  --     COMPANY NAME IS NULL
  --     SECTOR, PROFILE OFFERED IS NULL
  --     COMPANY TYPE IS NULL
 SELECT *
   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.Status = 'placed' 
    AND (tbl.[Date of Offer] IS NULL 
	 OR tbl.Company IS NULL 
	 OR tbl.Sector IS NULL 
	 OR tbl.[Profile Offered] IS NULL 
	 OR tbl.[Company Type] IS NULL) 


-- STUDENT IS PLACED AND CTC IS NULL
	SELECT *
      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase]AS tbl
     WHERE tbl.Status = 'placed' 
	   AND tbl.CTC IS NULL

-- STUDENT IS PLACED AND CTC IS NULL OR OFFER TYPE IS NULL
    SELECT *
      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase]AS tbl
     WHERE tbl.Status = 'placed' 
	   AND (tbl.CTC IS NULL OR tbl.[Type of Offer] IS NULL) 

	   -- UNPLACED STUDENTS 
	SELECT *
      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
     WHERE tbl.Status != 'placed'

-- FIND VARIOUS STATUS CATEGORIES FOR UNPLACED STUDENTS
    

-- FIND COURSES WHERE STUDENTS ARE NOT PLACED
-- SORT THEM BY NUMBER OF STUDENTS WHO ARE UNPLACED BASED ON COURSE
    SELECT tbl.Course , COUNT(*) AS TOTAL_UNPLACED_STUDENTS
      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
     WHERE tbl.Status != 'placed'
	 GROUP BY tbl.Course
	 ORDER BY 2 DESC

-- BFSI BEING CLOSED
	SELECT tbl.Status, COUNT(*)
	  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	 WHERE tbl.Course LIKE '%B.Tech Computer Science Engineering  with Spl. In Banking, Finance, Security & Insurance%'
	 GROUP BY tbl.Status
	 UNION
	 SELECT 'TOTAL', COUNT(*)
	 FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	 WHERE tbl.Course LIKE '%B.Tech Computer Science Engineering  with Spl. In Banking, Finance, Security & Insurance%'



	 --PLACED STUDENT ANALYSIS
	 SELECT *
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%'


--PLACED STUDENTS GROUPED BASED ON COURSE	

     SELECT tbl.Course, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Course
      UNION
     SELECT 'TOTAL', COUNT(*)
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%'

--PLACED STUDENTS GROUPED BASED ON COURSE 
     SELECT tbl.Course, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Course
   ORDER BY TOTAL_NUM_OF_PLACED_STUDENTS DESC

--PLACED STUDENTS GROUPED BASED ON COMPANY

     SELECT tbl.Company, COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company
   ORDER BY TOTAL_NUM_OF_PLACED_STUDENTS DESC
	 
--PLACED STUDENTS GROUPED BASED ON COURSE AND COMPANY
     SELECT tbl.Company, tbl.Course ,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company, tbl.Course
   ORDER BY 1 DESC,2 DESC, 3 DESC


--PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
     SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	   FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	  WHERE tbl.Status LIKE '%placed%' 
   GROUP BY tbl.Company, tbl.Course, tbl.CTC
   ORDER BY 1 DESC,2 DESC, tbl.CTC DESC


--TEST SCRIPT

SELECT *
  FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
 WHERE tbl.Company = 'WIPRO Technologies'


 --PLACED STUDENTS GROUPED BASED ON COURSE, COMPANY AND CTC
--THEN THESE RECORDS ARE FILTERED BASED ON A RANGE

SELECT grup.Company, grup.Course, grup.CTC, grup.TOTAL_NUM_OF_PLACED_STUDENTS
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC BETWEEN 0 AND 2

--OBSERVATION NO CTC ABOVE 20 LAKHS	 

--MINIMUM SALARY OFFERED
SELECT  MIN(grup.CTC)
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
-- WHERE grup.CTC BETWEEN 0 AND 2.1

--MAXIMUM SALARY OFFERED
SELECT  MAX(grup.CTC)
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM [SDA2019].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
	     WHERE tbl.Status LIKE '%placed%' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup