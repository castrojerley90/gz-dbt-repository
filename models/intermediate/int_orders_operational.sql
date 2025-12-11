With orders_margin as (
    
    select *
    from {{ref("int_orders_margin")}}

),

shipping as (

    select * 
    from {{ref("stg_raw__ship")}}

)

select 
    om.orders_id
    , om.date_date
    , ROUND((om.margin + sh.shipping_fee - sh.logcost - sh.ship_cost),2) AS operational_margin
    , om.revenue
    , om.quantity
    , om.purchase_cost
    , om.margin 
    , sh.shipping_fee
    , sh.logcost
    , sh.ship_cost
from orders_margin as om
left join shipping as sh 
on om.orders_id = sh.orders_id