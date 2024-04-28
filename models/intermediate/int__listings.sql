WITH listings AS (
    SELECT * FROM {{ ref('stg__listings') }}
),
fill_null AS (
    SELECT
        listing_id,
        listing_url,
        listing_host_id,
        listing_host_name,
        listing_host_neighbourhood,
        listing_host_listings_count,
        listing_host_total_listings_count,
        listing_neighbourhood_cleansed AS listing_neighbourhood,
        listing_property_type,
        listing_room_type,
        listing_accommodates,
        COALESCE(listing_bathrooms, 1) AS listing_bathrooms,
        REGEXP_SUBSTR(listing_bathrooms_text , '\d+(\.\d+)?') AS num_baths,
        REPLACE(REPLACE(listing_price, ',', ''), '$', '')::REAL AS listing_price, 
        listing_minimum_nights,
        listing_maximum_nights,
        listing_has_availability,
        listing_number_of_reviews,
        listing_number_of_reviews_ltm,
        listing_number_of_reviews_l30d,
        listing_first_review,
        listing_last_review,
        CASE WHEN listing_first_review IS NULL THEN 0 ELSE 1 END AS listing_has_reviews,
        listing_review_scores_rating,
        listing_review_scores_cleanliness,
        listing_review_scores_checkin,
        listing_review_scores_communication,
        listing_review_scores_location,
        listing_review_scores_value
    FROM listings
    WHERE listing_price IS NOT NULL
),
duplicated AS (
    SELECT 
        *,
        ROW_NUMBER() OVER (PARTITION BY 
        listing_host_id, 
        listing_host_name, 
        listing_number_of_reviews, 
        listing_price, 
        listing_first_review, 
        listing_last_review, 
        listing_property_type, 
        listing_room_type, 
        listing_accommodates, 
        listing_bathrooms, 
        num_baths, 
        listing_number_of_reviews_ltm, 
        listing_number_of_reviews_l30d  ORDER BY listing_id) AS row_num
    FROM fill_null
)
SELECT 
    f.*
FROM 
    fill_null f
JOIN 
    duplicated d ON f.listing_host_id = d.listing_host_id
WHERE 
    d.row_num = 1
