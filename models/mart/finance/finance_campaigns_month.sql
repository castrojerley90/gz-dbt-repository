With campaings_day_table as (
    
    select 
        DATE_TRUNC(date, MONTH) AS datemonth,
        ads_margin,
        average_basket,
        operational_margin,
        ads_cost,
        ads_impression,
        ads_clicks,
        quantity,
        revenue,
        purchase_cost,
        margin,
        shipping_fee,
        log_cost,
        ship_cost
    from {{ref("finance_campaigns_day")}}

)

select 

       datemonth
     , ROUND(SUM(ads_margin),2) AS ads_margin
     , ROUND(SUM(average_basket),2) AS average_basket
     , ROUND(SUM(operational_margin),2) AS operational_margin
     , ROUND(SUM(ads_cost),2) AS ads_cost
     , ROUND(SUM(ads_impression),2) AS ads_impression
     , ROUND(SUM(ads_clicks),2) AS ads_clicks
     , ROUND(SUM(quantity),2) AS quantity
     , ROUND(SUM(revenue),2) AS revenue
     , ROUND(SUM(purchase_cost),2) AS purchase_cost
     , ROUND(SUM(margin),2) AS margin
     , ROUND(SUM(shipping_fee),2) AS shipping_fee
     , ROUND(SUM(log_cost),2) AS log_cost
     , ROUND(SUM(ship_cost),2) AS ship_cost

from campaings_day_table 
group by datemonth
order by datemonth DESC