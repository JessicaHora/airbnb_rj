with listings_silver as (
    SELECT * FROM {{ref('int__listings')}}
),

final as (  
    select 
        listing_neighbourhood, 
        round(avg(listing_review_scores_rating::numeric), 2)as "isting_review_scores_rating",
        round(avg(listing_review_scores_cleanliness::numeric), 2)as "listing_review_scores_cleanliness",
        round(avg(listing_review_scores_checkin::numeric), 2)as "listing_review_scores_checkin",
        round(avg(listing_review_scores_communication::numeric), 2)as "listing_review_scores_communication",
        round(avg(listing_review_scores_location::numeric), 2)as "listing_review_scores_location",
        round(avg(listing_review_scores_value::numeric), 2)as "listing_review_scores_value"
    from listings_silver
    group by listing_neighbourhood
)

SELECT * from final