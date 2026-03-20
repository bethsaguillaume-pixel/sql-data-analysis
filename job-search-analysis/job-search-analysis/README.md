# Job Search Platform Analysis — SQL Project

![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![SQL](https://img.shields.io/badge/Language-SQL-blue)
![Dataset](https://img.shields.io/badge/Dataset-Kaggle-purple)
![Records](https://img.shields.io/badge/Records-100k-orange)

## Overview

An exploratory SQL analysis of 100,000 student job search records to determine which platform — **LinkedIn**, **Indeed**, or **Handshake** — delivers the best outcomes for entry-level job seekers.

---

## Dataset

**Source:** Kaggle — Job Search Platform Efficacy Dataset  
**Size:** 100,000 records, 1 table  
**Key columns:**

| Column | Description |
|--------|-------------|
| `Student_ID` | Unique student identifier |
| `University_Rating` | Top-tier / Mid-tier / Lower-tier |
| `Major_Category` | STEM, Business, Arts, Healthcare, Humanities |
| `GPA` | Academic score |
| `Prior_Internships` | Number of internships before job search |
| `Primary_Search_Platform` | LinkedIn / Indeed / Handshake |
| `Applications_Submitted` | Total applications sent |
| `Offer_Received` | 1 = received offer, 0 = did not |
| `Offer_Salary` | Salary for students who received an offer |

---

## Business Questions & Key Findings

### Section 1 — Exploration

**Q1. How many students used each platform?**
- LinkedIn leads with 39,573 users, followed by Handshake (35,871) and Indeed (24,556)

**Q2. What is the average GPA by major category?**
- GPAs are nearly identical across all majors (~3.20) — major choice does not differentiate academic performance

**Q3. Which region has the most students?**
- Distribution is remarkably even across all 4 regions (~25,000 each)

---

### Section 2 — Funnel Analysis

**Q4. What is the offer rate per platform?**

| Platform | Offer Rate |
|----------|-----------|
| Handshake | 36.99% |
| LinkedIn | 36.96% |
| Indeed | 25.79% |

> Indeed significantly underperforms — students using it are ~11% less likely to receive an offer.

**Q5. Which university tier has the highest average salary?**

| University Tier | Avg Salary |
|----------------|-----------|
| Top-tier | $87,752 |
| Mid-tier | $74,448 |
| Lower-tier | $74,387 |

> Top-tier graduates earn ~$13,000 more than mid and lower-tier graduates.

**Q6. Do more internships lead to more offers?**

| Internships | Offer Rate |
|-------------|-----------|
| 0 | 23.20% |
| 1 | 32.35% |
| 2 | 40.99% |
| 3 | 51.83% |
| 4 | 61.39% |
| 5 | 73.25% |

> Yes — each additional internship adds roughly +10% to offer rate. The strongest predictor in this dataset.

---

### Section 3 — Advanced

**Q7. Which platform is most efficient?**

| Platform | Offers per Application |
|----------|----------------------|
| Handshake | 0.0115 |
| LinkedIn | 0.0069 |
| Indeed | 0.0030 |

> Handshake delivers **4x more offers per application** than Indeed.

**Q8. Students who got an offer despite a GPA below 3.0**
- 9,251 students received offers with a GPA under 3.0
- GPA alone does not determine success — other factors (internships, platform choice) matter more

**Q9. Average salary by platform**

| Platform | Avg Salary |
|----------|-----------|
| LinkedIn | $84,003 |
| Handshake | $72,829 |
| Indeed | $68,358 |

> LinkedIn offers lead to higher salaries despite similar offer rates to Handshake — a quality vs quantity tradeoff.

---

## Key Takeaways

1. **Handshake is the most efficient platform** — highest offer rate and best offers-per-application ratio
2. **LinkedIn leads on salary** — offers found via LinkedIn average $15,000 more than Indeed
3. **Internships are the #1 predictor** — going from 0 to 5 internships triples your offer rate (23% → 73%)
4. **GPA matters less than expected** — 9,251 students with GPA < 3.0 still received offers
5. **Indeed underperforms on every metric** — lowest offer rate, lowest efficiency, lowest salary

---

## SQL Concepts Used

- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY`, `HAVING`
- Aggregate functions: `COUNT`, `AVG`, `SUM`, `ROUND`
- Subqueries
- `AND` conditions
- Column aliases

---

## Tools

- SQL (MySQL / PostgreSQL compatible)
- [DB Fiddle](https://www.db-fiddle.com) — for testing queries online

---

## Files

```
job-search-sql-analysis/
├── README.md
└── analysis.sql
```
