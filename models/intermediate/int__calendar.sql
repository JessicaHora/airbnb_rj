with calendar as (
    select *
    from {{ ref('stg__calendar') }}
),
final as (
    select 
        listing_id,
        date,
        available,
        price,
        adjusted_price,
        minimum_nights,
        maximum_nights
    from calendar
)

select * from final