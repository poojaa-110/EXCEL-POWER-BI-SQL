use workforce_analytics;
-- 1) Total Employees:
SELECT COUNT(*) AS Total_Employees
FROM employee;

-- 2) Total Payroll:

SELECT
ROUND(SUM(Salary),2) AS Total_Payroll
FROM employee;

-- 3) Average salary:
SELECT
ROUND(AVG(Salary),2) AS Average_Salary
FROM employee;

-- 4) Highest salary:
SELECT
MAX(Salary) AS Highest_Salary
FROM employee;

-- 5) Lowest salary:
SELECT
MIN(Salary) AS Lowest_Salary
FROM employee;

-- 6) Average experience:
SELECT
ROUND(AVG(Experience_Year),2) AS Average_Experience
FROM employee;

-- 7) Average age:
SELECT
ROUND(AVG(Age),2) AS Average_Age
FROM employee;

-- 8) Employees by Department:
SELECT
Department,
COUNT(*) AS Total_Employees
FROM employee
GROUP BY Department
ORDER BY Total_Employees DESC;

-- 9) Employees by gender:
SELECT
Gender,
COUNT(*) AS Employees
FROM employee
GROUP BY Gender;

-- 10) Employees by city:
SELECT
City,
COUNT(*) AS Employees
FROM employee
GROUP BY City
ORDER BY Employees DESC;

-- 10) Employees by Employement type:
SELECT
Employment_Type,
COUNT(*) AS Employees
FROM employee
GROUP BY Employment_Type;

-- 11) Employees by Salary Band;
SELECT
Salary_Band,
COUNT(*) AS Employees
FROM employee
GROUP BY Salary_Band;

-- 12) Employees by tenure category;
SELECT
Tenure_Category,
COUNT(*) AS Employees
FROM employee
GROUP BY Tenure_Category;

-- 13) Average Salary by Department:
SELECT
Department,
ROUND(AVG(Salary),2) AS Average_Salary
FROM employee
GROUP BY Department
ORDER BY Average_Salary DESC;

-- 14) Total Payroll by Department:
SELECT
Department,
ROUND(SUM(Salary),2) AS Payroll
FROM employee
GROUP BY Department
ORDER BY Payroll DESC;

-- 15) Highest Paid Employee:
SELECT
Employee_Name,
Department,
Salary
FROM employee
ORDER BY Salary DESC
LIMIT 1;

-- 16) Top 10 Highest Paid Employees:
SELECT
Employee_Name,
Department,
Salary
FROM employee
ORDER BY Salary DESC
LIMIT 10;

-- 17) Salary Statistics:
SELECT
COUNT(*) AS Employees,
ROUND(AVG(Salary),2) AS Average_Salary,
MIN(Salary) AS Lowest_Salary,
MAX(Salary) AS Highest_Salary,
ROUND(SUM(Salary),2) AS Total_Payroll
FROM employee;

-- 1)Total Attendance Records:
SELECT COUNT(*) AS Total_Attendance_Records
FROM attendance;

-- 2) Overall Attendance Percentage:
SELECT
ROUND(
COUNT(CASE WHEN Present='Yes' THEN 1 END) * 100.0 / COUNT(*),
2
) AS Attendance_Percentage
FROM attendance;

-- 3) Total Present Days:
SELECT
COUNT(*) AS Total_Present_Days
FROM attendance
WHERE Present='Yes';

-- 4) Total Absent Days:
SELECT
COUNT(*) AS Total_Absent_Days
FROM attendance
WHERE Present='No';

-- 5)Attendance Status Distribution:
SELECT
Attendance_Status,
COUNT(*) AS Total
FROM attendance
GROUP BY Attendance_Status;

-- 6) Average Working Hours:
SELECT
ROUND(AVG(Work_Hours),2) AS Avg_Work_Hours
FROM attendance;

-- 7) Average Overtime Hours:
SELECT
ROUND(AVG(Overtime_Hours),2) AS Avg_Overtime
FROM attendance;

-- 8) Attendance by Department:
SELECT e.Department,
       ROUND(
       COUNT(CASE WHEN a.Present='Yes' THEN 1 END)*100.0/COUNT(*),2
       ) AS Attendance_Percentage
FROM attendance a
JOIN employee e
ON a.Employee_ID=e.Employee_ID
GROUP BY e.Department
ORDER BY Attendance_Percentage DESC;

-- 9) Overtime by Department:
SELECT e.Department,
       SUM(a.Overtime_Hours) AS Total_Overtime
FROM attendance a
JOIN employee e
ON a.Employee_ID=e.Employee_ID
GROUP BY e.Department
ORDER BY Total_Overtime DESC;

-- 10) Top 10 Employees with Highest Overtime:
SELECT e.Employee_Name,
       e.Department,
       SUM(a.Overtime_Hours) AS Total_Overtime
FROM attendance a
JOIN employee e
ON a.Employee_ID=e.Employee_ID
GROUP BY e.Employee_Name,e.Department
ORDER BY Total_Overtime DESC
LIMIT 10;

-- 11) Leave Type Analysis:
SELECT Leave_Type,
       COUNT(*) AS Total_Leaves
FROM attendance
WHERE Leave_Type IS NOT NULL
GROUP BY Leave_Type
ORDER BY Total_Leaves DESC;

-- 12) Average Productivity by Department:
SELECT e.Department,
       ROUND(AVG(p.Productivity),2) AS Avg_Productivity
FROM performance p
JOIN employee e
ON p.Employee_ID=e.Employee_ID
GROUP BY e.Department
ORDER BY Avg_Productivity DESC;

-- 12. Attrition Risk Distribution:
SELECT Attrition_Risk,
       COUNT(*) AS Employee
FROM performance
GROUP BY Attrition_Risk;

-- 13. Top 10 Most Productive Employees:
SELECT e.Employee_Name,
       p.Productivity
FROM performance p
JOIN employee e
ON p.Employee_ID=e.Employee_ID
ORDER BY Productivity DESC
LIMIT 10;

-- 14. Average Manager Rating by Department:
SELECT e.Department,
       ROUND(AVG(p.Manager_Rating),2) AS Avg_Rating
FROM performance p
JOIN employee e
ON p.Employee_ID=e.Employee_ID
GROUP BY e.Department
ORDER BY Avg_Rating DESC;

-- 15. Performance Category Distribution:
SELECT Performance_Category,
       COUNT(*) AS Employees
FROM performance
GROUP BY Performance_Category;

-- 17. Department with Highest Productivity:
SELECT e.Department,
       ROUND(AVG(p.Productivity),2) AS Avg_Productivity
FROM employee e
JOIN performance p
ON e.Employee_ID=p.Employee_ID
GROUP BY e.Department
ORDER BY Avg_Productivity DESC
LIMIT 1;

-- 18. Employees with High Attrition Risk:
SELECT e.Employee_Name,
       e.Department,
       p.Attrition_Risk
FROM employee e
JOIN performance p
ON e.Employee_ID=p.Employee_ID
WHERE p.Attrition_Risk='High';

