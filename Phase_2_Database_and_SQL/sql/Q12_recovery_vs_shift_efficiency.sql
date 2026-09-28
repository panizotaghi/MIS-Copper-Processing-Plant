-- Q12. Relationship between recovery indicators and shift efficiency
SELECT
    s.ReportingUnit,
    AVG(s.ShiftEfficiency) AS AvgEfficiency,
    AVG(r.RecoveryPercent) AS AvgRecovery
FROM ShiftReport AS s
JOIN RecoveryIndicators AS r ON s.ReportingUnit = r.IndicatorID
WHERE s.ReportDate BETWEEN '2025-01-01' AND '2025-06-30'
GROUP BY s.ReportingUnit
ORDER BY AvgRecovery DESC, AvgEfficiency DESC;
