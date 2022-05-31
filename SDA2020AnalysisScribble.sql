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
  FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase]
  ORDER BY 1

  --TO CHECK THE TOTAL NUMBER OF ROWS IN THE EXCEL SHEET
 SELECT COUNT(*)
   FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase]


 -- TO CHECK IF THERE ARE NO DUPLICATES WRT SAPID
  SELECT t21.[SAP ID]
  FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
  GROUP BY t21.[SAP ID]
  HAVING COUNT(t21.[SAP ID]) = 1


  --TO VERIFY THAT NO DUPLICATE SAP ID's EXIST IN THE TABLE
  SELECT COUNT(*)
  FROM ( SELECT t21.[SAP ID]
			FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
			GROUP BY t21.[SAP ID]
			HAVING COUNT(t21.[SAP ID]) = 1 
		) AS t2




 -- ANALYSIS ON THE DATA
  -- TO CHECK IF FIRST FEW COLUMNS HAVE NO NULL VALUES
  -- THIS IS DONE JUST TO ENSURE THAT WE HAVE SOME BASE LINE COLUMNS THAT ARE POPULATED WITH DATA..
  -- ESSENTIALLY THIS IS MY ASSUMPTION THAT SAP_ID, STUDENT_NAME, COURSE, SCHOOL AND PLACEMENT STATUS MUST NOT BE NULL
  SELECT *
  FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.[Students' Name] IS NULL 
	 OR tbl.Course IS NULL 
	 OR tbl.School IS NULL 
	 --OR tbl.Program IS NULL  
	 --OR tbl.School1 IS NULL 
	 --OR tbl.[UG/PG] IS NULL
	 OR tbl.[Status] IS NULL 
	 --OR tbl.[Month] IS NULL


	 --NEXT I CHECK THAT IF A STUDENT IS PLACED THEN DATE OF OFFER MUST NOT BE NULL	 

SELECT *
  FROM [SDA2020].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.Status = 'placed' AND tbl.[Date of Offer] IS NULL