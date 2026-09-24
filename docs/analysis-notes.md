# Analysis notes

## Provenance

The SQL was transcribed from pages 4–14 of the March 2026 MIE1628 Assignment 4 report. Formatting and explanatory comments were added for readability; query logic was preserved. The report calls the source `gender_jobs_data`, while its executed queries use `dbo.genderdata`; this repository uses the executed table name.

## Important interpretation limits

- `total_earnings_male` and `total_earnings_female` are field names from the report. Their units and definitions are not available in the archive. Summing occupation-level averages or medians would not produce total payroll. Verify the data dictionary before describing these sums as money earned by all workers.
- Comparing aggregate male and female earnings fields does not control for occupation, hours worked, workforce composition, or other factors and is not an estimate of pay discrimination.
- The final question refers to full-time and part-time workers, but its SQL only sums `workers_female` and `workers_male`. It does not split employment status. Whether those fields cover both statuses must be checked in the original dataset.
- `LIKE '%engineer%'` includes any occupation containing that text, potentially including engineering technicians. It is not a validated classification of engineering professions.
- Distinct occupation counts depend on spelling and database collation. The report's occupation list contains some unusual labels; these are not silently corrected.

## Data quality and numeric types

- Some numeric columns were stored as text in the coursework workflow.
- `NULLIF(value, '')` converts empty strings to NULL. It does not independently validate every representation of missing data.
- `TRY_CAST` returns NULL on conversion failure; aggregate SUM ignores NULL values. Missing or malformed values can therefore silently reduce totals. Check and count conversion failures before interpreting results.
- Several original queries use `CAST(... AS INT)`, which fails on invalid values and can overflow on sufficiently large sums. Validate source values and consider BIGINT for larger worker totals in future revisions.
- Original earnings queries use FLOAT. For financial calculations, use an appropriate fixed-precision decimal type after confirming units and precision requirements.
- Confirm one row per intended year/occupation key and check for duplicate or overlapping category totals before aggregation.

## Validation performed

Ten SQL statements were extracted and compared with the report, covering the nine questions plus the distinct-occupation variant of question 1. No live Azure connection or source dataset was supplied, so database execution and numerical results have not been independently reproduced.
