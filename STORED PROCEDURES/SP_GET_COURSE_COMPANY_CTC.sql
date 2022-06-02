
IF EXISTS (SELECT 1 FROM sys.procedures WHERE name = 'sp_get_Course_Company_CTC')

	DROP PROCEDURE sp_get_Course_Company_CTC 
GO

CREATE PROCEDURE sp_get_Course_Company_CTC
	@year NVARCHAR(50)
AS

--DECLARE @tablename VARCHAR(50)
DECLARE @sql NVARCHAR(255)



IF @year = 2021
	SET @sql = 'sp_get_Course_Company_CTC_2021'
ELSE IF @year = 2020
	SET @sql = 'sp_get_Course_Company_CTC_2020'
ELSE IF @year = 2019
	SET @sql = '[SDA2021].[dbo].[SourceData]'


--SET @sql = 'SELECT * FROM ' + @tablename



EXEC @sql


--SELECT @sql



EXEC sp_get_Course_Company_CTC '2021' 




