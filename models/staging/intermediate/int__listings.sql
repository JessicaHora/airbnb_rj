with listings as (

    select * from {{ ref('stg__listings') }}
)

select * from listings