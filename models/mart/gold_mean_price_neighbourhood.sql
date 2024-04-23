with listings_silver as (
    select * from {{ref('int__listings')}}
),
final as (
    select 
        listing_neighbourhood, 
        avg(listing_price) as media_preco 
    from listings_silver
    group by 1
    order by 2 desc
)

select * from final