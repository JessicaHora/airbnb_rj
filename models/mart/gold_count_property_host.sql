with listings_silver as (
    select * from {{ref('int__listings')}}
),

final as (
select
	listing_host_id,
	listing_host_name,
	count(*) as contagem_imoveis
from listings_silver
group by 1,2
order by 3 desc
)

select * from final