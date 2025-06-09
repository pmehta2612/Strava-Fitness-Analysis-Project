-- Weight & BMI Monitoring Analysis
-- Q1. What is the average BMI and weight across all users?
SELECT 
  ROUND(AVG(WeightKg), 2) AS Avg_WeightKg,
  ROUND(AVG(BMI), 2) AS Avg_BMI
FROM fitness_data
WHERE WeightKg IS NOT NULL AND BMI IS NOT NULL;

-- Q2. Which users have the highest recorded BMI?
SELECT Id, MAX(BMI) AS Max_BMI
FROM fitness_data
GROUP BY Id
ORDER BY Max_BMI DESC
LIMIT 5;

-- Q3. What is the distribution of users across BMI categories?
SELECT 
  CASE
    WHEN BMI < 18.5 THEN 'Underweight'
    WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
    WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
    WHEN BMI >= 30 THEN 'Obese'
    ELSE 'Unknown'
  END AS BMI_Category,
  COUNT(*) AS User_Count
FROM fitness_data
WHERE BMI IS NOT NULL
GROUP BY BMI_Category;

-- Q4. How often do users log their weight or BMI?
SELECT Id, COUNT(*) AS Weight_Log_Frequency
FROM fitness_data
WHERE WeightKg IS NOT NULL
GROUP BY Id
ORDER BY Weight_Log_Frequency DESC;

-- Q5. What is the correlation between BMI and activity level?
SELECT BMI, ROUND(AVG(TotalSteps),0) AS Avg_Steps
FROM fitness_data
WHERE BMI IS NOT NULL
GROUP BY BMI
ORDER BY BMI;
