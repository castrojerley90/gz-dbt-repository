With campaings_day_table as (
    
    select *
    from {{ref("int_campaigns_day")}}

),

finance_days_table as (

    select *
    from {{ref("finance_days")}}
)

select 

     c.date_date AS date
     , ROUND((f.operational_margin - c.total_ads_cost),2) AS ads_margin
     , f.average_basket
     , f.operational_margin
     , c.total_ads_cost AS ads_cost
     , c.total_impression AS ads_impression
     , c.total_clicks AS ads_clicks
     , f.nb_products_sold AS quantity
     , f.total_revenue AS revenue
     , f.total_purchase_cost AS purchase_cost
     , f.margin AS margin
     , f.total_shipping_fees AS shipping_fee
     , f.total_log_cost AS log_cost
     , f.ship_cost AS ship_cost

from campaings_day_table as c
join finance_days_table as f 
on c.date_date = f.date_date