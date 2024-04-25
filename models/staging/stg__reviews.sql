with source as (
      select * from {{ source('air_rj', 'reviews_bronze') }}
),
renamed as (
    select
        id as review_id,
        "listing_id",
        "reviewer_id",

        "date",
        "reviewer_name",
        "comments"
    from source
)
select * from renamed