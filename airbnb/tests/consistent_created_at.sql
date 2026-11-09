select
    l.listing_id,
    l.created_at,
    r.review_date
from {{ ref('dim_listings_cleansed') }} l
join {{ ref('fct_reviews') }} r
    on l.listing_id = r.listing_id
where l.created_at > r.review_date
-- reviews should be after listing created; check reverse for anamoly records (where reviews are before listings created)