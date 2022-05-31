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
  -- TO CHECK IF FIRST 8 COLUMNS HAVE NO NULL VALUES
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