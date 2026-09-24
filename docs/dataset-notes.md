# Dataset verification

Local source: `gender_jobs_data.csv`, provided by the project author. Publisher, download URL, data dictionary, and redistribution license have not been verified.

- 2,088 rows and 12 columns.
- 522 records per year, 2013–2016.
- No duplicate `(year, occupation)` keys.
- Missing values: 4 in `total_earnings_male`, 65 in `total_earnings_female`, and 846 in `wage_percent_of_male`; the other columns contain no missing values in this file.
- SHA-256: `dda471879240b2ce9e679a224635da78cf4a3a00ae242426a817279934ec2e16`.

Columns: `year`, `occupation`, `major_category`, `minor_category`, `total_workers`, `workers_male`, `workers_female`, `percent_female`, `total_earnings`, `total_earnings_male`, `total_earnings_female`, `wage_percent_of_male`.

The CSV supplies field names and values, not economic definitions. In particular, an earnings field may be an occupation-level average or median rather than an additive total. Do not label sums of those fields as total earnings of a population without confirming their definitions.

Worker-count results in the README were recalculated using pandas groupby/filter operations and cross-checked against the report. No live Azure pipeline or SQL execution was performed.
