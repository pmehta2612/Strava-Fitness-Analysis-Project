-- Heart Health & Acitvity Intensity Analysis
-- Q1. What is the average heart rate per user?
SELECT Id, ROUND(AVG(AvgHeartRate), 2) AS Avg_Heart_Rate
FROM fitness_data
WHERE AvgHeartRate IS NOT NULL
GROUP BY Id;

-- Q2. Which users are burning the most calories through very active minutes?
SELECT Id, SUM(VeryActiveMinutes) AS Total_Active_Mins, SUM(Calories) AS Total_Calories
FROM fitness_data
GROUP BY Id
ORDER BY Total_Active_Mins DESC
LIMIT 5;

-- Q3. What is the average duration of very active minutes per week?
SELECT WEEK(ActivityDate) AS Week_Number, ROUND(AVG(VeryActiveMinutes), 2) AS Avg_Active_Mins
FROM fitness_data
GROUP BY WEEK(ActivityDate);

-- Q4. What is the average heart rate during different activity intensity levels?
SELECT 
  ROUND(AVG(AvgHeartRate), 2) AS Avg_Heart_Rate,
  ROUND(AVG(VeryActiveMinutes), 2) AS Avg_VeryActive_Minutes,
  ROUND(AVG(FairlyActiveMinutes), 2) AS Avg_FairlyActive_Minutes,
  ROUND(AVG(LightlyActiveMinutes), 2) AS Avg_LightlyActive_Minutes
FROM fitness_data
WHERE AvgHeartRate IS NOT NULL;

-- Q5. How often do users engage in high-intensity activity (VeryActiveMinutes ≥ 30 mins)?
SELECT Id, COUNT(*) AS High_Intensity_Days
FROM fitness_data
WHERE VeryActiveMinutes >= 30
GROUP BY Id
ORDER BY High_Intensity_Days DESC;



