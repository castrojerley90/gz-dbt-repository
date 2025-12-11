With sales_margin as (
    
    select *
    from {{ref("int_sales_margin")}}

)

select 
    orders_id
    , DATE(date_date) AS date_date
    , revenue
    , quantity
    , purchase_cost
    , margin
from sales_margin
