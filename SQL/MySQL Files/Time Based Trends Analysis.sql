-- Time Based Trends Analysis
-- Q1. What is the weekly average calorie burn?
SELECT 
  WEEK(ActivityDate) AS Week_Number,
  ROUND(AVG(Calories), 2) AS Avg_Calories
FROM fitness_data
GROUP BY WEEK(ActivityDate)
ORDER BY Week_Number;

-- Q2. Compare average steps on weekdays vs weekends
SELECT 
  CASE 
    WHEN DAYOFWEEK(ActivityDate) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS Day_Type,
  ROUND(AVG(TotalSteps), 2) AS Avg_Steps
FROM fitness_data
GROUP BY Day_Type;

-- Q3. Which users are improving (weight or BMI decreasing over time)?
SELECT Id, MIN(ActivityDate) AS Star_Date, MAX(ActivityDate) AS End_Date,
       MIN(WeightKg) AS Start_Weight, MAX(WeightKg) AS End_Weight
FROM fitness_data
WHERE WeightKg IS NOT NULL
GROUP BY Id;

-- Q4. How does average daily step count vary across days of the week?
SELECT 
  DAYNAME(ActivityDate) AS Day_Name,
  ROUND(AVG(TotalSteps), 2) AS Avg_Steps
FROM fitness_data
GROUP BY Day_Name
ORDER BY FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Q5. How has user participation changed week over week?
SELECT 
  WEEK(ActivityDate) AS Week_Number,
  COUNT(DISTINCT Id) AS Active_Users
FROM fitness_data
GROUP BY Week_Number
ORDER BY Week_Number;





