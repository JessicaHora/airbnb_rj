with copa_leblon_ipa as (
select 
date,
sum(case when listing_neighbourhood = 'Copacabana' then c.listing_price end) as sum_copacabana,
sum(case when listing_neighbourhood = 'Leblon' then c.listing_price end) as sum_leblon,
sum(case when listing_neighbourhood = 'Ipanema' then c.listing_price end) as sum_ipanema
from {{ ref('int__listings') }} l
join {{ ref('int__calendar') }} c on l.listing_id = c.listing_id
where listing_neighbourhood in ('Copacabana', 'Leblon', 'Ipanema')
group by 1
),
total as (
select
*,
sum_copacabana + sum_leblon + sum_ipanema as total
from copa_leblon_ipa
)


select 
date,
sum_copacabana / total as pct_copacabana,
sum_leblon / total as pct_leblon,
sum_ipanema / total as pct_ipanema
from total