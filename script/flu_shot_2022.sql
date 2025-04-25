/*
--====================================================================================================================
Script: flu_shot_2022 View
--====================================================================================================================

Purpose:
To create a view that identifies all active patients and determines whether they received a flu shot in 2022.
This view supports the development of a flu dashboard for 2022, enabling patient-level analysis of flu shot coverage.

Features:
- Flags patients who received a flu shot in 2022 (Code = 5302).
- Filters to only include active patients (encounter between 2020 and 2022, alive, and older than 6 months).
- Returns patient demographics: ID, first name, last name, age, race, and county.
- Indicates whether a flu shot was received (1 = Yes, 0 = No) and provides the earliest shot date if applicable.

Usage:
Used as the base dataset in Tableau to:
- Display total and segmented flu shot coverage (by age, race, and county).
- Track the number and trend of flu shots throughout 2022.
- List patients along with their flu shot status.
--====================================================================================================================
*/
-- Use the Healthcare database
USE Healthcare;
GO

CREATE VIEW flu_shot_2022 AS
WITH flu_shot_2022 AS (
	SELECT 
		Patient,
		MIN(Date) AS earliest_flu_shot_date
	FROM Immunizations
	WHERE Code = 5302
		AND YEAR(Date) = 2022
	GROUP BY Patient
),
active_patients AS (
	SELECT DISTINCT 
		Patient
	FROM encounters AS e
	LEFT JOIN Patients AS p
		ON e.Patient = p.Id
	WHERE stop BETWEEN '2020-01-01' AND '2022-12-31'
		AND p.DeathDate IS NULL
		AND DATEDIFF(MONTH, p.BirthDate, GETDATE()) > 6
)
SELECT
	p.Id AS id,
	p.FirstName AS first_name,
	p.LastName AS last_name,
	DATEDIFF(YEAR, p.BirthDate, GETDATE()) AS age,
	p.Race AS race,
	p.County AS county,
	CASE
		WHEN f.Patient IS NOT NULL THEN 1
		ELSE 0
	END AS flu_shot_2022,
	f.earliest_flu_shot_date
FROM Patients AS p
LEFT JOIN flu_shot_2022 AS f
	ON p.Id = f.Patient
WHERE p.Id IN (SELECT Patient FROM active_patients);
