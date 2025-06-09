-- Create table
CREATE TABLE fitness_data (
    Id BIGINT,
    ActivityDate DATE,
    TotalSteps INT,
    TotalDistance FLOAT,
    VeryActiveDistance FLOAT,
    ModeratelyActiveDistance FLOAT,
    LightActiveDistance FLOAT,
    SedentaryActiveDistance FLOAT,
    VeryActiveMinutes INT,
    FairlyActiveMinutes INT,
    LightlyActiveMinutes INT,
    SedentaryMinutes INT,
    Calories INT,
    TotalMinutesAsleep INT,
    TotalTimeInBed INT,
    WeightKg FLOAT,
    BMI FLOAT,
    IsManualReport VARCHAR(20),
    AvgHeartRate FLOAT,
    TotalMinuteSleepFromMinuteLog INT,
    TotalMETs FLOAT,
    HourlyStepTotal INT
);
-- View Table
select *
from fitness_data;



