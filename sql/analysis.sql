-- MIE1628: queries transcribed from the submitted Assignment 4 report.
-- Original query logic preserved; see docs/analysis-notes.md for limitations.
-- Requires the original dataset loaded as dbo.genderdata in Azure SQL Database.

-- 01. Computer, engineering, and science records for 2013
SELECT *
FROM dbo.genderdata
WHERE MAJOR_CATEGORY = 'Computer, Engineering, and Science'
AND YEAR = 2013;

-- 02. Distinct occupations in that category for 2013
SELECT DISTINCT occupation
FROM dbo.genderdata
WHERE MAJOR_CATEGORY = 'Computer, Engineering, and Science'
AND YEAR = 2013;

-- 03. Distinct business and financial operations occupations
SELECT COUNT(DISTINCT occupation) AS total_occupations
FROM dbo.genderdata
WHERE MINOR_CATEGORY = 'Business and Financial Operations';

-- 04. Bus driver records across years
SELECT *
FROM dbo.genderdata
WHERE occupation LIKE '%bus driver%';

-- 05. Female workers in management, business, and financial occupations by year
SELECT year,
SUM(CAST(workers_female AS INT)) AS total_female_workers
FROM dbo.genderdata
WHERE major_category = 'Management, Business, and Financial'
GROUP BY year
ORDER BY year;

-- 06. Male earnings field sum in service occupations for 2015
SELECT SUM(CAST(NULLIF(total_earnings_male, '') AS FLOAT)) AS total_male_earnings
FROM dbo.genderdata
WHERE major_category = 'Service'
AND year = 2015;

-- 07. Female workers in management for 2015
SELECT SUM(CAST(workers_female AS INT)) AS total_workers_female_management_2015
FROM dbo.genderdata
WHERE minor_category = 'Management' AND year = 2015;

-- 08. Male and female earnings field sums by year
SELECT year,
SUM(TRY_CAST(total_earnings_male AS FLOAT)) AS male_earnings,
SUM(TRY_CAST(total_earnings_female AS FLOAT)) AS female_earnings
FROM dbo.genderdata
GROUP BY year
ORDER BY year;

-- 09. Female earnings field sum for engineer-matching occupations in 2016
SELECT SUM(TRY_CAST(total_earnings_female AS FLOAT)) AS female_engineers_earnings
FROM dbo.genderdata
WHERE LOWER(occupation) like '%engineer%'
AND year = 2016;

-- 10. Male and female worker counts by year
SELECT year,
SUM(TRY_CAST(NULLIF(workers_female, '') AS BIGINT)) AS total_female,
SUM(TRY_CAST(NULLIF(workers_male, '') AS BIGINT)) AS total_male
FROM dbo.genderdata
GROUP BY year
ORDER BY year;

