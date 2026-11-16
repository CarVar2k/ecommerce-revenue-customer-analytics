## Final Key and Date Validation Results

### Database Integrity

After using Python(pandas, numpy); there were a total of eleven primary-key, composite-key, and foreign-key checked and validated upon investigation necessary for completion.

**Results:**
- Validation checks passed: 11/11
- Detected key violations: 0
- Unmatched foreign-key relationships: 0

The results support proceeding with relational database design for the core transactional tables.

### Historical Date Coverage

- Earliest purchase: September 4, 2016
- Latest purchase: October 17, 2018
- Invalid purchase timestamps: 0

**Orders by year:**

| Year | Orders |
|---|---:|
| 2016 | 329 |
| 2017 | 45,101 |
| 2018 | 54,011 |
| **Total** | **99,441** |

### Analytical Implications

The dataset contains incomplete calendar years in 2016 and 2018. Annual comparisons must account for differences in observation periods. There were eight orders marked as delivered which lacked actual customer delivery timestamps. However, these observations will be excluded from calculations requiring valid delivery dates while remaining available for other eligible analyses.

### Outstanding Data Quality Issue

The geolocation dataset contains 647,506 rows, compared with approximately 1,000,163 rows in the commonly distributed source. Although, the original geolocation CSV must be verified before creating geographic lookup tables.

### Conclusion

Overall, the core transactional data passed the initial identifier and relationship validation checks. The project can proceed to data dictionary development and relational database design with geographic source verification remaining open onto the next step using SQL.
