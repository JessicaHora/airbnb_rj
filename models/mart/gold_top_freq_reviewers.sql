with reviews_silver as (
    SELECT * FROM {{ref('int__reviews')}}
),

final as (
select reviewer_id, reviewer_name, count(*)
from 
reviews_silver
group by reviewer_id, reviewer_name
order by count(*) DESC
)

select * from final