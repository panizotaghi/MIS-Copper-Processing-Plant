-- Q1. Energy cost analysis by energy type and date
-- Total energy cost per day and its change from the previous day, for each energy type.
SELECT
    EnergyType,
    UsageDate,
    SUM(Cost) AS TotalCost,
    SUM(Cost) - LAG(SUM(Cost)) OVER (PARTITION BY EnergyType ORDER BY UsageDate) AS CostChange
FROM EnergyUsage
WHERE UsageDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY EnergyType, UsageDate
ORDER BY EnergyType, UsageDate;
