with listings_silver as (
    select * from {{ref('int__listings')}}
),

final as (
select 
	listing_host_id,
	listing_host_name,
	avg(listing_review_scores_rating) as media_avaliacao
from listings_silver
group by 1,2
having avg(listing_review_scores_rating) is not null
order by 2 desc
)

select * from final