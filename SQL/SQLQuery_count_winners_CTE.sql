-- use CTE
WITH winners AS (
    SELECT
        CASE WHEN cum_return > 0 THEN 1 ELSE 0 END AS IsPositive
    FROM strategy_table
)

SELECT
    SUM(IsPositive) AS PositiveCount,
    COUNT(*) AS TotalCount,
    100.0 * SUM(IsPositive) / COUNT(*) AS PositivePercentage
FROM winners;
