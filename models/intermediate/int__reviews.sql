with reviews as (
    select
    *
    from {{ ref('stg__reviews') }}
)

select 
    {{dbt_utils.star(from = ref('stg__reviews'))}}
from reviews