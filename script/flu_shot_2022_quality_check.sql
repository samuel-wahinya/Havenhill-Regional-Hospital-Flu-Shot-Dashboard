/*
--=========================================================================================================================================
Script: flu_shot_2022 - Quality Checks
--=========================================================================================================================================

Purpose:
To ensure data accuracy, integrity, and consistency in the `flu_shot_2022` view before using it for analysis and visualization in Tableau.

Features:
- Validates primary key integrity (no NULLs, no duplicates).
- Ensures cleanliness of string fields (trims unwanted leading/trailing spaces).
- Verifies that integer fields (age) are valid and non-negative.
- Checks consistency of values in categorical fields (race, county, flu_shot_2022).
- Confirms proper formatting and presence of date fields.

Usage:
This script is run after the creation of `flu_shot_2022` view to ensure the dataset is clean and ready for use in dashboards or reports. 
All checks should return zero rows if the data is clean.
--=========================================================================================================================================
*/

--==============================================
-- Quality Check: NULLs in Primary Key
-- Expectation: No NULLs in 'id'
--==============================================
SELECT *
FROM flu_shot_2022
WHERE id IS NULL;
GO
  
--==============================================
-- Quality Check: Duplicate IDs
-- Expectation: No duplicate patient IDs
--==============================================
SELECT *
FROM (
	SELECT 
		id,
		COUNT(id) OVER(PARTITION BY id) AS check_duplicates
	FROM flu_shot_2022
) t
WHERE check_duplicates != 1;
GO
  
--===================================================
-- Quality Check: Unwanted Spaces in String Columns
-- Expectation: No leading/trailing spaces
--===================================================
SELECT first_name
FROM flu_shot_2022
WHERE first_name != TRIM(first_name);

SELECT last_name
FROM flu_shot_2022
WHERE last_name != TRIM(last_name);
GO
  
--===================================================================
-- Quality Check: NULLs, Negative, or Zero Values in Integer Fields
-- Expectation: Age should be positive and not NULL
--===================================================================
SELECT age
FROM flu_shot_2022
WHERE age IS NULL OR age <= 0;
GO
  
--======================================================================
-- Quality Check: Consistency of Categorical Fields
-- Expectation: Limited, consistent values in low-cardinality fields
--======================================================================
SELECT DISTINCT race FROM flu_shot_2022;
SELECT DISTINCT county FROM flu_shot_2022;
SELECT DISTINCT flu_shot_2022 FROM flu_shot_2022;
GO
  
--==================================================
-- Quality Check: Date Format Consistency
-- Expectation: Dates should follow YYYY-MM-DD HH:MM:SS format
--==================================================
SELECT
	FORMAT(earliest_flu_shot_date, 'yyyy-MM-dd HH:mm:ss') AS flu_shot_date
FROM flu_shot_2022;
GO
