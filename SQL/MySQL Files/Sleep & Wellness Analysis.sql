-- Sleep & Wellness Analysis
-- Q1. What is the average sleep duration per user?
SELECT Id, ROUND(AVG(TotalMinutesAsleep), 2) AS Avg_Sleep_Minutes
FROM fitness_data
GROUP BY Id
HAVING Avg_Sleep_Minutes > 0.00;

-- Q2. What is the average time in bed vs. time asleep?
SELECT 
  ROUND(AVG(TotalTimeInBed), 2) AS Avg_Time_InBed,
  ROUND(AVG(TotalMinutesAsleep), 2) AS Avg_Minutes_Asleep,
  ROUND((AVG(TotalMinutesAsleep) / AVG(TotalTimeInBed)) * 100, 2) AS Sleep_Efficiency_Percent
FROM fitness_data;

-- Q3. Do users burn more calories on days with longer sleep?
SELECT 
  ROUND(AVG(Calories)) AS Avg_Calories_ShortSleep,
  ROUND(AVG(CASE WHEN TotalMinutesAsleep >= 420 THEN Calories ELSE NULL END)) AS Avg_Calories_LongSleep
FROM fitness_data;

-- Q4. What is the average sleep duration by day of the week?
SELECT 
  DAYNAME(ActivityDate) AS Day_Name,
  ROUND(AVG(TotalMinutesAsleep), 2) AS Avg_Sleep_Minutes
FROM fitness_data
GROUP BY Day_Name
ORDER BY FIELD(Day_Name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- Q5. How many days per user did they log sleep?
SELECT Id, COUNT(*) AS Sleep_Log_Days
FROM fitness_data
WHERE TotalMinutesAsleep > 0
GROUP BY Id
ORDER BY Sleep_Log_Days DESC;

-- Q6. What is the sleep efficiency distribution across users?
SELECT 
  Id,
  ROUND(AVG(TotalMinutesAsleep / TotalTimeInBed) * 100, 2) AS Avg_Sleep_Efficiency
FROM fitness_data
WHERE TotalTimeInBed > 0
GROUP BY Id
ORDER BY Avg_Sleep_Efficiency DESC;




