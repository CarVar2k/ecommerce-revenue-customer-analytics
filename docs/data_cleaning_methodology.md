# Data Cleaning Methodology

## Project
E-Commerce Revenue & Customer Intelligence

## Objective
Prepare the Olist e-commerce datasets for relational database loading and reproducible business analysis.

## Tools
Python, pandas, Jupyter Notebook, MySQL

## Data Preservation
Original CSV files are retained unchanged. All transformations are performed on working copies.

## Cleaning Rules

### Identifiers
Primary and foreign-key identifiers are preserved without modification.

### Postal Codes
Customer, seller, and geolocation ZIP prefixes are converted to five-character strings to preserve leading zeros.

### Dates
Timestamp columns are parsed into datetime values. Invalid conversions are audited before export.

### Missing Values
- Optional review comments remain null.
- Missing delivery timestamps remain null.
- Missing product attributes remain null.
- Missing categories are handled using derived reporting fields rather than overwriting source values.

### Numeric Values
Negative prices, freight charges, payment amounts, and invalid review scores are flagged for investigation.

### Geolocation
The geographic dataset requires additional source verification because its row count differs from the commonly distributed Olist dataset.

Exact duplicates are investigated in a separate derived DataFrame. No raw geographic records are overwritten.

## Validation
The cleaning process includes:
- Original-versus-cleaned row reconciliation
- Primary-key uniqueness checks
- Composite-key uniqueness checks
- Foreign-key relationship checks
- Missing-value profiling
- Date conversion audits
- Numeric validation

## Results
To be completed using the actual outputs from the Python cleaning notebook.

## Limitations
Cleaning and validation do not establish that every source record is accurate. Observational data may contain reporting errors, missing information, and measurement limitations.

## Next Steps
1. Review data-quality exceptions.
2. Verify geolocation source completeness.
3. Import validated CSV files into MySQL.
4. Reconcile database row counts against Python outputs.
5. Begin exploratory business analysis.
