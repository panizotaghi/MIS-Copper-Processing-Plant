-- Q11. Shipment weight and count by destination and month
SELECT
    Destination,
    FORMAT(ShipDate, 'yyyy-MM') AS [Month],
    SUM(DryWeight) AS TotalWeight,
    COUNT(*) AS ShipmentCount
FROM Shipment
WHERE ShipDate BETWEEN '2025-01-01' AND '2025-06-01'
GROUP BY Destination, FORMAT(ShipDate, 'yyyy-MM')
ORDER BY [Month], TotalWeight DESC;
