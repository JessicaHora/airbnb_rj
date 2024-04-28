WITH reviews_silver as (
    SELECT * FROM {{ref('int__reviews')}}
),

final as (
    select 
        listing_id, count(*) 
    from reviews_silver  
    group by listing_id
    order by count desc
)

SELECT * FROM final