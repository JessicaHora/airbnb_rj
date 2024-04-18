with source as (
      select * from {{ source('air_rj', 'bronze_reviews') }}
),
renamed as (
    select
        *
    from source
)
select * from renamed
