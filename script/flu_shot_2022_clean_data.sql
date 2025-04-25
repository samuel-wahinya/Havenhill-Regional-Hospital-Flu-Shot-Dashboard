/*
--===================================================================================================================
Script: clean_flu_shot_2022_dataset
--===================================================================================================================

Purpose:
To retrieve a clean and ready-for-analysis dataset from the `flu_shot_2022` view by removing duplicates, 
trimming string fields, formatting dates, and filtering invalid records.

Features:
- Removes duplicate patient records using ROW_NUMBER().
- Trims leading/trailing whitespace from names.
- Formats `earliest_flu_shot_date` to a readable and consistent `flu_shot_date`.
- Filters out records with NULL or invalid (zero or negative) ages.
- Ensures only valid patient IDs are included.

Usage:
This script is used to prepare the dataset for reporting and dashboard development in Tableau or other BI tools. 
It ensures data integrity and formatting consistency before loading into a visualization layer.
--===================================================================================================================
*/

SELECT 
	id,
	TRIM(first_name) AS first_name,
	TRIM(last_name) AS last_name,
	age,
	race,
	county,
	flu_shot_2022,
	flu_shot_date
FROM (
	SELECT 
		id,
		first_name,
		last_name,
		age,
		race,
		county,
		flu_shot_2022,
		FORMAT(earliest_flu_shot_date, 'yyyy-MM-dd hh:mm:ss') AS flu_shot_date,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS check_duplicates
	FROM flu_shot_2022
	WHERE id IS NOT NULL
		AND age IS NOT NULL
		AND age > 0
) t
WHERE check_duplicates = 1;
