WITH CTE AS (
SELECT

to_timestamp(started_at) AS STARTED_AT,
DATE(to_timestamp(started_at)) AS DATE_STARTED_AT,
HOUR(to_timestamp(started_at)) AS HOUR_STARTED_AT,
dayname(to_timestamp(started_at)),
CASE 
WHEN dayname(to_timestamp(started_at)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BusinessDay'
END AS DAY_TYPE,
CASE WHEN 
MONTH(to_timestamp(started_at)) in (12,1,2) THEN 'WINTER'
WHEN MONTH(to_timestamp(started_at)) in (3,4,5) THEN 'SPRING'
WHEN MONTH(to_timestamp(started_at)) in (6,7,8) THEN 'AUTUMN'
ELSE 'Summer' END AS STATION_OF_YEAR

from 
{{ source('demo', 'bike') }}
where started_at  !='started_at'
)

select * from CTE

