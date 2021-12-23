WITH season_results AS(
    SELECT
        res.driverId,
        year,
        SUM(points) as points_total
    FROM
        `poc-dbt-333912.f1.results` AS res
        INNER JOIN `poc-dbt-333912.f1.races` AS rc ON res.raceId = rc.raceId
    GROUP BY
        res.driverId,
        year
), season_ranking AS (
    SELECT
        driverId,
        year,
        points_total,
        RANK() OVER(PARTITION BY year ORDER BY points_total DESC) AS ranking
    FROM
        season_results
)
SELECT
    s.*,
    CONCAT(d.forename, " ", d.surname) AS full_name
FROM
    season_ranking s
    INNER JOIN `poc-dbt-333912.f1.drivers` d ON d.driverId = s.driverId
WHERE
    ranking = 1