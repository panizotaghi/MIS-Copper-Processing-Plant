-- Q4. Material consumption vs. shift efficiency
-- Material consumed per type and unit, next to the average efficiency of that unit's shifts.
SELECT
    MaterialType,
    SUM(Weight) AS MaterialConsumed,
    (SELECT AVG(ShiftEfficiency)
     FROM ShiftReport
     WHERE UnitID = m.UnitID) AS AvgEfficiency
FROM MaterialFlow AS m
WHERE [Date] BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY MaterialType, UnitID
ORDER BY MaterialConsumed DESC;
