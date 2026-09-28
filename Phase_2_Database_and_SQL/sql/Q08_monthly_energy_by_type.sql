-- Q8. Energy consumption by month and energy type (electricity, gas, water)
SELECT
    CONCAT(YEAR(UsageDate), '-', RIGHT('0' + CAST(MONTH(UsageDate) AS NVARCHAR(2)), 2)) AS [Month],
    EnergyType,
    SUM(Consumption) AS TotalConsumption
FROM EnergyUsage
WHERE UsageDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY YEAR(UsageDate), MONTH(UsageDate), EnergyType
ORDER BY [Month], EnergyType;
