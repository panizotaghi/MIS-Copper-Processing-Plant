-- Q2. Materials used most in high-efficiency shifts
-- Total weight of each material type processed by units whose shifts reached more than 80% efficiency.
SELECT
    m.MaterialType,
    SUM(m.Weight) AS TotalMaterialUsed
FROM MaterialFlow AS m
JOIN ShiftReport AS s ON m.UnitID = s.ReportingUnit
WHERE s.ShiftEfficiency > 80
  AND m.[Date] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY m.MaterialType
ORDER BY TotalMaterialUsed DESC;
