-- Q7. Average shift efficiency by month (six-month window)
SELECT
    CONCAT(YEAR(ReportDate), '-', RIGHT('0' + CAST(MONTH(ReportDate) AS NVARCHAR(2)), 2)) AS [Month],
    ReportingUnit,
    AVG(ShiftEfficiency) AS AvgEfficiency
FROM ShiftReport
WHERE ReportDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY YEAR(ReportDate), MONTH(ReportDate), ReportingUnit
ORDER BY [Month], AvgEfficiency DESC;
