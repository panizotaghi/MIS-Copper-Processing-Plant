-- Q13. Daily change in shipment weight
SELECT
    ShipDate,
    SUM(DryWeight) AS DailyWeight,
    SUM(DryWeight) - LAG(SUM(DryWeight)) OVER (ORDER BY ShipDate) AS WeightChange
FROM Shipment
WHERE ShipDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY ShipDate
ORDER BY ShipDate;
