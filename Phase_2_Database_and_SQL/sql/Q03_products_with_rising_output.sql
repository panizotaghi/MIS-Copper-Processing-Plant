-- Q3. Products with an increasing production trend
-- Days on which a product's quantity rose compared with its previous record.
SELECT
    ProductName,
    [Date],
    Quantity,
    QuantityChange
FROM (
    SELECT
        ProductName,
        [Date],
        Quantity,
        Quantity - LAG(Quantity) OVER (PARTITION BY ProductName ORDER BY [Date]) AS QuantityChange
    FROM ProductFlow
    WHERE [Date] BETWEEN '2025-01-01' AND '2025-06-01'
) AS SubQuery
WHERE QuantityChange > 0
ORDER BY ProductName, [Date];
