-- Metrics Comparison Analysis
-- Q1. What is the correlation between METs and calories burned?
SELECT 
  ROUND(AVG(TotalMETs), 2) AS Avg_METs,
  ROUND(AVG(Calories), 2) AS Avg_Calories
FROM fitness_data;

-- Q2. How consistent is a user's MET output across the week (Are METs evenly distributed)?
SELECT 
  Id,
  DAYNAME(ActivityDate) AS Day_Name,
  ROUND(AVG(TotalMETs), 2) AS Avg_METs
FROM fitness_data
WHERE TotalMETs IS NOT NULL
GROUP BY Id, Day_Name
ORDER BY Id, FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')
LIMIT 14;
