-- Q10. Recovery processes with the most successful results
-- Counts recovery records whose matching chemical test succeeded, with the average recovery rate.
SELECT
    ProcessType,
    COUNT(*) AS SuccessCount,
    AVG(RecoveryPercent) AS AvgRecovery
FROM RecoveryIndicators
WHERE IndicatorID IN (
    SELECT TestID
    FROM ChemicalAnalysis
    WHERE TestResult = 0
)
GROUP BY ProcessType
ORDER BY SuccessCount DESC, AvgRecovery DESC;
