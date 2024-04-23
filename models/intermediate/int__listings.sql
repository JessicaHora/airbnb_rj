with listings as (

    select * from {{ ref('stg__listings') }}
),
fill_null as (

    select
        listing_id,
        listing_url,
        listing_scrape_id,
        listing_last_scraped,
        listing_source,
        listing_name,
        coalesce(neighborhood_overview, '') as neighborhood_overview,
        listing_picture_url,
        listing_host_id,
        listing_host_url,
        listing_host_name,
        listing_host_since,
        coalesce(listing_host_location, '') as listing_host_location,
        coalesce(listing_host_about, '') as listing_host_about,
        coalesce(listing_host_response_time, '') as listing_host_response_time,
        coalesce(listing_host_response_rate, '') as listing_host_response_rate,
        coalesce(listing_host_acceptance_rate, '') as listing_host_acceptance_rate,
        listing_host_is_superhost,
        listing_host_thumbnail_url,
        listing_host_picture_url,
        coalesce(listing_host_neighbourhood, '') as listing_host_neighbourhood,
        listing_host_listings_count,
        listing_host_total_listings_count,
        listing_host_verifications, -- TODO: parse this
        listing_host_has_profile_pic,
        listing_host_identity_verified,
        -- listing_neighbourhood,
        listing_neighbourhood_cleansed as listing_neighbourhood,
        listing_latitude,
        listing_longitude,
        listing_property_type,
        listing_room_type,
        listing_accommodates,
        coalesce(listing_bathrooms, 0) as listing_bathrooms,
        listing_bathrooms_text,
        coalesce(listing_beds, 1) as listing_beds, -- has nulls
        listing_amenities, -- TODO: parse this
        REPLACE(REPLACE(listing_price, ',', ''), '$', '')::real as listing_price, 
        listing_minimum_nights
        listing_maximum_nights,
        listing_minimum_minimum_nights,
        listing_maximum_minimum_nights,
        listing_minimum_maximum_nights,
        listing_maximum_maximum_nights,
        listing_minimum_nights_avg_ntm,
        listing_maximum_nights_avg_ntm,
        listing_calendar_updated,
        listing_has_availability,
        listing_availability_30,
        listing_availability_60,
        listing_availability_90,
        listing_availability_365,
        listing_calendar_last_scraped,
        listing_number_of_reviews,
        listing_number_of_reviews_ltm,
        listing_number_of_reviews_l30d,
        listing_first_review,
        listing_last_review,
        case when listing_first_review is null then 0 else 1 end as listing_has_reviews,
        listing_review_scores_rating,
        listing_review_scores_accuracy,
        listing_review_scores_cleanliness,
        listing_review_scores_checkin,
        listing_review_scores_communication,
        listing_review_scores_location,
        listing_review_scores_value

    from listings
    where listing_price is not null
    and listing_has_availability = 't'
)

select * from fill_null