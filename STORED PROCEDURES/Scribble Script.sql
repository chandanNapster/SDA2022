UNION
 SELECT 2, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''2.5 to 5 Lakhs Per Annum''
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+ @tablename +' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
  WHERE grup.CTC > 2.5 AND grup.CTC <= 5
  UNION
 SELECT 3, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''5 to 7.5 Lakhs Per Annum''
   FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 5 AND grup.CTC <= 7.5
 UNION
 SELECT 4, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''7.5 to 10 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 7.5 AND grup.CTC <= 10
 UNION
 SELECT 5, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''10 to 12.5 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 10 AND grup.CTC <=12.5
 UNION
 SELECT 6, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''12.5 to 15 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 12.5 AND grup.CTC <=15
 UNION
 SELECT 7, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''15 to 17.5 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 15 AND grup.CTC <=17.5
 UNION
 SELECT 8, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''17.5 to 20 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 17.5 AND grup.CTC <=20
 UNION
 SELECT 9, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''20 to 25 Lakhs Per Annum''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 20 AND grup.CTC <=25
 UNION
 SELECT 10, 
		grup.Company, 
		grup.Course, 
		grup.CTC, 
		grup.TOTAL_NUM_OF_PLACED_STUDENTS,
		''25 Lakhs Per Annum and Above''
  FROM (SELECT tbl.Company, tbl.Course ,tbl.CTC,COUNT(*) AS TOTAL_NUM_OF_PLACED_STUDENTS
	      FROM '+@tablename+' AS tbl
	     WHERE tbl.Status LIKE ''%placed%'' 
      GROUP BY tbl.Company, tbl.Course, tbl.CTC) AS grup
 WHERE grup.CTC > 25