WITH calendar AS (
    SELECT * FROM {{ ref('stg__calendar') }}
),
deduplicated_calendar AS (
    SELECT 
        calendar_id,
        listing_id,
        date,
        available,
        REPLACE(REPLACE(price, ',', ''), '$', '')::REAL AS listing_price, 
        adjusted_price,
        minimum_nights,
        maximum_nights,
        ROW_NUMBER() OVER (PARTITION BY listing_id, date ORDER BY calendar_id) AS row_num
    FROM calendar
)

SELECT 
    calendar_id,
    listing_id,
    date,
    available,
    listing_price,
    adjusted_price,
    minimum_nights,
    maximum_nights
FROM 
    deduplicated_calendar
WHERE 
    row_num = 1
