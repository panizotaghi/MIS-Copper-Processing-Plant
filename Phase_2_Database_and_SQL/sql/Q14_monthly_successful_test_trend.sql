-- Q14. Monthly trend of successful chemical tests
SELECT
    FORMAT(TestDate, 'yyyy-MM') AS [Month],
    COUNT(*) AS SuccessfulTests,
    COUNT(*) - LAG(COUNT(*)) OVER (ORDER BY FORMAT(TestDate, 'yyyy-MM')) AS ChangeFromPrevMonth
FROM ChemicalAnalysis
WHERE TestResult = 0
  AND TestDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY FORMAT(TestDate, 'yyyy-MM')
ORDER BY [Month];
