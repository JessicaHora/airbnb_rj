with source as (
      select * from {{ source('air_rj', 'bronze_calendar') }}
),
renamed as (
    select
        {{ adapter.quote("listing_id") }},
        {{ adapter.quote("date") }} ,
        {{ adapter.quote("available") }},
        {{ adapter.quote("price") }},
        {{ adapter.quote("adjusted_price") }},
        {{ adapter.quote("minimum_nights") }},
        {{ adapter.quote("maximum_nights") }}

    from source
)
select * from renamed
