with copa_leblon_ipa as (
select 
date,
avg(case when listing_neighbourhood = 'Copacabana' then c.listing_price end) as media_copacabana,
avg(case when listing_neighbourhood = 'Leblon' then c.listing_price end) as media_leblon,
avg(case when listing_neighbourhood = 'Ipanema' then c.listing_price end) as media_ipanema
from {{ ref('int__listings') }} l
join {{ ref('int__calendar') }} c on l.listing_id = c.listing_id
where listing_neighbourhood in ('Copacabana', 'Leblon', 'Ipanema')
group by 1
)


select *
from copa_leblon_ipa