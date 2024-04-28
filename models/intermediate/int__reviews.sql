WITH reviews AS (
    SELECT * FROM {{ ref('stg__reviews') }}
),
deduplicated_reviews AS (
    SELECT 
        review_id,
        listing_id,
        reviewer_id,
        date,
        reviewer_name,
        comments,
        ROW_NUMBER() OVER (PARTITION BY listing_id, reviewer_id, date ORDER BY review_id) AS row_num
    FROM reviews
)
SELECT 
    review_id,
    listing_id,
    reviewer_id,
    date,
    reviewer_name,
    comments
FROM 
    deduplicated_reviews
WHERE 
    row_num = 1
