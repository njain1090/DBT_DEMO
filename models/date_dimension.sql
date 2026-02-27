WITH CTE AS (
SELECT

to_timestamp(started_at) AS STARTED_AT,
DATE(to_timestamp(started_at)) AS DATE_STARTED_AT,
HOUR(to_timestamp(started_at)) AS HOUR_STARTED_AT,
dayname(to_timestamp(started_at)),
{{day_type('started_at')}} AS DAY_TYPE,
{{getseason('started_at')}} AS STATION_OF_YEAR

from 
{{ source('demo', 'bike') }}
where started_at  !='started_at'
)

select * from CTE

