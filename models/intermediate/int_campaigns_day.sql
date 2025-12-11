With int_campaigns as (
    
    select *
    from {{ref("int_campaigns")}}

)

select
    date_date
    , paid_source
    , SUM(impression) AS total_impression
    , SUM(ads_cost) AS total_ads_cost
    , SUM(click) AS total_clicks
from int_campaigns
group by date_date, paid_source
order by date_date DESC 