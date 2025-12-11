
with operational_margin_table AS (
    
        select
            date_date AS date_date 
            , COUNT(DISTINCT orders_id) AS nb_transactions
            , ROUND(SUM(revenue),2) AS total_revenue
            , ROUND(SUM(operational_margin),2) AS operational_margin
            , ROUND(SUM(purchase_cost),2) AS total_purchase_cost
            , ROUND(SUM(shipping_fee),2) AS total_shipping_fees
            , ROUND(SUM(logcost),2) AS total_log_cost
            , SUM(quantity) AS nb_products_sold
        from {{ref("int_orders_operational")}}
        group by date_date 
)

select 
    date_date
    , nb_transactions
    , total_revenue
    , ROUND(SAFE_DIVIDE(nb_products_sold, nb_transactions),2) AS average_basket
    , operational_margin
    , total_purchase_cost
    , total_shipping_fees
    , total_log_cost
    , nb_products_sold
from operational_margin_table
order by date_date desc
