with TBL as (
    select listing_id, count(comments) as cnt_comment
    from {{ ref('int__reviews') }}
    group by listing_id
),

n_perfeito as (
select 
	ir.listing_id, 
	TBL.cnt_comment,
	count(*) as "n_comments_w_perfect"
from {{ ref('int__reviews') }} ir
join TBL on ir.listing_id = TBL.listing_id 
where 
ir.comments ilike '%perfect%' or ir.comments ilike '%perfeito%'
group by 
ir.listing_id, TBL.cnt_comment
order by 
count(*) desc

),
final as (
	select 
	listing_id,
	cnt_comment,
	n_comments_w_perfect,
	round(n_comments_w_perfect::numeric / cnt_comment * 100, 2) as percentage
	from n_perfeito
	where cnt_comment >= 10
	order by percentage DESC
)

select * from final
