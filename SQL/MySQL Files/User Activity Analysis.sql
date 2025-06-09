-- 1. User Activity Analysis 
-- Q1. Who are the top 5 most active users by total steps?
SELECT Id, SUM(TotalSteps) AS TotalSteps
FROM fitness_data
GROUP BY Id
ORDER BY TotalSteps DESC
LIMIT 5;

-- Q2. What is the average number of steps per user per day?
SELECT Id, ROUND(AVG(TotalSteps), 2) AS Avg_Steps_PerDay
FROM fitness_data
GROUP BY Id;


-- Q3. Which dates did the average user burn the most calories?
SELECT ActivityDate, dayname(ActivityDate) as Acitivity_Day, ROUND(AVG(Calories), 2) AS Avg_Calories
FROM fitness_data
GROUP BY ActivityDate
ORDER BY Avg_Calories DESC
LIMIT 5;

-- Q4. How consistent are users with their activity (active days)?
SELECT Id, COUNT(DISTINCT ActivityDate) AS ActiveDays
FROM fitness_data
GROUP BY Id;

-- Q5. How many users consistently track their weight or sleep?
SELECT Id, COUNT(*) AS Days_With_Weight
FROM fitness_data
WHERE WeightKg IS NOT NULL
GROUP BY Id
HAVING Days_With_Weight >= 5;







