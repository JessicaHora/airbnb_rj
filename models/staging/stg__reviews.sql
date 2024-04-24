with source as (
      select * from {{ source('air_rj', 'bronze_reviews') }}
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