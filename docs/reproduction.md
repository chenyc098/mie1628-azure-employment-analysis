# Reproduction requirements

## Required inputs

- The original employment data file and its source/license information.
- A data dictionary defining row granularity, category labels, worker coverage, earnings units, and missing-value conventions.
- An Azure SQL Database containing `dbo.genderdata`.
- For reproducing ingestion, an Azure Storage source and an Azure Data Factory copy pipeline.

The CSV column list is documented in dataset-notes.md; the original SQL DDL and pipeline export are absent. No schema or deployment template in this repository is represented as an original artifact.

## Columns used by the analysis

| Column | Query use |
| --- | --- |
| `year` | Year filters, grouping, sorting |
| `occupation` | Occupation filters and distinct counts |
| `major_category` | Broad occupational grouping |
| `minor_category` | Detailed occupational grouping |
| `workers_female` | Female worker totals |
| `workers_male` | Male worker totals |
| `total_earnings_female` | Female earnings field aggregation |
| `total_earnings_male` | Male earnings field aggregation |

The CSV has 12 columns; see dataset-notes.md for the complete list. SELECT * returns all columns present in the loaded SQL table.

## Workflow

1. Obtain the original source file and confirm its definitions and permitted use.
2. Configure an Azure Storage container and upload the source data.
3. Configure source and destination connections in Azure Data Factory using your own environment.
4. Create a copy activity from the storage source to the SQL destination. Map source fields to the expected table columns and verify the copy run and imported row count.
5. Check row granularity, duplicate records, missing values, and numeric conversion failures.
6. Run each statement in `sql/analysis.sql` against the target database and inspect its results.
7. Interpret results using the data dictionary and the limitations in `analysis-notes.md`.

These are conceptual reproduction steps based on the documented workflow, not an exported deployment configuration. Keep credentials and connection strings outside version control.
