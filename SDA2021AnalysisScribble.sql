/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Sl#]
      ,[SAP ID]
      ,[Students' Name]
      ,[Course]
      ,[School]
      ,[Program]
      ,[School1]
      ,[UG/PG]
      ,[Status]
      ,[Month]
      ,[Date of Offer]
      ,[MTH]
      ,[Company]
      ,[Sector]
      ,[Profile Offered]
      ,[Company Type]
      ,[CTC]
      ,[CTC IN OL/IL/LOI]
      ,[Type of Offer]
      ,[CSO 1]
      ,[OL/EC]
      ,[REMARK]
      ,[File Name]
      ,[Date of Offer1]
      ,[MTH1]
      ,[2nd Offer]
      ,[CTC (LPA)]
      ,[CTC IN OL/IL/LOI1]
      ,[CSO 2]
      ,[OL/EC1]
      ,[REMARK1]
      ,[File Name1]
      ,[Date of Offer2]
      ,[MTH2]
      ,[3rd Offer]
      ,[CTC (LPA)1]
      ,[CTC IN OL/IL/LOI2]
      ,[CSO 3]
      ,[OL/EC2]
      ,[REMARK2]
      ,[File Name2]
      ,[Date of Offer3]
      ,[MTH3]
      ,[4th Offer]
      ,[CTC (LPA)2]
      ,[CTC IN OL/IL/LOI3]
      ,[CSO 4]
      ,[OL/EC3]
      ,[REMARK3]
      ,[File Name3]
      ,[Full Time/Internship]
      ,[Stipend/ Kpm]
      ,[National/International]
  FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
 

 --TO CHECK THE TOTAL NUMBER OF ROWS IN THE EXCEL SHEET
 SELECT COUNT(*)
   FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase]


 -- TO CHECK IF THERE ARE NO DUPLICATES WRT SAPID
  SELECT t21.[SAP ID]
    FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
GROUP BY t21.[SAP ID]
  HAVING COUNT(t21.[SAP ID]) = 1


  --TO VERIFY THAT NO DUPLICATE SAP ID's EXIST IN THE TABLE
  SELECT COUNT(*)
    FROM (SELECT t21.[SAP ID]
			FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS t21
		GROUP BY t21.[SAP ID]
          HAVING COUNT(t21.[SAP ID]) = 1) AS t2 


  -- ANALYSIS ON THE DATA
  -- TO CHECK IF FIRST 8 COLUMNS HAVE NO NULL VALUES
  SELECT *
  FROM [SDA2021].[dbo].['Source Data$'_xlnm#_FilterDatabase] AS tbl
  WHERE tbl.[Students' Name] IS NULL 
	 OR tbl.Course IS NULL 
	 OR tbl.School IS NULL 
	 --OR tbl.Program IS NULL  
	 --OR tbl.School1 IS NULL 
	 --OR tbl.[UG/PG] IS NULL
	 OR tbl.[Status] IS NULL 
	 --OR tbl.[Month] IS NULL
	 
	 