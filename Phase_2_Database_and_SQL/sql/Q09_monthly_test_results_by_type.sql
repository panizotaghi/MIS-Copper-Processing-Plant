-- Q9. Test results by test type and month
-- Total, successful and unsuccessful tests (TestResult: 0 = successful, 1 = unsuccessful).
SELECT
    TestType,
    FORMAT(TestDate, 'yyyy-MM') AS [Month],
    COUNT(*) AS TotalTests,
    SUM(CASE WHEN TestResult = 0 THEN 1 ELSE 0 END) AS SuccessfulTests,
    SUM(CASE WHEN TestResult = 1 THEN 1 ELSE 0 END) AS UnsuccessfulTests
FROM ChemicalAnalysis
WHERE TestDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY TestType, FORMAT(TestDate, 'yyyy-MM')
ORDER BY [Month], TestType;
