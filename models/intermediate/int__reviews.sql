with reviews as (
    select
    *
    from {{ ref('stg__reviews') }}
)

select 
    review_id,
    listing_id,
    reviewer_id,
    date,
    reviewer_name,
    comments
from reviews