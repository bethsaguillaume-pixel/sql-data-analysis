-- ============================================================
-- Job Search Platform Analysis
-- Dataset: job_search_platform_efficacy_100k
-- Author: Bethsaida Guillaume
-- ============================================================


-- ------------------------------------------------------------
-- SECTION 1 — Exploration
-- ------------------------------------------------------------

-- Q1: How many students used each platform?
SELECT Primary_Search_Platform,
       COUNT(Student_ID) AS student_count
FROM job_search_platform_efficacy_100k
GROUP BY Primary_Search_Platform
ORDER BY student_count DESC;
-- Result: LinkedIn (39,573) > Handshake (35,871) > Indeed (24,556)


-- Q2: What is the average GPA by major category?
SELECT Major_Category,
       ROUND(AVG(GPA), 2) AS average_gpa
FROM job_search_platform_efficacy_100k
GROUP BY Major_Category
ORDER BY average_gpa DESC;
-- Result: GPAs are nearly identical across majors (~3.20) — no major stands out


-- Q3: Which region has the most students?
SELECT Region,
       COUNT(Student_ID) AS student_count
FROM job_search_platform_efficacy_100k
GROUP BY Region
ORDER BY student_count DESC;
-- Result: Evenly distributed — South (25,099), West (25,047), Northeast (24,986), Midwest (24,868)


-- ------------------------------------------------------------
-- SECTION 2 — Funnel Analysis
-- ------------------------------------------------------------

-- Q4: What is the offer rate per platform?
SELECT Primary_Search_Platform,
       ROUND(AVG(Offer_Received) * 100, 2) AS offer_rate_pct
FROM job_search_platform_efficacy_100k
GROUP BY Primary_Search_Platform
ORDER BY offer_rate_pct DESC;
-- Result: Handshake (36.99%) ≈ LinkedIn (36.96%) >> Indeed (25.79%)
-- Indeed significantly underperforms on offer conversion


-- Q5: Which university tier has the highest average salary?
SELECT University_Rating,
       ROUND(AVG(Offer_Salary), 2) AS avg_salary
FROM job_search_platform_efficacy_100k
GROUP BY University_Rating
ORDER BY avg_salary DESC;
-- Result: Top-tier ($87,752) >> Mid-tier ($74,448) ≈ Lower-tier ($74,387)
-- Top-tier advantage is ~$13,000 more than mid/lower tier


-- Q6: Do more internships lead to more offers?
SELECT Prior_Internships,
       ROUND(AVG(Offer_Received) * 100, 2) AS offer_rate_pct
FROM job_search_platform_efficacy_100k
GROUP BY Prior_Internships
ORDER BY Prior_Internships ASC;
-- Result: Clear linear progression — 0 internships: 23.2% vs 5 internships: 73.25%
-- Each additional internship adds roughly +10% offer rate


-- ------------------------------------------------------------
-- SECTION 3 — Advanced
-- ------------------------------------------------------------

-- Q7: Which platform is most efficient? (offers per application submitted)
SELECT Primary_Search_Platform,
       ROUND(SUM(Offer_Received) * 1.0 / SUM(Applications_Submitted), 4) AS efficiency_rate
FROM job_search_platform_efficacy_100k
GROUP BY Primary_Search_Platform
ORDER BY efficiency_rate DESC;
-- Result: Handshake (0.0115) > LinkedIn (0.0069) > Indeed (0.0030)
-- Handshake delivers 4x more offers per application than Indeed


-- Q8: Students who got an offer despite a GPA below 3.0
SELECT Student_ID,
       GPA,
       Offer_Received
FROM job_search_platform_efficacy_100k
WHERE Offer_Received > 0
  AND GPA < 3.0;
-- Result: 9,251 students — GPA alone does not determine success


-- Q9: Rank platforms by average salary offered (using subquery)
SELECT platform,
       ROUND(avg_salary, 2) AS avg_salary
FROM (
    SELECT Primary_Search_Platform AS platform,
           AVG(Offer_Salary)       AS avg_salary
    FROM job_search_platform_efficacy_100k
    GROUP BY Primary_Search_Platform
) AS subquery
ORDER BY avg_salary DESC;
-- Result: LinkedIn ($84,003) > Handshake ($72,829) > Indeed ($68,358)
-- LinkedIn offers lead to higher salaries despite similar offer rates to Handshake
