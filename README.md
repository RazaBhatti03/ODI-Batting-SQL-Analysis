#  ODI Batting Records - SQL Analysis Project

This project performs beginner-to-intermediate level **SQL data analysis** on **ODI batting records** of international cricketers. It includes structured queries to uncover insights from batting statistics such as centuries, strike rate, average, ducks, and country-wise performance.

---

## Dataset Overview

- **Filename:** `ODI_batting_records_clean.csv`
- **Total Rows Used:** 2312
- **Columns Description:**

| Column Name      | Description                            |
|------------------|----------------------------------------|
| `name`           | Player's name                          |
| `span`           | Career duration (e.g., 2000–2015)       |
| `matches`        | Number of matches played               |
| `innings`        | Number of innings batted               |
| `not_outs`       | Number of not-out innings              |
| `runs`           | Total runs scored                      |
| `highest_score`  | Highest score in a match               |
| `average`        | Batting average                        |
| `balls_faced`    | Total balls faced                      |
| `strike_rate`    | Strike rate (runs per 100 balls)       |
| `century`        | 100+ run innings (centuries)           |
| `half_century`   | 50–99 run innings                      |
| `ducks`          | Zero-run innings                       |
| `country`        | Player’s country                       |

---

##  SQL Query Topics Covered

The 30 SQL queries are grouped into meaningful sections:

### Section 1: Centuries
- Top century scorers
- Century ratios
- Players with 0 or 50+ centuries

###  Section 2: Strike Rate
- Highest and lowest SR
- Country-wise SR averages

###  Section 3: Averages
- Batting averages above/below thresholds
- Country-wise batting consistency

###  Section 4: Career Stats
- Most matches
- Matches vs innings insights

###  Section 5: Country-Wise Insights
- Total runs, ducks, and players per country

###  Section 6: Miscellaneous
- Highest scores, half-centuries, 0 not-outs

---

##  Sample Query Output

```sql
-- Top 5 Players by Century Count
SELECT name, century FROM batting_records
ORDER BY century DESC LIMIT 5;

| name         | century |
| ------------ | ------- |
| V Kohli      | 50      |
| SR Tendulkar | 49      |
| RT Ponting   | 30      |
