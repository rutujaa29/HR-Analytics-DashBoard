-- =====================================
-- HR ANALYTICS KPI QUERIES
-- =====================================

USE hr_analytics;

-- 1. Total Employees
SELECT COUNT(*) AS Employee_Count
FROM employees;

-- 2. Attrition Count
SELECT COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition = 'Yes';

-- 3. Active Employees
SELECT COUNT(*) AS Active_Employees
FROM employees
WHERE Attrition = 'No';

-- 4. Attrition Rate
SELECT
ROUND(
(COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0)
/ COUNT(*),2
) AS Attrition_Rate
FROM employees;

-- 5. Average Employee Age
SELECT ROUND(AVG(Age),0) AS Average_Age
FROM employees;

-- =====================================
-- DEPARTMENT ANALYSIS
-- =====================================

-- Department-wise Attrition
SELECT
Department,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

-- Department Employee Count
SELECT
Department,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY Department;

-- =====================================
-- GENDER ANALYSIS
-- =====================================

-- Attrition by Gender
SELECT
Gender,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY Gender;

-- Employee Count by Gender
SELECT
Gender,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY Gender;

-- =====================================
-- AGE GROUP ANALYSIS
-- =====================================

SELECT
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE 'Over 55'
END AS Age_Group,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY Age_Group
ORDER BY Age_Group;

-- Attrition by Age Group
SELECT
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE 'Over 55'
END AS Age_Group,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY Age_Group;

-- =====================================
-- EDUCATION ANALYSIS
-- =====================================

-- Education Field-wise Attrition
SELECT
EducationField,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY Attrition_Count DESC;

-- Education Level Distribution
SELECT
Education,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY Education;

-- =====================================
-- JOB SATISFACTION ANALYSIS
-- =====================================

SELECT
JobRole,
JobSatisfaction,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY JobRole, JobSatisfaction
ORDER BY JobRole;

-- Average Satisfaction by Job Role
SELECT
JobRole,
ROUND(AVG(JobSatisfaction),2) AS Avg_Satisfaction
FROM employees
GROUP BY JobRole
ORDER BY Avg_Satisfaction DESC;

-- =====================================
-- JOB ROLE ATTRITION
-- =====================================

SELECT
JobRole,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

-- =====================================
-- INCOME ANALYSIS
-- =====================================

SELECT
Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Monthly_Income
FROM employees
GROUP BY Department
ORDER BY Avg_Monthly_Income DESC;

-- =====================================
-- EXPERIENCE ANALYSIS
-- =====================================

SELECT
ROUND(AVG(YearsAtCompany),2) AS Avg_Years_At_Company
FROM employees;

SELECT
YearsAtCompany,
COUNT(*) AS Employee_Count
FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-- =====================================
-- ATTRITION BY GENDER AND AGE GROUP
-- =====================================

SELECT
Gender,
CASE
WHEN Age < 25 THEN 'Under 25'
WHEN Age BETWEEN 25 AND 34 THEN '25-34'
WHEN Age BETWEEN 35 AND 44 THEN '35-44'
WHEN Age BETWEEN 45 AND 54 THEN '45-54'
ELSE 'Over 55'
END AS Age_Group,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY Gender, Age_Group
ORDER BY Age_Group;

-- =====================================
-- TOP ATTRITION CONTRIBUTING FACTORS
-- =====================================

SELECT
MaritalStatus,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY MaritalStatus
ORDER BY Attrition_Count DESC;

SELECT
OverTime,
COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY OverTime
ORDER BY Attrition_Count DESC;
