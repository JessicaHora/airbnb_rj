with source as (

    select * from {{ source('air_rj', 'calendar_bronze') }}

),

renamed as (

    select
        row_number() over() as calendar_id,
        listing_id,
        date,
        available,
        price,
        adjusted_price,
        minimum_nights,
        maximum_nights

    from source

)

select * from renamed
